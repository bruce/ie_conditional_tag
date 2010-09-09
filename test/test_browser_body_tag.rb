require 'helper'
require 'action_view/template/handlers/erb'

class TestBrowserBodyTag < ActionView::TestCase
  tests BrowserBodyTag::Helper

  def setup
    super
    @response = ActionController::TestResponse.new
  end
  
end
