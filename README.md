# Trap

Bootstrap helpers. Bootsrap 4.x compatible.
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

List of methods you can use with Trap:

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

## For Bootstrap 

You should use `trap-1.x` versions to include Bootstrap 3. Contributing to `bootstrap-3` branch.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/trap/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
