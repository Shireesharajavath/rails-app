require "active_support/core_ext/integer/time"

Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # Code is not reloaded between requests.
  config.cache_classes = true

  # Eager load code on boot for better performance and memory savings.
  config.eager_load = true

  # Full error reports are disabled (API mode, no browser views).
  config.consider_all_requests_local = false

  # Enable caching for controllers
  config.action_controller.perform_caching = true

  # Cache assets with far-future expiry since they are digest-stamped.
  config.public_file_server.headers = { "Cache-Control" => "public, max-age=#{1.year.to_i}" }

  # Serve uploaded files from local system (can switch to S3 later)
  config.active_storage.service = :local

  # Force SSL (Render handles HTTPS)
  config.force_ssl = true
  config.assume_ssl = true

  # Logging
  config.log_tags = [:request_id]
  config.logger = ActiveSupport::TaggedLogging.new(Logger.new(STDOUT))
  config.log_level = ENV.fetch("RAILS_LOG_LEVEL", "info")

  # Silence healthcheck requests
  config.silence_healthcheck_path = "/up"

  # Do not log deprecations
  config.active_support.report_deprecations = false

  # Cache store (simple memory store, safe for deployment)
  config.cache_store = :memory_store

  # Active Job queue adapter (async is fine for API-only apps)
  config.active_job.queue_adapter = :async

  # Mailer default URL
  config.action_mailer.default_url_options = { host: ENV.fetch("HOST", "example.com") }

  # I18n fallbacks
  config.i18n.fallbacks = true

  # Do not dump schema after migrations
  config.active_record.dump_schema_after_migration = false

  # Only use :id for object inspection
  config.active_record.attributes_for_inspect = [:id]

  # Hosts protection (adjust if using a custom domain)
  # config.hosts << "yourdomain.com"
end
