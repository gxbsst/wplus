require "bundler/capistrano"

set :deploy_via, :remote_cache

set :application, "wineplus-store"

set :branch, "develop"
server "192.168.11.31", :web, :app, :db, primary: true
 set :repository,  "git://github.com/gxbsst/wplus.git"
set :user, "rails"
set :deploy_to, "/srv/rails/wineplus-erb"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

# role :web, "aries.sidways.lab"                          # Your HTTP server, Apache/etc
# role :app, "aries.sidways.lab"                          # This may be the same as your `Web` server
# role :db,  "aries.sidways.lab", :primary => true # This is where Rails migrations will run
# role :db,  "your slave db-server here"


set :use_sudo, false


default_run_options[:pty] = true
ssh_options[:forward_agent] = true

#after "deploy", "deploy:cleanup" # keep only the last 5 releases


# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end

  task :setup_config, roles: :app do
    # sudo "ln -nfs #{current_path}/config/apache.conf /etc/apache2/sites-available/#{application}"
    run "mkdir -p #{shared_path}/config"
    put File.read("config/database.yml"), "#{shared_path}/config/database.yml"
    puts "Now edit the config files in #{shared_path}."
    # photos
  end

  after "deploy:setup", "deploy:setup_config"

  task :symlink_config, roles: :app do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
    #   run "ln -nfs #{shared_path}/config/database.yml  /srv/rails/wineplus-store/releases/20121205032322/config/database.yml"
    run "ln -nfs #{shared_path}/system #{release_path}/public/system"
  end
  after "deploy:finalize_update", "deploy:symlink_config"



end

