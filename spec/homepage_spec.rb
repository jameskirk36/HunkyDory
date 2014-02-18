require 'selenium-webdriver'

describe "Homepage" do
	it "should hit the homepage and title should say hunky dory chocolates" do
		driver = Selenium::WebDriver.for :firefox
		driver.navigate.to "http://localhost:4567"
		driver.title.should eq("hunky dory")
		driver.quit
	end 
end
