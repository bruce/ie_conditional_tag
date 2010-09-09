require 'rubygems'
require 'test/unit'
require 'active_support'
require 'active_support/core_ext'
require 'action_view'
require 'action_controller'
require 'action_controller/test_case'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'browser_body_tag_helper'
