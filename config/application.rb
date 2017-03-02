require_relative 'boot'

require 'action_controller/railtie'
require 'action_view/railtie'
require 'active_job/railtie'
require 'action_cable/engine'
require 'rails/test_unit/railtie'
require 'sprockets/railtie'

Bundler.require(*Rails.groups)

module DamonZucconiClient
  class Application < Rails::Application
  end
end
