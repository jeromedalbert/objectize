# Objectize

This gem converts hashes into objects, so you can do `my_object.a.b.c`
instead of `my_hash['a']['b']['c']`. It works with deeply nested hashes and
arrays.

This can be useful for API responses and other nested data.

## Installation

Install the gem globally:

```
gem install objectize
```

Or add this line to your Gemfile:

```ruby
gem 'objectize'
```

and run `bundle install`.

## Usage

```ruby
my_object = Objectize.to_object(a: { b: { c: 'foo' } })
my_object.a.b.c #=> 'foo'
```

To revert an objectized element back to a basic type, you can do:

```ruby
my_hash = Objectize.to_basic_type(my_object)
my_hash['a']['b']['c'] #=> 'foo'
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jeromedalbert/objectize. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/jeromedalbert/objectize/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Objectize project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/jeromedalbert/objectize/blob/main/CODE_OF_CONDUCT.md).
