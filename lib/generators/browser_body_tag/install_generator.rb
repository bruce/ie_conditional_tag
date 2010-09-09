module BrowserBodyTag
  module Generators
    class InstallGenerator < Rails::Generators::Base
      
      source_root File.expand_path("../../templates", __FILE__)

      desc "Creates a browser_body_tag initializer to configure your application."

      def copy_initializer
        template "browser_body_tag.rb", "config/initializers/browser_body_tag.rb"
      end

      def show_readme
        readme "README" if behavior == :invoke
      end
      
    end
  end
end
