require 'spy'
require 'rails'

module Spy
  class Engine < Rails::Engine

    initializer "spy.add_middleware" do |app|
      app.middleware.use Spy::Switcher
    end

  end
end
