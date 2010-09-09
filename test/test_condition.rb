require 'helper'
require 'action_view/template/handlers/erb'

class TestBrowserBodyTag < ActionView::TestCase

  def test_wrapping_a_tag_in_a_protected_condition_without_extras
    condition = BrowserBodyTag::ProtectedCondition.new('IE 6', :class => 'ie6')
    assert_equal('<!--[if IE 6]><body class="ie6"><![endif]-->',
                 condition.wrap { |opts| tag(:body, opts, true) })
  end

  def test_wrapping_a_tag_in_an_unprotected_condition_with_extras
    condition = BrowserBodyTag::UnprotectedCondition.new('!IE', :id => 'override', :class => 'non-ie')
    result = condition.wrap(:id => 'custom', :class => 'basic') { |opts| tag(:body, opts, true) }

    wrapper_pattern = Regexp.new(Regexp.quote('<!--[if !IE]><!--><body ') + '[^>]+' + Regexp.quote('><!--<![endif]-->'))
    assert result =~ wrapper_pattern
    assert result.include?('class="non-ie basic"')
    assert result.include?('id="override"')    
  end

  def test_wrapping_a_tag_in_a_protected_condition_with_extras
    condition = BrowserBodyTag::ProtectedCondition.new('IE 6', :id => 'override', :class => 'ie6')
    result = condition.wrap(:id => 'custom', :class => 'basic') { |opts| tag(:body, opts, true) }

    wrapper_pattern = Regexp.new(Regexp.quote('<!--[if IE 6]><body ') + '[^>]+' + Regexp.quote('><![endif]-->'))
    assert result =~ wrapper_pattern
    assert result.include?('class="ie6 basic"')
    assert result.include?('id="override"')    
  end
  
end
