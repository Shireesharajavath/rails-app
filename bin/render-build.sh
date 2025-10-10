#!/usr/bin/env bash
set -e

# Install gems
bundle install

# Precompile assets
bundle exec rake assets:precompile

# Run database migrations
bundle exec rake db:migrate RAILS_ENV=production


