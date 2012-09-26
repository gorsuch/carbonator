# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'carbonator/version'

Gem::Specification.new do |gem|
  gem.name          = "carbonator"
  gem.version       = Carbonator::VERSION
  gem.authors       = ["Michael Gorsuch"]
  gem.email         = ["michael.gorsuch@gmail.com"]
  gem.description   = %q{An experimental toolkit for transforming key=value text streams into Carbon compatable inputs.}
  gem.summary       = gem.description
  gem.homepage      = 'https://github.com/gorsuch/carbonator'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_development_dependency('rake')
  gem.add_development_dependency('rspec')
  gem.add_development_dependency('timecop')
  gem.add_dependency('kv', '0.0.5')
end
