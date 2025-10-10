# config/puma.rb

# Specifies the number of threads to use for handling requests.
threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }.to_i
threads threads_count, threads_count

# Specifies the port that Puma will listen on to receive requests.
port ENV.fetch("PORT") { 3000 }

# Specifies the environment that Puma will run in.
environment ENV.fetch("RAILS_ENV") { "production" }

# Number of Puma workers to boot in clustered mode.
# Workers are forked web server processes. If you’re using threads and workers together,
# the total concurrency = threads * workers.
workers ENV.fetch("WEB_CONCURRENCY") { 2 }

# Use the "preload_app!" method when specifying workers.
# This allows the app code to be loaded before forking workers,
# which saves memory and speeds up worker spawn times.
preload_app!

# Allow Puma to be restarted by `bin/rails restart` command.
plugin :tmp_restart

# Run Solid Queue supervisor inside of Puma for single-server deployments.
plugin :solid_queue if ENV["SOLID_QUEUE_IN_PUMA"]

# Optional: specify a PID file for production.
pidfile ENV["PIDFILE"] if ENV["PIDFILE"]
