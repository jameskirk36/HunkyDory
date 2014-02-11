require 'selenium-webdriver'

describe "Homepage" do
	it "should hit the homepage and title should say hunky dory chocolates" do
		driver = Selenium::WebDriver.for :firefox
		driver.navigate.to "http://localhost:4567"
		driver.find_element(:tag_name => "title").text.should eq( "hunk dory chocolates")
		driver.quit
	end 
end
