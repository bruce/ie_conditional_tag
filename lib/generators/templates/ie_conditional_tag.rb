IEConditionalTag.configure do |config|

  # The standard `config.on` line looks like:
  #
  #   on IE_CONDITIONAL_COMMENT_EXPRESSION, HTML_OPTIONS
  #
  # The `:class` option is special; unlike other attributes, its value
  # will be prepended to any `:class` attribute given to `ie_conditional_tag`.
  
  # Add CSS classes for IE 6 - 9
  config.on 'lt IE 7', :class => 'ie6'
  config.on 'IE 7', :class => 'ie7'
  config.on 'IE 8', :class => 'ie8'
  config.on 'IE 9', :class => 'ie9'

  # For IE >= 9, no change
  config.on 'gt IE 9'

  # For all other browsers
  # Note: Don't remove this line-- or other browsers won't get a
  #       visible tag!
  config.on '!IE'  
  
end
