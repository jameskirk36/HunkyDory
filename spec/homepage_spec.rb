require 'capybara/rspec'
require './src/app.rb'

Capybara.app = HunkyDoryApp

RSpec.configure do |config|
  config.include Capybara::DSL
end

feature "Homepage" do

	scenario "hit the homepage and title should say hunky dory chocolates" do
		visit "/"
		page.should have_title "Hunky Dory Chocolates"
	end 
	scenario "hit the homepage and see 'Welcome to Hunky Dory Chocolates'" do
		visit "/"
		page.should have_content "Welcome to Hunky Dory Chocolates" 
	end
end
