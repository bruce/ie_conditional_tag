require 'helper'
require 'action_view/template/handlers/erb'

class TestIEConditionalTag < ActionView::TestCase
  tests IEConditionalTag::Helper

  setup do
    @response = ActionController::TestResponse.new
    IEConditionalTag.config.clear
    IEConditionalTag.configure do |config|
      config.on 'lt IE 7', :class => 'ie6'
      config.on 'IE 7', :class => 'ie7'
      config.on 'IE 8', :class => 'ie8'
      config.on 'IE 9', :class => 'ie9'
      config.on 'gt IE 9'
      config.on '!IE'
    end
  end

  test "browser body tag with no options and no block" do
    rendered = ie_conditional_tag(:html)
    # assert_match Regexp.escape('<!--[if lt IE 7]><html class="ie6"><![endif]-->'), rendered
    # assert_match Regexp.escape('<!--[if IE 7]><html class="ie7"><![endif]-->'), rendered
    # assert_match Regexp.escape('<!--[if IE 8]><html class="ie8"><![endif]-->'), rendered
    # assert_match Regexp.escape('<!--[if IE 9]><html class="ie9"><![endif]-->'), rendered
    # assert_match Regexp.escape('<!--[if (gt IE 9) | !(IE)]><!--><html><!--<![endif]-->'), rendered
  end

end
