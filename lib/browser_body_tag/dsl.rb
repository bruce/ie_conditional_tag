module BrowserBodyTag

  class DSL
    
    def initialize(config, &block)
      @config = config
      instance_eval(&block) if block
    end
    
  end
  
end
