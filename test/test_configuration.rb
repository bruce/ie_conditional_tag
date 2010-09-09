require 'helper'

class TestConfiguration < ActiveSupport::TestCase

  setup do
    BrowserBodyTag.config.clear
  end

  test "adding a condition" do
    assert_equal 0, BrowserBodyTag.config.conditions.size
    BrowserBodyTag.configure do |config|
      config.on '!IE', :class => 'not-ie'
    end
    assert_equal 1, BrowserBodyTag.config.conditions.size
  end
  
end
