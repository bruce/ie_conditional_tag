module BrowserBodyTag

  class Condition

    def initialize(terms, html_options = {})
      @terms = terms
      @html_options = html_options
    end
    
    def wrap(options = {})
      inside = yield(merge_options(options))
      "<!--[if #{@terms}]>#{inside}<![endif]-->"
    end

    private

    def merge_options(options = {})
      options.merge(:class => [@html_options[:class], options[:class]].compact.join(' '))
    end
    
  end

end
