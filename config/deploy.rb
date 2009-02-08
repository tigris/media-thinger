set :application, 'media-thinger'
set :deploy_to, "/var/www/#{application}"

set :scm, :git
set :repository, 'git://github.com/tigris/media-thinger.git '
set :deploy_via, :remote_cache
set :branch, 'master'
set :use_sudo, false

role :app, 'raphael.tigris.id.au'
role :web, 'raphael.tigris.id.au'
role :db,  'raphael.tigris.id.au', :primary => true

namespace :deploy do
  desc 'Restarting mod_rails with restart.txt'
  task :restart, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end

  [:start, :stop].each do |t|
    desc "#{t} task is a no-op with mod_rails"
    task t, :roles => :app do ; end
  end
end
