require "bundler/capistrano"
load 'deploy/assets'

set :application, "spree"
set :user, 'spree'
set :group, 'www-data'
set :rails_env, 'production'

role :web, '78.47.33.92'
role :app, '78.47.33.92'
role :db,  '78.47.33.92', :primary => true

set :scm, :git
set :repository,  "git://github.com/bazingalabs/store.bazingalabs.com.git"
set :branch,      "master"
set :deploy_to,   "/data/#{application}"
set :deploy_via,  :remote_cache
set :use_sudo,    false

default_run_options[:pty] = true
set :ssh_options, { :forward_agent => true }

namespace :foreman do
  desc "Export the Procfile to Ubuntu's upstart scripts"
  task :export, :roles => :app do
    run "cd #{current_path} && bundle exec foreman export upstart /etc/init"
  end

  desc "Start the application services"
  task :start, :roles => :app do
    sudo "start #{application}"
  end

  desc "Stop the application services"
  task :stop, :roles => :app do
    sudo "stop #{application}"
  end

  desc "Restart the application services"
  task :restart, :roles => :app do
    sudo "restart #{application}"
  end
end

namespace :deploy do
  desc "Symlink shared configs and folders on each release."
  task :symlink_shared do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
    run "ln -nfs #{shared_path}/config/Procfile #{release_path}/Procfile"
    run "ln -nfs #{shared_path}/config/.foreman #{release_path}/.foreman"
    run "ln -nfs #{shared_path}/public/spree #{release_path}/public/spree"
  end
end

before 'deploy:assets:precompile', 'deploy:symlink_shared'

before 'deploy:start', 'foreman:export'
after 'deploy:start', 'foreman:start'

before 'deploy:restart', 'foreman:export'
after 'deploy:restart', 'foreman:restart'