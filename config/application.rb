require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RubyOnRailsLink
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Don't generate system test files.
    config.generators.system_tests = nil

    # Don't generate assets, helpers, stylesheets, or view specs
    config.generators.assets = false
    config.generators.helper = false
    config.generators.stylesheets = false
    config.generators.view_specs = false

    # Middleware
    config.middleware.use Rack::Attack

    # Active Job
    config.active_job.queue_adapter = :sucker_punch

    # Application configuration
    configatron.app_name = 'AMATIR.DEV'
    configatron.ga.tracking_id = 'UA-82068314-2'
  end
end
