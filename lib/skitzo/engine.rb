require 'skitzo'
require 'rails'

module Skitzo
  class Engine < Rails::Engine
    engine_name :skitzo

    config.middleware.use Skitzo::Switcher

    # Add a load path for this specific Engine
    config.load_paths << File.expand_path("../../lib/skitzo", __FILE__)
  end
end
