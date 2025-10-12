require "active_support/core_ext/integer/time"

Rails.application.configure do
  # Cache classes and eager load code for performance
  config.cache_classes = true
  config.eager_load = true

  # Full error reports disabled
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  # Serve static files if ENV is set (needed for Render)
  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?

  # Force SSL
  config.force_ssl = true

  # Logging
  config.log_level = :info
  config.log_tags  = [:request_id]
  config.logger    = ActiveSupport::TaggedLogging.new(Logger.new(STDOUT))

  # Disable assets compilation
  config.assets.compile = false

  # Active Storage service
  config.active_storage.service = :local

  # I18n fallback
  config.i18n.fallbacks = true

  # Do not dump schema after migrations
  config.active_record.dump_schema_after_migration = false
end
