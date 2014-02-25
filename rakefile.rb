desc "default task. Lint, test etc"
task :default => [:lint, :start_site, :test, :stop_site] do
	puts "Finished running rake ^-^"
end

desc "Run travis-lint on travis config file"
task :lint => :check_travis_config

task :check_travis_config do
	puts "Checking validity of travis-ci yaml config"
	system "travis-lint"
	raise "Problem linting travis config. Rake aborted!" unless $?.exitstatus == 0
end

task :test do
	puts "Running Rspec tests..."
	system "rspec spec"
	raise "Automated tests failed. Rake aborted!" unless $?.exitstatus == 0
end


pid = 0
task :start_site do
	puts "starting site..."
	pid = Process.spawn "ruby src/homepage.rb"
	puts "site started!"
end

task :stop_site do
	puts "Stopping site..."
	Process.kill("SIGTERM", pid)
	puts "Site stopped!"
end
