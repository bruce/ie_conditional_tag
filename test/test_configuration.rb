require 'helper'

class TestConfiguration < ActiveSupport::TestCase

  setup do
    IEConditionalTag.config.clear
  end

  test "adding a condition" do
    assert_equal 0, IEConditionalTag.config.conditions.size
    IEConditionalTag.configure do |config|
      config.on '!IE', :class => 'not-ie'
    end
    assert_equal 1, IEConditionalTag.config.conditions.size
  end

end
