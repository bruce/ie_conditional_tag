module BrowserBodyTagHelper

  def browser_body_tag(html_options = {}, &block)
    ie_tag_conditional("lt IE 7", tag(:body, merge_class("ie6", options)))
    (7..9).each { |n| ie_tag_conditional("IE #{n}", tag(:body, merge_class("ie#{n}"))) }
    raw('<!--[if (gt IE 9) | !(IE)]><!-->') + tag(:body, attrs) + raw('<!--<![endif]-->')

    if block_given?
      yield
      raw('</body>')
    end
  end

  def ie_tag_conditional(condition, tag)
    raw "<!--[if #{condition}]>" + tag + "<![endif]-->"
  end

  def merge_class(class_name, attrs = {})
    attrs.merge(:class => [attrs[:class], class_name].join(' '))
  end
  
end
