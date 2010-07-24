require 'skitzo'
require 'rails'

module Skitzo
  class Engine < Rails::Engine

    initializer "skitzo.add_middleware" do |app|
      app.middleware.use Skitzo::Switcher
    end

    config.after_initialize do
      # make sure user model is loaded before we open up and add methods
      require 'skitzo/user'
    end

  end
end
