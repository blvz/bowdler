# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bowdler/version'

Gem::Specification.new do |spec|
  spec.name          = 'bowdler'
  spec.version       = Bowdler::VERSION
  spec.authors       = ['Rafael Belvederese']
  spec.email         = ['rafael@blvz.im']
  spec.description   = %q{Create a Bowerfile alongside your Gemfile and just bundle.}
  spec.summary       = %q{bower while you bundle.}
  spec.homepage      = "https://github.com/blvz/bowdler"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
end
