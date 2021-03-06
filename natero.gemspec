# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'natero/version'

Gem::Specification.new do |spec|
  spec.name          = 'natero'
  spec.version       = Natero::VERSION
  spec.authors       = ['Andrew Brown', 'Robert Ingrum']
  spec.email         = 'dev@bonus.ly'
  spec.summary       = 'Wrapper for Natero API'
  spec.description   = 'Natero is customer success software used to reduce churn and increase B2B SaaS adoption.'
  spec.homepage      = 'http://bonus.ly'
  spec.license       = 'MIT'
  spec.post_install_message = 'The Natero gem has been deprecated and will no longer be supported. Please switch to using the Freshworks gem. See https://rubygems.org/gems/freshworks and https://github.com/bonusly/freshworks.'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency             'httparty',             '~> 0.13'
  spec.add_development_dependency 'bundler',              '> 1.11'
  spec.add_development_dependency 'rake',                 '>= 12.3.3'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rack',                 '>= 2.0.8'
  spec.add_development_dependency 'rspec-rails'
  spec.add_development_dependency 'rails-html-sanitizer', '~> 1.0.4'
  spec.add_development_dependency 'loofah',               '>= 2.3.1'
  spec.add_development_dependency 'nokogiri',             '>= 1.10.9'
  spec.add_development_dependency 'spring'
  spec.add_development_dependency 'spring-commands-rspec'
  spec.add_development_dependency 'spring-commands-cucumber'
end
