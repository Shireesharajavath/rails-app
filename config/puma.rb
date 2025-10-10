# config/puma.rb

# Specifies the number of threads to use for handling requests.
threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }.to_i
threads threads_count, threads_count

# Specifies the port that Puma will listen on to receive requests.
port ENV.fetch("PORT") { 3000 }

# Specifies the environment that Puma will run in.
environment ENV.fetch("RAILS_ENV") { "production" }

# Number of Puma workers to boot in clustered mode.
workers ENV.fetch("WEB_CONCURRENCY") { 2 }

# Preload the application before forking workers for better performance.
preload_app!

# Allow Puma to be restarted by `bin/rails restart` command.
plugin :tmp_restart

# Run Solid Queue supervisor inside of Puma for single-server deployments.
plugin :solid_queue if ENV["SOLID_QUEUE_IN_PUMA"]

# Optional: specify a PID file for production.
pidfile ENV["PIDFILE"] if ENV["PIDFILE"]

# Allow Puma to gracefully restart workers
on_worker_boot do
  ActiveRecord::Base.establish_connection if defined?(ActiveRecord)
