# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'slack_adapter/version'

Gem::Specification.new do |spec|
  spec.name          = 'slack_adapter'
  spec.version       = SlackAdapter::VERSION
  spec.authors       = ['alfa']
  spec.email         = ['alfa.jpn@gmail.com']

  spec.summary       = 'Slack API adapter for ruby.'
  spec.description   = 'Slack API adapter for ruby.'
  spec.homepage      = 'https://github.com/alfa-jpn/slack_adapter'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.0.0'

  spec.add_development_dependency 'bundler', '~> 1.12'
  spec.add_development_dependency 'rake',    '~> 10.0'
  spec.add_development_dependency 'rspec',   '~> 3.0'
  spec.add_development_dependency 'webmock', '~> 2.1'
end
