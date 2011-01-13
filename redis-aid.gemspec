# -*- ruby -*-
$:.unshift(File.expand_path('../lib', __FILE__))
require 'redis/aid/version'

Gem::Specification.new do |s|
  s.name             = 'redis-aid'
  s.version          = Redis::Aid.version
  s.homepage         = 'http://github.com/nu7hatch/redis-aid'
  s.email            = ['chris@nu7hat.ch']
  s.authors          = ['Chris Kowalik']
  s.summary          = %q{The Redis first aid!}
  s.description      = %q{Small lib which helps with extending your classes or modules with redis (and nest) goodies.}
  s.files            = `git ls-files`.split("\n")
  s.test_files       = `git ls-files -- {spec}/*`.split("\n")
  s.require_paths    = %w[lib]
  s.extra_rdoc_files = %w[LICENSE README.rdoc]

  s.add_runtime_dependency 'redis',       [">= 2.0"]
  s.add_runtime_dependency 'nest',        [">= 0"]
  s.add_development_dependency 'rspec',   ["~> 2.0"]
  s.add_development_dependency 'mocha',   [">= 0.9"]
  s.add_development_dependency 'genspec', ["~> 0.1.1"]
end
