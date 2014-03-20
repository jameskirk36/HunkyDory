require 'capybara/rspec'
require 'sinatra'

Capybara.app = Sinatra::Application

RSpec.configure do |config|
  config.include Capybara::DSL
end

feature "Homepage" do

	scenario "hit the homepage and title should say hunky dory chocolates" do
		visit '/'
		has_title? "hunky dory"
	end 
	scenario "hit the homepage and see 'Welcome to Hunky Dory Chocolates'" do
		visit '/'
		has_text? "Welcome to Hunky Dory Chocolates" 
	end
end
