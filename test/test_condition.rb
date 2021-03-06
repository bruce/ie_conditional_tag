require 'helper'

class TestCondition < ActionView::TestCase

  test "wrapping a tag in a protected condition without additional options" do
    condition = IEConditionalTag::ProtectedCondition.new('IE 6', :class => 'ie ie6')
    assert_equal(%Q(<!--[if IE 6]><body class="ie ie6"><![endif]-->\n),
                 condition.wrap { |opts| tag(:body, opts, true) })
  end

  test "wrapping a tag in an unprotected condition without additional options" do
    condition = IEConditionalTag::UnprotectedCondition.new('!IE', :id => 'override', :class => 'non-ie')
    result = condition.wrap(:id => 'custom', :class => 'basic') { |opts| tag(:body, opts, true) }

    wrapper_pattern = Regexp.new(Regexp.quote('<!--[if !IE]><!--><body ') + '[^>]+' + Regexp.quote('><!--<![endif]-->'))
    assert result =~ wrapper_pattern
    assert result.include?('class="non-ie basic"')
    assert result.include?('id="override"')    
  end

  test "wrapping a tag in a protected condition with additional options" do
    condition = IEConditionalTag::ProtectedCondition.new('IE 6', :id => 'override', :class => 'ie ie6')
    result = condition.wrap(:id => 'custom', :class => 'basic') { |opts| tag(:body, opts, true) }

    wrapper_pattern = Regexp.new(Regexp.quote('<!--[if IE 6]><body ') + '[^>]+' + Regexp.quote('><![endif]-->'))
    assert result =~ wrapper_pattern
    assert result.include?('class="ie ie6 basic"')
    assert result.include?('id="override"')    
  end

  test "wrapping a tag in an unprotected condition with additional options" do
    condition = IEConditionalTag::UnprotectedCondition.new('!IE', :id => 'override', :class => 'no-ie')
    result = condition.wrap(:id => 'custom', :class => 'basic') { |opts| tag(:body, opts, true) }

    wrapper_pattern = Regexp.new(Regexp.quote('<!--[if !IE]><!--><body ') + '[^>]+' + Regexp.quote('><!--<![endif]-->'))
    assert result =~ wrapper_pattern
    assert result.include?('class="no-ie basic"')
    assert result.include?('id="override"')    
  end

end
