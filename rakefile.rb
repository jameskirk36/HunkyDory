
@sinatra_pid = 0 # sinatra process id

desc "default task. Lint, test etc"
task :default => [:lint, :start_site, :test, :stop_site] do
	puts "Finished running rake ^-^"
end

desc "Run travis-lint on travis config file"
task :lint => :check_travis_config

task :check_travis_config do
	puts "Checking validity of travis-ci yaml config"
	raise "Problem linting travis config. Rake aborted!" unless system "travis-lint"
end


task :test do
	puts "Running Rspec tests..."
	failed unless system "rspec spec"
end

task :start_site do
	puts "starting site..."
	@sinatra_pid = Process.spawn "ruby src/homepage.rb"
	puts "site started!"
end

task :stop_site do
	puts "Stopping site..."
	stop_site
	puts "Site stopped!"
end

def failed
	stop_site	
	raise "Automated tests failed. Rake aborted!"
end

def stop_site
	puts Process.kill("SIGTERM", @sinatra_pid)
end
