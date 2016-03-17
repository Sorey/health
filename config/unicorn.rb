# set path to application
# app_dir = File.expand_path("../..", __FILE__)
# shared_dir = "#{app_dir}/shared"
# working_directory app_dir


# Set unicorn options
worker_processes Integer(ENV["WEB_CONCURRENCY"] || 2)
preload_app false
timeout 15

# Set up socket location
listen "/tmp/unicorn_health.sock", :backlog => 64

# Logging
# stderr_path "#{shared_dir}/log/unicorn.stderr.log"
# stdout_path "#{shared_dir}/log/unicorn.stdout.log"

# Set master PID location
pid "/tmp/pids/unicorn_health.pid"



before_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end

  defined?(ActiveRecord::Base) and
      ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to send QUIT'
  end


  defined?(ActiveRecord::Base) and
      ActiveRecord::Base.establish_connection
end