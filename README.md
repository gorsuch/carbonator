# Carbonator

[![Build Status](https://secure.travis-ci.org/gorsuch/carbonator.png)](http://travis-ci.org/gorsuch/carbonator)

Carbonator is an experimental line filter that transforms log lines into [graphte / carbon](https://graphite.readthedocs.org/en/latest/) compatable inputs.

## Installation

Add this line to your application's Gemfile:

    gem 'carbonator'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install carbonator

## Usage

```bash
$ echo measure=foo.a value=1 | carbonator
foo.a 1 1348671182

# keys outside of measure, value or timestamp will be safely ignored
$ echo app=myapp measure=foo.a value=1 | carbonator
carbonator.foo.a 1 1348671186
```

You may wish to adjust the prefix.  As an example, you may want to add an API Key for [Hosted Graphite](http://hostedgraphite.com/):

```bash
$ export HOSTED_GRAPHITE_TOKEN=some-random-key
$ echo measure=foo.a value=1 | carbonator -p $HOSTED_GRAPHITE_TOKEN.measurements
some-random-key.measurements.foo.a 1 1348671211
```

And finally, since we're talking about command lines here, you can pipe this data straight to your Hosted Graphite installation like so:

```bash
$ echo measure=foo.a value=1 | carbonator -p $HOSTED_GRAPHITE_TOKEN | nc carbon.hostedgraphite.com 2003
```

## Credit

Everyone stands on the shoulders of giants.  I borrowed many of these conventions verbatim from [`ryandotsmith/l2met`](https://github.com/ryandotsmith/l2met).

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
