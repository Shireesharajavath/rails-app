# Gemfile

source "https://rubygems.org"

# --- Core Rails ---
gem "rails", "~> 8.0.2", ">= 8.0.2.1"

# --- Background job adapter (for Rails 8) ---
gem "solid_queue"

# --- Web server ---
gem "puma", ">= 5.0"

# --- Asset pipeline ---
gem "propshaft"

# --- JavaScript ---
gem "importmap-rails"

# --- Hotwire ---
gem "turbo-rails"
gem "stimulus-rails"

# --- JSON API builder ---
gem "jbuilder"

# --- Authentication ---
gem "bcrypt", "~> 3.1.7"

# --- CORS ---
gem "rack-cors"

# --- Pagination ---
gem "kaminari"

# --- Windows timezone data ---
gem "tzinfo-data", platforms: %i[ windows jruby ]

# --- Faster boot ---
gem "bootsnap", require: false

# --- Development & Test ---
group :development, :test do
  gem "sqlite3", "~> 1.4"   # ✅ Use SQLite only locally
  gem "debug", platforms: %i[mri windows], require: "debug/prelude"
end

# --- Development only ---
group :development do
  gem "web-console"
end

# --- Test only ---
group :test do
  gem "capybara"
  gem "selenium-webdriver"
end

# --- Production only ---
group :production do
  gem "pg"   # ✅ Use PostgreSQL on Render
end
