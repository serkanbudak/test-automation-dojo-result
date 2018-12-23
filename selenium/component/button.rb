require 'selenium-webdriver'
require_relative '../../config'

include BaseConstants

driver = Selenium::WebDriver.for :chrome

wait = Selenium::WebDriver::Wait.new(timeout: WAIT_TIME)

driver.navigate.to BASE_URL + BUTTON_PATH

# Component - Button-1 - find by css
input_first = driver.find_element(:css, '[title="button-title"]')
input_first.click
wait.until {driver.find_element(:css, 'h3').text == 'You have clicked the button 1'}

# Component - Button-2 - find by link text
input_first = driver.find_element(:id, 'button2')
input_first.click
wait.until {driver.find_element(:css, 'h3').text == 'You have clicked the button 2'}

# Component - Button-3 - find by class or css
input_first = driver.find_element(:css, '[value="Button 3"]')
input_first.click
wait.until {driver.find_element(:css, 'h3').text == 'You have clicked the button 3'}

sleep 5