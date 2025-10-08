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

# Windows timezone data
gem "tzinfo-data", platforms: %i[windows jruby]

# Faster boot
gem "bootsnap", require: false

group :development, :test do
  # Local database for development/testing
  gem "sqlite3", ">= 2.1"

  gem "debug", platforms: %i[mri windows], require: "debug/prelude"
end

group :development do
  # Optional: Remove if you never run Rails console in browser
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end
