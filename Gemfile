source "https://rubygems.org"

# -------------------
# Rails
# -------------------
gem "rails", "~> 8.0.2", ">= 8.0.2.1"

# -------------------
# Web server
# -------------------
gem "puma", ">= 5.0"

# -------------------
# Asset pipeline
# -------------------
gem "propshaft"

# -------------------
# JavaScript / Hotwire
# -------------------
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"

# -------------------
# JSON API builder
# -------------------
gem "jbuilder"

# -------------------
# Authentication
# -------------------
gem "bcrypt", "~> 3.1.7"

# -------------------
# CORS (for API)
# -------------------
gem "rack-cors"

# -------------------
# Pagination
# -------------------
gem "kaminari"

# -------------------
# Production DB
# -------------------
gem "pg", "~> 1.5"

# -------------------
# Development / Windows timezone
# -------------------
gem "tzinfo-data", platforms: %i[windows jruby]

# -------------------
# Faster boot
# -------------------
gem "bootsnap", require: false

# -------------------
# Development and Test
# -------------------
group :development, :test do
  # SQLite3 for local dev/test
  gem "sqlite3", "~> 1.7.3"
  
  # Debugging
  gem "debug", platforms: %i[mri windows], require: "debug/prelude"
end

group :development do
  # Web console for Rails console in browser
  gem "web-console"
end

group :test do
  # End-to-end testing
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
