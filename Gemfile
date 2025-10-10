source "https://rubygems.org"

gem "rails", "~> 8.0.2", ">= 8.0.2.1"
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
group :development, :test do
  gem "sqlite3", "~> 1.4"
end

group :production do
  gem "pg", "~> 1.4"
end

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
