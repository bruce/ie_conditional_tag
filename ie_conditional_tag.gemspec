# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'ie_conditional_tag/version'
 
Gem::Specification.new do |s|
  s.name        = "ie_conditional_tag"
  s.version     = IEConditionalTag::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Anthony Burns", "Bruce Williams"]
  s.email       = ["bruce@codefluency.com"]
  s.homepage    = "http://github.com/bruce/ie_conditional_tag"
  s.summary     = "IE conditional comments for Rails"
  s.description = "Provides an easy-to-use helper for generating multiple tags inside IE-specific conditional comments"
 
  s.required_rubygems_version = ">= 1.3.6"
 
  s.add_dependency "rails", ">= 3.0"
 
  s.files        = Dir.glob("{bin,lib,test}/**/*") + %w(LICENSE README.md)
  s.require_path = 'lib'
end
