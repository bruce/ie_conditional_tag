module BrowserBodyTagHelper

  def browser_body_tag(html_options = {}, &block)
    if block_given?
      
    else

    end
  end

  def browser_wrap_conditional(condition, tag)
    raw("<!--[if #{condition}]#{tag}<![endif]-->")
  end
  
end
