# frozen_string_literal: true

module BootstrapHelper
  def menu_item(name = nil, path = '#', *args, &block)
    path = name || path if block_given?
    options = args.extract_options!
    options[:class] = [options[:class], 'nav-link'].join(' ')
    content_tag :li, class: "nav-item #{is_active?(path, options)}" do
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
      menu_item route do
        concat icon_element icon
        concat ' '
        concat title
        if number && number != 0
          concat ' '
          concat(content_tag(:span, number.to_s, class: 'badge danger'))
        end
      end
    else
      menu_item title, route
    end
  end

  private

  def is_active?(path, options = {})
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
    if !options[:method].nil? || !options['data-method'].nil?
      :inactive
    elsif uri == request_uri || (options[:root] && (request_uri == '/') || (request_uri == root_url))
      :active
    else
      if request_uri.start_with?(uri) && !root
        :chosen
      else
        :inactive
      end
    end
  end
end
