require 'skitzo'
require 'rails'

module Skitzo
  class Engine < Rails::Engine

    initializer "skitzo.add_middleware" do |app|
      app.middlewares.use Skitzo::Switcher
    end

    # Add a load path for this specific Engine
    config.load_paths << File.expand_path("../../lib/skitzo", __FILE__)
  end
end
