require 'active_support/dependencies'

module Spy
  require 'spy/switcher'
  require 'spy/engine' if defined?(Rails) && Rails::VERSION::MAJOR == 3

  # Warden scope that stores the admin user information while acting as another user
  mattr_accessor :admin_scope
  @@admin_scope = :admin

  def self.setup
    yield self
  end
end
