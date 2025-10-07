source "https://rubygems.org"

# Rails
gem "rails", "~> 8.0.2", ">= 8.0.2.1"

# Asset pipeline
gem "propshaft"

# Web server
gem "puma", ">= 5.0"

# JavaScript (import maps)
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

# Rails caching, jobs, websockets
gem "solid_cache"
gem "solid_queue"
gem "solid_cable"

# Faster boot
gem "bootsnap", require: false

# Deployment tools
gem "kamal", require: false
gem "thruster", require: false

# Active Storage variants
# gem "image_processing", "~> 1.2"

group :development, :test do
  gem "sqlite3", ">= 2.1"      # SQLite for local dev/test
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end

group :production do
  gem "pg", ">= 1.3", "< 2.0"  # PostgreSQL for production
end
