module BrowserBodyTag

  class DSL
    
    def initialize(config, &block)
      @config = config
      instance_eval(&block) if block
    end

    # Set HTML options based on an IE condition
    #
    # call-seq:
    #   on 6, class: 'ie6'
    #   on 'lt IE 7', class: 'ie6'
    #   on 'gte IE 9', class: 'ie9'
    #   on '!IE', 
    def on(expression, options = {})
      klass = expression.upcase == '!IE' ? UnprotectedCondition : ProtectedCondition
      add_condition klass, expression, options
    end

    private
    
    def add_condition(klass, expression, options = {})
      @config.conditions << klass.new(expression, options)
    end
    
  end
  
end

