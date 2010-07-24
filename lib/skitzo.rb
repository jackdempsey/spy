module Skitzo
  require 'skitzo/switcher'
  require 'skitzo/engine' if defined?(Rails) && Rails::VERSION::MAJOR == 3
end
