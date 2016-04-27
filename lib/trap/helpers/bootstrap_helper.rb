module BootstrapHelper
  def menu_item(name = nil, path = '#', *args, &block)
    path = name || path if block_given?
    options = args.extract_options!
    content_tag :li, class: is_active?(path, options) do
      name, path = path, options if block_given?
      link_to name, path, options, &block
    end
  end

  def dropdown(text, icon = nil, &block)
    content_tag :li, class: :drowdown do
      concat(link_to('#', class: 'dropdown-toggle', data: { toggle: :dropdown }) do
	if icon
	  concat icon_element icon
	  concat ' '
	end
	concat text
	unless icon
	  concat ' '
	  concat content_tag :span, '', class: :caret
	end
      end)
      concat(content_tag(:ul, class: 'dropdown-menu') do
	yield block
      end)
    end
  end

  def icon_element(name)
    content_tag :i, '', class: "fa fa-#{name}"
  end

  private

  def is_active?(path, options = {})
    :active if uri_state(path, options).in? [:active, :chosen]
  end

  def uri_state(uri, options = {})
    root_url = request.host_with_port + '/'
    root = uri == '/' || uri == root_url
    request_uri = if uri.start_with? root_url
                    request.url
                  else
                    request.path
                  end
    if !options[:method].nil? || !options["data-method"].nil?
      :inactive
    elsif uri == request_uri || (options[:root] && (request_uri == '/') || (request_uri == root_url))
      :active
    else
      if request_uri.start_with?(uri) and not(root)
        :chosen
      else
        :inactive
      end
    end
  end
end
