module BodyBrowserTag

  def self.config
    @config ||= Configuration.new
  end
  
  def self.configure(options = {}, &block)
    @config = nil if options[:clear]
    DSL.new(config, &block)
  end
  
end
