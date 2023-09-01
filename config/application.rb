require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module KayjeeePostgresqlBlogapp
  class Application < Rails::Application
    # Initialize configuration defaults for the originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # Uncomment the following line to set the time zone for the application.
    # config.time_zone = "Central Time (US & Canada)"

    # Uncomment the following line to add eager load paths for the application.
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
