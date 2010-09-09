require 'helper'
require 'action_view/template/handlers/erb'

class TestBrowserBodyTag < ActionView::TestCase
  tests BrowserBodyTag::Helper

  def setup
    super
    BrowserBodyTag.config.clear
    @response = ActionController::TestResponse.new
  end

  def test_adding_a_condition
    assert_equal 0, BrowserBodyTag.config.conditions.size
    BrowserBodyTag.configure do |config|
      config.add_condition '!IE', :class => 'not-ie'
    end
    assert_equal 1, BrowserBodyTag.config.conditions.size
  end

  def test_ie_tag_conditional
    assert_dom_equal(
      %(<!--[if IE 6]><body><![endif]-->),
      ie_tag_conditional("IE 6", tag(:body, nil, true))
    )
  end

  def test_browser_body_tag_with_no_options_and_no_block
    rendered = browser_body_tag
    # assert_match Regexp.escape('<!--[if lt IE 7]><body class="ie6"><![endif]-->'), rendered
    # assert_match Regexp.escape('<!--[if IE 7]><body class="ie7"><![endif]-->'), rendered
    # assert_match Regexp.escape('<!--[if IE 8]><body class="ie8"><![endif]-->'), rendered
    # assert_match Regexp.escape('<!--[if IE 9]><body class="ie9"><![endif]-->'), rendered
    # assert_match Regexp.escape('<!--[if (gt IE 9) | !(IE)]><!--><body><!--<![endif]-->'), rendered
  end

end
