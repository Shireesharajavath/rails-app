require_relative "boot"

require "rails/api"


Bundler.require(*Rails.groups)

module TodoApp
  class Application < Rails::Application
    config.load_defaults 8.0

    # API-only mode
    config.api_only = true

    # Disable assets (API-only app)
    config.assets.enabled = false

    # Autoload lib, ignoring non-Ruby files
    config.autoload_lib(ignore: %w[assets tasks])
  end
end
