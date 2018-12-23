require 'selenium-webdriver'
require_relative '../../config'

include BaseConstants

driver = Selenium::WebDriver.for :chrome

driver.navigate.to BASE_URL + REDIRECT_LINK_PATH

# Component - Redirect Link-1
link = driver.find_element(:link, 'kloia.com')
link.click

if driver.current_url == 'https://kloia.com/'
  puts true
else
  puts false
end

# Component - Redirect Link-2 switch window by index
link = driver.find_element(:link_text, 'kloia.co.uk')
link.click

sleep 10

driver.switch_to.window(driver.window_handles[1])

if driver.current_url == 'https://kloia.co.uk/'
  puts true
else
  puts false
end

sleep 5