# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hiera/backend/yamlwildcard_backend.rb'

Gem::Specification.new do |gem|
  gem.name          = "hiera-yaml_wildcard"
  gem.version       = Hiera::Backend::Yamlwildcard_backend::VERSION
  gem.description   = "YAML with wildcard support backend"
  gem.summary       = "YAML with wildcard support backend for Hiera"
  gem.author        = "Jordi Prats"
  gem.email         = 'jprats@systemadmin.es'
  gem.license       = "MIT"

  gem.homepage      = "https://github.com/jordiprats/hiera-yaml_wildcard"
  gem.files         = `git ls-files`.split($/).reject { |file| file =~ /^features.*$/ }
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

end
