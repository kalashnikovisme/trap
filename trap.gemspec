# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'trap/version'

Gem::Specification.new do |spec|
  spec.name          = 'trap'
  spec.version       = Trap::VERSION
  spec.authors       = ['Pavel Kalashnikov']
  spec.email         = ['kalashnikovisme@gmail.com']

  spec.summary       = 'Bootstrap helpers'
  spec.description   = 'Bootstrap helpers'
  spec.homepage      = 'https://github.com/kalashnikovisme/trap'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = %w[lib app]

  spec.add_development_dependency 'bundler', '>= 1.8'
  spec.add_development_dependency 'rake', '>= 10.0'
end
