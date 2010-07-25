module Spy
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      desc "Creates a Spy initializer and copy locale files to your application."

      def copy_initializer
        template "spy.rb", "config/initializers/spy.rb"
      end

      def copy_locale
        copy_file "../../../../config/locales/en.yml", "config/locales/spy.en.yml"
      end

      def show_readme
        readme "README"
      end
    end
  end
end
