module IeConditionalTag
  module Generators
    class InstallGenerator < Rails::Generators::Base
      
      source_root File.expand_path("../../templates", __FILE__)

      desc "Creates a ie_conditional_tag initializer to configure your application."

      def copy_initializer
        template "ie_conditional_tag.rb", "config/initializers/ie_conditional_tag.rb"
      end

      def show_readme
        readme "README" if behavior == :invoke
      end
      
    end
  end
end
