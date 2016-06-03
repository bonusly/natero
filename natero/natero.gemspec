# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'natero/version'

Gem::Specification.new do |spec|
  spec.name          = 'natero'
  spec.version       = Natero::VERSION
  spec.authors       = 'Andrew Brown'
  spec.email         = 'abbrown22@gmail.com'
  spec.summary       = 'Wrapper for Natero API'
  spec.description   = %q{
    Natero is customer success software used to reduce churn and increase B2B SaaS adoption.
  }
  spec.homepage      = 'http://bonus.ly'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = 'lib'

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake'', ''~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
