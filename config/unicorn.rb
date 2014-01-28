deploy_to = File.expand_path('../../..', __FILE__)
#rails_root = "#{deploy_to}/current"
rails_root = File.expand_path('../..', __FILE__)
pid_file = "#{deploy_to}/shared/pids/#{ENV['RACK_ENV']}/unicorn.pid"
log_file = "#{rails_root}/log/unicorn.log"
err_log = "#{rails_root}/log/unicorn_error.log"
old_pid = pid_file + '.oldbin'

listen "#{deploy_to}/shared/pids/#{ENV['RACK_ENV']}/unicorn.sock", backlog: 1024

timeout 300
File.umask(0002)

worker_processes 32
pid pid_file
stderr_path err_log
stdout_path log_file

preload_app true

GC.copy_on_write_friendly = true if GC.respond_to?(:copy_on_write_friendly=)

before_exec do |server|
  ENV['BUNDLE_GEMFILE'] = "#{rails_root}/Gemfile"
end

before_fork do |server, worker|
  defined?(ActiveRecord::Base) and
      ActiveRecord::Base.connection.disconnect!

  if File.exists?(old_pid) && server.pid != old_pid
    begin
      Process.kill('QUIT', File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
      # someone else did our job for us
    end
  end
end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) and
      ActiveRecord::Base.establish_connection
end