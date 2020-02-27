# Trap

Bootstrap helpers. Bootstrap 4.x compatible.

Use `trap 1.x` for Bootstrap 3.x compatible.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'trap'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install trap

## Usage

After installing you should add line to *application_helper.rb*

```ruby
module ApplicationHelper
  include Trap
end
```

## List of methods you can use with Trap

### Menu items

* menu_item
Bootstrap navbar item

```erb
<%= menu_item 'ButtonText', 'ButtonLink', class: 'some-classes', another_option: :value %>
```

Using `menu_item` instead of

```
<li>
  <a href="ButtonLink">
    ButtonText
  </a>
</li>
```

* model_menu_item
Bootstrap navbar item based on ActiveRecord

```erb
<%= model_menu_item model:, route:, icon:, number:, pluralize: %>
```

### Dropdown

You can create dropdowns with something like this:

```ruby
= dropdown t("admin.navbar.links.#{item.keys.first}") do
  = dropdown_item text, link
  = dropdown_divider
  = dropdown_model_item model: model, route: ::Tramway::Admin::Engine.routes.url_helpers.singleton_path(model: model)
```

## For Bootstrap 3

You should use `trap-1.x` versions to include Bootstrap 3. Contributing to `bootstrap-3` branch.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/trap/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
