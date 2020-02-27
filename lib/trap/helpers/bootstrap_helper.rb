# frozen_string_literal: true

module BootstrapHelper
  def menu_item(name = nil, path = '#', *args, &block)
    path = name || path if block_given?
    options = args.extract_options!
    options[:class] = [options[:class], 'nav-link'].join(' ')
    content_tag :li, class: "nav-item #{active?(path, options)}" do
      if block_given?
        name = path
        path = options
      end
      link_to name, path, options, &block
    end
  end

  def model_menu_item(model:, route:, icon: nil, number: nil, pluralize: nil)
    title = model.is_a?(Class) ? (pluralize || model.model_name.human.pluralize(:ru)) : model
    if icon
      build_menu_item_with_icon route: route, icon: icon, number: number, title: title
    else
      menu_item title, route
    end
  end

  def dropdown(text, icon = nil, &block)
    content_tag :li, class: 'nav-item dropdown' do
      build_a_tag_for_dropdown text: text, icon: icon, &block
    end
  end

  def dropdown_item(text, link)
    link_to(text, link, class: 'dropdown-item')
  end

  def dropdown_model_item(model:, route:, pluralize: nil)
    title = pluralize || model.model_name.human.pluralize(:ru)
    dropdown_item title, route
  end

  def dropdown_divider
    content_tag(:div, class: 'dropdown-divider') do
    end
  end

  private

  def active?(path, options = {})
    :active if uri_state(path, options).in? %i[active chosen]
  end

  def uri_state(uri, options = {})
    root_url = request.host_with_port + '/'
    root = uri == '/' || uri == root_url
    request_uri = if uri.start_with? root_url
                    request.url
                  else
                    request.path
                  end
    active_uri_state options: options, uri: uri, request_uri: request_uri, root_url: root_url, root: root
  end

  def build_menu_item_with_icon(route:, icon:, title:, number:)
    menu_item route do
      concat icon_element icon
      concat ' '
      concat title
      if number && number != 0
        concat ' '
        concat(content_tag(:span, number.to_s, class: 'badge danger'))
      end
    end
  end

  def build_a_tag_for_dropdown(text:, icon:, &block)
    concat(link_to('#', **dropdown_link_attributes(text)) do
      if icon
        concat content_tag :span, '', class: "glyphicon glyphicon-#{icon}"
        concat ' '
      end
      concat text
    end)
    concat(content_tag(:div, class: 'dropdown-menu', aria: { labelledby: text }) do
      yield(block)
    end)
  end

  def dropdown_link_attributes(text)
    {
      class: 'nav-link dropdown-toggle',
      id: text,
      role: :button,
      data: { toggle: :dropdown },
      aria: { haspopup: true, expanded: false }
    }
  end

  def active_uri_state(options:, uri:, request_uri:, root_url:, root:)
    if uri_state_is_inactive?(options: options)
      :inactive
    elsif uri_state_is_active?(request_uri: request_uri, options: options, root_url: root_url, uri: uri)
      :active
    else
      request_uri.start_with?(uri) && !root ? :chosen : :inactive
    end
  end

  def uri_state_is_inactive?(options:)
    !options[:method].nil? || !options['data-method'].nil?
  end

  def uri_state_is_active?(request_uri:, options:, root_url:, uri:)
    uri == request_uri || (options[:root] && (request_uri == '/') || (request_uri == root_url))
  end
end
