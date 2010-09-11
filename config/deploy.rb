#############################################################
# Application
#############################################################

set :application, "captest"
set :deploy_to, "/home/deploy/#{application}"

#############################################################
# Settings
#############################################################

default_run_options[:pty] = true  # Must be set for the password prompt from git to work
ssh_options[:forward_agent] = true
set :use_sudo, false
set :rails_env, "production"

#############################################################
# Servers
#############################################################

set :user, "deploy"  # The server's user for deploys
set :domain, "208.88.124.224" # or ip address
server domain, :app, :web, :files, :gateway, :db, :primary => true
# role :db,  "your slave db-server here"

#############################################################
# Git
#############################################################

set :scm, :git
set :branch, "master"
# set :scm_user, ""
set :scm_passphrase, "deploy"  # The deploy user's password on the server
set :repository, "git@github.com:outofcuriosity/capistrano.git"  # Your clone URL
set :deploy_via, :remote_cache

#############################################################
# Recipes
#############################################################

require 'rubygems'

# aptitude
require 'cap_recipes/tasks/aptitude'
# apache
require 'cap_recipes/tasks/apache'

# Restart passenger on deploy
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end