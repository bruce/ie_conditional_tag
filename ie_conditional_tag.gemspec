# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ie_conditional_tag/version'

Gem::Specification.new do |spec|
  spec.name          = "ie_conditional_tag"
  spec.version       = IEConditionalTag::VERSION
  spec.authors       = ["Anthony Burns", "Bruce Williams"]
  spec.email         = ["brwcodes@gmail.com"]
  spec.description   = "Provides an easy-to-use helper for generating multiple tags inside IE-specific conditional comments"
  spec.summary       = "IE conditional comments for Rails"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rails", ">= 3.0"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "rcov"
end
