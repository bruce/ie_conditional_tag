module BrowserBodyTag

  # Abstract
  class Condition

    def initialize(expression, options = {})
      @expression = expression
      @options = options
    end
    
    private

    def merge_options(options = {})
      css_class = options.delete(:class)
      overridden = options.merge(@options)
      if options[:class] || css_class
        overridden.merge(:class => [@options[:class], css_class].compact.join(' '))
      else
        overridden
      end
    end
    
  end

end



