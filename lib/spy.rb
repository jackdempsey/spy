module Spy
  require 'spy/switcher'
  require 'spy/engine' if defined?(Rails) && Rails::VERSION::MAJOR == 3
end
