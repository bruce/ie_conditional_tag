module BrowserBodyTag

  module Helper

    def browser_body_tag(options = {}, &block)
      parts = []
      parts << ie_tag_conditional("lt IE 7", tag(:body, merge_class("ie6", options), true))
      (7..9).each do |n|
        parts << ie_tag_conditional("IE #{n}", tag(:body, merge_class("ie#{n}", options), true))
      end
      parts << raw('<!--[if (gt IE 9) | !(IE)]><!-->' + tag(:body, options, true) + '<!--<![endif]-->')
      if block_given?
        parts << capture(&block)
        parts << raw('</body>')
      end
      parts.join
    end
    
    def ie_tag_conditional(condition, tag)
      raw("<!--[if #{condition}]>" + tag + "<![endif]-->")
    end
    
    def merge_class(class_name, options = {})
      options.merge(:class => [options[:class], class_name].join(' '))
    end
    
  end

end
