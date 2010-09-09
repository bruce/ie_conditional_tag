module BrowserBodyTag

  module Helper

    def browser_body_tag(options = {}, &block)
      result = BrowserBodyTag.process(options) do |modified_options|
        tag(:body, modified_options, true)
      end
      if block_given?
        result << capture(&block)
        result << raw('</body>')
      end
      raw(result)
    end
            
  end

end
