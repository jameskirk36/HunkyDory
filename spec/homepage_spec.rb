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
		page.should have_content "Coming soon..." 
		page.should have_xpath "//img[@src='images/logo.png']"
	end
end
