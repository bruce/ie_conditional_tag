module IEConditionalTag

  module Helper

    def ie_conditional_tag(name, options = {}, &block)
      result = IEConditionalTag.process(options) do |modified_options|
        tag(name, modified_options, true)
      end
      if block_given?
        result << capture(&block)
        result << raw("</#{name}>")
      end
      raw(result)
    end

  end

end
