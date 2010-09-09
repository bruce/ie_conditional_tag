module BrowserBodyTag

  class ProtectedCondition < Condition

    def wrap(options = {})
      inside = yield(merge_options(options))
      "<!--[if #{@expression}]>#{inside}<![endif]-->"
    end
    
  end

end
