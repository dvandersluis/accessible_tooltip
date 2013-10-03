# AccessibleTooltip

Rails helper for creating a balloon style tooltip that is WCAG compliant.

Based on the excellent [CSS tooltips](http://sixrevisions.com/css/css-only-tooltips/) by [Six Revisions](http://sixrevisions.com).

## Installation

Add this line to your application's Gemfile:

    gem 'accessible_tooltip'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install accessible_tooltip

## Usage

    <%= accessible_tooltip(:help, label: "Help Me", title: "Dogs & Foxes") do>
      The quick brown fox jumped over the lazy dog.
    <% end %>

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
