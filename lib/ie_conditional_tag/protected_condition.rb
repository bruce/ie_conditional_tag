module IEConditionalTag

  class ProtectedCondition < Condition

    def wrap(options = {})
      inside = yield(merge_options(options))
      "<!--[if #{@expression}]>#{inside}<![endif]-->\n"
    end
    
  end

end
