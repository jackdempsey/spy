require 'skitzo'
require 'rails'

module Skitzo
  class Engine < Rails::Engine

    initializer "skitzo.add_middleware" do |app|
      app.middlewares.use Skitzo::Switcher
    end

  end
end
