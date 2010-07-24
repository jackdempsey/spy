require 'skitzo'
require 'rails'

module Skitzo
  class Engine < Rails::Engine
    engine_name :skitzo

    config.middleware.use Skitzo::Switcher
  end
end
