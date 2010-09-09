module BrowserBodyTag

  class DSL
    
    def initialize(config, &block)
      @config = config
      instance_eval(&block) if block
    end

    def add_condition(terms, html_options = {})
      @config.conditions << Condition.new(terms, html_options)
    end
    
  end
  
end
