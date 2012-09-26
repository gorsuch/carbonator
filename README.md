# Carbonator

Carbonator is a simple toolkit for transforming `key=value` text streams into Carbon compatable inputs.

## Installation

Add this line to your application's Gemfile:

    gem 'carbonator'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install carbonator

## Usage

```bash
$ echo base=foo a=1 b=2 c=3 | carbonator 
foo.a 1
foo.b 2
foo.c 3
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
