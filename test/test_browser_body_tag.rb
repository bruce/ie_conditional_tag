require 'helper'
require 'action_view/template/handlers/erb'

class TestBrowserBodyTag < ActionView::TestCase
  tests BrowserBodyTag::Helper

  setup do
    @response = ActionController::TestResponse.new
    BrowserBodyTag.config.clear
    BrowserBodyTag.configure do |config|
      config.on 'lt IE 7', :class => 'ie6'
      config.on 'IE 7', :class => 'ie7'
      config.on 'IE 8', :class => 'ie8'
      config.on 'IE 9', :class => 'ie9'
      config.on 'gt IE 9'
      config.on '!IE'
    end
  end

  test "browser body tag with no options and no block" do
    rendered = browser_body_tag
    # assert_match Regexp.escape('<!--[if lt IE 7]><body class="ie6"><![endif]-->'), rendered
    # assert_match Regexp.escape('<!--[if IE 7]><body class="ie7"><![endif]-->'), rendered
    # assert_match Regexp.escape('<!--[if IE 8]><body class="ie8"><![endif]-->'), rendered
    # assert_match Regexp.escape('<!--[if IE 9]><body class="ie9"><![endif]-->'), rendered
    # assert_match Regexp.escape('<!--[if (gt IE 9) | !(IE)]><!--><body><!--<![endif]-->'), rendered
  end

end
