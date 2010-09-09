require 'helper'
require 'action_view/template/handlers/erb'

class TestBrowserBodyTag < ActionView::TestCase
  tests BrowserBodyTag::Helper

  def setup
    super
    @response = ActionController::TestResponse.new
  end

  def test_ie_tag_conditional
    assert_dom_equal(
      %(<!--[if IE 6]><body><![endif]-->),
      ie_tag_conditional("IE 6", tag(:body, nil, true))
    )
  end

end
