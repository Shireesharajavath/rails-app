source "https://rubygems.org"

ruby "3.2.9"

# Core Rails
gem "rails", "~> 8.1.1"
gem "puma", ">= 5.0"

# Assets & JS
gem "propshaft"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"

# Authentication & utilities
gem "bcrypt", "~> 3.1.7"
gem "rack-cors"
gem "kaminari"

# Performance
gem "bootsnap", require: false

# Database
group :development, :test do
  # ✅ Updated version for Rails 8 compatibility
  gem "sqlite3", "~> 2.1"
end

group :production do
  gem "pg", "~> 1.6"
  gem "rails_12factor"
end

# Development tools
group :development do
  gem "web-console"
  gem "debug", "~> 1.11", platforms: [:mri], require: false
  gem "listen", "~> 3.7"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.1"
end

# Test tools
group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "minitest"
  gem "webdrivers"
end
