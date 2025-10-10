source "https://rubygems.org"

gem "rails", "~> 8.0.3"
gem "solid_queue"
gem "puma", ">= 5.0"
gem "propshaft"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "bcrypt", "~> 3.1.7"
gem "rack-cors"
gem "kaminari"
gem "tzinfo-data", platforms: %i[windows jruby]
gem "bootsnap", require: false

# Database gems
gem "sqlite3", "~> 1.4", group: [:development, :test]
gem "pg", "~> 1.6", group: :production

# Development tools
group :development do
  gem "web-console"
  gem "debug", platforms: %i[mri windows], require: "debug/prelude"
end

# Test tools
group :test do
  gem "capybara"
  gem "selenium-webdriver"
end
