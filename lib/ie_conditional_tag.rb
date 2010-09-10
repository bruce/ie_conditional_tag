require 'ie_conditional_tag/configuration'
require 'ie_conditional_tag/dsl'
require 'ie_conditional_tag/helper'

require 'ie_conditional_tag/condition'
require 'ie_conditional_tag/protected_condition'
require 'ie_conditional_tag/unprotected_condition'

require 'ie_conditional_tag/railtie'

module IEConditionalTag
  
  def self.config
    @config ||= Configuration.new
  end

  def self.process(options = {}, &block)
    config.inject('') do |result, condition|
      result << condition.wrap(options.dup, &block)
    end
  end
  
  def self.configure(options = {}, &block)
    @config = nil if options[:clear]
    DSL.new(config, &block)
  end
  
end
