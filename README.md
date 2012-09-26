# Carbinator

Carbinator is a simple toolkit for transforming `key=value` text streams into Carbon compatable inputs.

## Installation

Add this line to your application's Gemfile:

    gem 'carbinator'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install carbinator

## Usage

```bash
$ echo base=foo bar=25 | carbinator 
foo.bar 25
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
