desc "default task. Lint, test etc"
task :default => [:lint, :test] do
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



