# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ribbon/version'

Gem::Specification.new do |gem|
  gem.name          = "ribbon-gem"
  gem.version       = Ribbon::VERSION
  gem.authors       = ["MJ Jalali"]
  gem.email         = ["mjjalali@gmail.com"]
  gem.description   = %q{Ribbon ruby gem}
  gem.summary       = %q{Ribbon ruby gem}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency('rest-client', '~> 1.6.7')
  gem.add_dependency('json',        '~> 1.7.7')
end
