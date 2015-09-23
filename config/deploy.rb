# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'hello_world'
    set :repo_url, 'git@github.com:mirussolutions/hello_world.git'
    set :deploy_to, '/home/mirus/webapps/trainingapp2'
   
	set :use_sudo, false
	set :deploy_via, :checkout
	set :branch, "master"

	set :default_env, {
	    'PATH' => "#{deploy_to}/bin:$PATH",
	    'GEM_HOME' => "#{deploy_to}/gems",
	    'RUBYLIB' => "#{deploy_to}/lib"
	}

	set :scm, :git
	set :scm_username, "mirussolutions"
	
    set :pty, true
    set :tmp_dir, '/home/mirus/tmp'
   namespace :deploy do
	desc 'Restart application'
	  task :restart do
	    on roles(:app), in: :sequence, wait: 5 do
	      capture("#{deploy_to}/bin/restart")
	  end
	end
  end

  after 'deploy:finishing', 'deploy:restart'