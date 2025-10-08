source "https://rubygems.org"

# Rails
gem "rails", "~> 8.0.2", ">= 8.0.2.1"

# Web server
gem "puma", ">= 5.0"

# Asset pipeline
gem "propshaft"

# JavaScript
gem "importmap-rails"

# Hotwire
gem "turbo-rails"
gem "stimulus-rails"

# JSON API builder
gem "jbuilder"

# Authentication
gem "bcrypt", "~> 3.1.7"

# CORS
gem "rack-cors"

# Pagination
gem "kaminari"

# Windows timezone data
gem "tzinfo-data", platforms: %i[ windows jruby ]

# Faster boot
gem "bootsnap", require: false

group :development, :test do
  gem "sqlite3", ">= 2.1" # ✅ Use SQLite for local testing
  gem "debug", platforms: %i[mri windows], require: "debug/prelude"
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end


