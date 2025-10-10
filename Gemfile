source "https://rubygems.org"

ruby "3.2.9"

# Core Rails
gem "rails", "~> 8.0.2", ">= 8.0.2.1"
gem "puma", ">= 5.0"

# API-only: asset pipeline not needed unless you plan to serve HTML views
gem "propshaft"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"

# Authentication & utilities
gem "bcrypt", "~> 3.1.7"
gem "rack-cors"
gem "kaminari"

# Caching & performance
gem "bootsnap", require: false

# 🧠 Database setup
# Use SQLite for local dev/test, and PostgreSQL in production
gem "sqlite3", "~> 1.4", group: [:development, :test]
gem "pg", "~> 1.6", group: :production

# Timezone fixes (for Windows only)
gem "tzinfo-data", platforms: %i[windows jruby]

# 🧰 Development tools
group :development do
  gem "web-console"
  gem "debug", '~> 1.0', platforms: %i[mri mingw x64_mingw], require: "debug/prelude"
end

# 🧪 Test tools
group :test do
  gem "capybara"
  gem "selenium-webdriver"
end
