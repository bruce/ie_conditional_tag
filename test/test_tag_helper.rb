require 'helper'
require 'action_view/template/handlers/erb'

class TestIEConditionalTag < ActionView::TestCase
  tests IEConditionalTag::Helper

  setup do
    @response = ActionController::TestResponse.new
    IEConditionalTag.config.clear
    IEConditionalTag.configure do |config|
      config.on 'lt IE 7', :class => 'ie ie6'
      config.on 'IE 7', :class => 'ie ie7'
      config.on 'IE 8', :class => 'ie ie8'
      config.on 'IE 9', :class => 'ie ie9'
      config.on 'gt IE 9', :class => 'ie'
      config.on '!IE'
    end
  end

  test "browser body tag with no options and no block" do
    rendered = String.new(ie_conditional_tag(:html))
    assert rendered.include?('<!--[if lt IE 7]><html class="ie ie6"><![endif]-->'), rendered
    assert rendered.include?('<!--[if IE 7]><html class="ie ie7"><![endif]-->'), rendered
    assert rendered.include?('<!--[if IE 8]><html class="ie ie8"><![endif]-->'), rendered
    assert rendered.include?('<!--[if IE 9]><html class="ie ie9"><![endif]-->'), rendered
    assert rendered.include?('<!--[if gt IE 9]><html class="ie"><![endif]-->'), rendered
    assert rendered.include?('<!--[if !IE]><!--><html><!--<![endif]-->'), rendered
  end

  test "browser body tag with class option and no block" do
    rendered = String.new(ie_conditional_tag(:html, :class => 'custom-class'))
    assert rendered.include?('<!--[if lt IE 7]><html class="ie ie6 custom-class"><![endif]-->'), rendered
    assert rendered.include?('<!--[if IE 7]><html class="ie ie7 custom-class"><![endif]-->'), rendered
    assert rendered.include?('<!--[if IE 8]><html class="ie ie8 custom-class"><![endif]-->'), rendered
    assert rendered.include?('<!--[if IE 9]><html class="ie ie9 custom-class"><![endif]-->'), rendered
    assert rendered.include?('<!--[if gt IE 9]><html class="ie custom-class"><![endif]-->'), rendered
    assert rendered.include?('<!--[if !IE]><!--><html class="custom-class"><!--<![endif]-->'), rendered
  end

  
end
