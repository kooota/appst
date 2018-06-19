lock '3.11.0'

set :application, 'appst'
set :repo_url, 'https://github.com/kooota/appst'

set :branch, 'prepare'
set :deploy_to, '/var/www/app/appst'

set :scm, :git
set :log_level, :debug
set :pty, true

set :bundle_binstubs, nil
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets bundle public/system public/assets}
set :default_env, { path: "/usr/local/rbenv/shims:/usr/local/rbenv/bin:$PATH" }
set :keep_releases, 5

namespace :deploy do
  after :finishing, 'deploy:cleanup'
end

desc 'execute before deploy'
task :db_create do
  on roles(:db) do |host|
    execute "mysql -uroot -e 'CREATE DATABASE IF NOT EXISTS apst_development;'"
  end
end
