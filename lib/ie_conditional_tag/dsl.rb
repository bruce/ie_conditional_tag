module IEConditionalTag

  class DSL
    
    def initialize(config, &block)
      @config = config
      instance_eval(&block) if block
    end

    # Add a condition
    #
    # Unless +expression+ is "!IE", this will add a "protected"
    # condition, meaning that the contents of the condition
    # will be hidden inside a comment and will not be added to the DOM
    # by other browsers.
    #
    # You can also use the more specific +add_protected_condition+ and
    # +add_unprotected_condition+ directly.
    #
    # call-seq:
    #
    #   on 'lt 7', :class => 'ie6'
    #   on '!IE' # for other browsers
    #
    def on(expression, options = {})
      if expression.upcase == '!IE'
        add_unprotected_condition(expression, options)
      else
        add_protected_condition(expression, options)
      end
    end

    # Add a protected condition.
    #
    # The contents of a protected condition will be hidden inside a
    # comment and will not be added to the DOM  by other browsers.
    def add_protected_condition(expression, options = {})
      add_condition(ProtectedCondition, expression, options)
    end

    # Add an unprotected condition
    #
    # The contents of an unprotected condition will NOT be hidden from
    # other browsers.  There should only be one of these configured.
    #
    # This is commonly used for the modern/up-to-date/non-IE version,
    # eg when +expression+ is "!IE" or "gt IE 9".  Note you can add
    # an unprotected condition using +on+ if you use the former
    # expression (the latter may be too optimistic!)
    def add_unprotected_condition(expression, options = {})
      add_condition(UnprotectedCondition, expression, options)      
    end
  
    private
    
    def add_condition(klass, expression, options = {})
      @config.conditions << klass.new(expression, options)
    end
    
  end
  
end

