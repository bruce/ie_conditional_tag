require 'helper'
require 'action_view/template/handlers/erb'

class TestBrowserBodyTag < ActionView::TestCase

  def setup
    super
    BrowserBodyTag.config.clear
  end

  def test_adding_a_condition
    assert_equal 0, BrowserBodyTag.config.conditions.size
    BrowserBodyTag.configure do |config|
      config.on '!IE', :class => 'not-ie'
    end
    assert_equal 1, BrowserBodyTag.config.conditions.size
  end
  
end
