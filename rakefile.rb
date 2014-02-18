
task :check_travis_config do
	puts "Checking validity of travis-ci yaml config"
	system "travis-lint"
	raise "Problem linting travis config. Rake aborted!" unless $?.exitstatus == 0
end

desc "Run travis-lint on travis config file"
task :lint => :check_travis_config


