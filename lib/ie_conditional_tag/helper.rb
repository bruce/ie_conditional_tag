module IEConditionalTag

  module Helper

    def ie_conditional_tag(options = {}, &block)
      result = IEConditionalTag.process(options) do |modified_options|
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
