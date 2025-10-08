source "https://rubygems.org"

# Rails
gem "rails", "~> 8.0.2", ">= 8.0.2.1"

# Web server
gem "puma", ">= 5.0"

# JSON API builder
gem "jbuilder"

# Authentication
gem "bcrypt", "~> 3.1.7"

# CORS for API requests
gem "rack-cors"

# Pagination
gem "kaminari"

# PostgreSQL for production
gem "pg", "~> 1.6"

# Faster boot
gem "bootsnap", require: false

group :development, :test do
  # Local database for development/testing
  gem "sqlite3", ">= 2.1"

  # Debugging
  gem "debug", platforms: %i[mri windows], require: "debug/prelude"

  # Optional: file watcher for development
  gem "listen", "~> 3.7"
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end
