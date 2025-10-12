# frozen_string_literal: true

source "https://rubygems.org"

# --------------------------
# Specify Ruby version
# --------------------------
ruby "3.2.9"

# --------------------------
# Core Rails
# --------------------------
gem "rails", "~> 8.0.2", ">= 8.0.2.1"
gem "puma", ">= 5.0"

# --------------------------
# API-only / Asset pipeline
# --------------------------
gem "propshaft"          # Modern asset pipeline
gem "importmap-rails"    # JS management
gem "turbo-rails"        # Turbo for Hotwire
gem "stimulus-rails"     # StimulusJS integration
gem "jbuilder"           # JSON views

# --------------------------
# Authentication & utilities
# --------------------------
gem "bcrypt", "~> 3.1.7" # Password hashing
gem "rack-cors"          # Cross-Origin Resource Sharing support
gem "kaminari"           # Pagination

# --------------------------
# Caching & performance
# --------------------------
gem "bootsnap", require: false # Speeds up boot time

# --------------------------
# Database setup
# --------------------------
gem "sqlite3", "~> 1.5", groups: [:development, :test] # Dev & test DB
gem "pg", "~> 1.6", group: :production               # Production DB
gem "tzinfo-data", platforms: %i[windows jruby]      # Timezone support

# --------------------------
# Development tools
# --------------------------
group :development do
  gem "web-console"      # Interactive console in browser
  gem "debug", "~> 1.11", platforms: [:mri], require: false
end

# --------------------------
# Test tools
# --------------------------
group :test do
  gem "capybara"          # Integration testing
  gem "selenium-webdriver" # Browser automation
end
