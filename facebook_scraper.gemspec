# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'facebook_scraper/version'

Gem::Specification.new do |spec|
  spec.name          = 'facebook_scraper'
  spec.version       = FacebookScraper::VERSION
  spec.authors       = ['Patrick Helm']
  spec.email         = ['deradon87@gmail.com']
  spec.description   = %q{Simply keep your OpenGraph-Objects up to date}
  spec.summary       = %q{Simply keep your OpenGraph-Objects up to date}
  spec.homepage      = 'https://github.com/Deradon/FacebookScraper'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(spec)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rspec-its'
end
