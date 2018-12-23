require 'selenium-webdriver'
require_relative '../../config'

include BaseConstants

driver = Selenium::WebDriver.for :chrome

wait = Selenium::WebDriver::Wait.new(timeout: WAIT_TIME)

driver.navigate.to BASE_URL + DATE_PICKER_PATH

# Component - Datepicker-1
date_picker = driver.find_element(:id, 'date')
date_picker.click

date = wait.until {driver.find_element(:css, '[data-visible="true"] tr:nth-of-type(5) [role="button"]:nth-of-type(2)')}
date.click

if date_picker.attribute('value') == '12/24/2018'
  puts true
  puts date_picker.attribute('value')
else
  puts false
  puts date_picker.attribute('value')
end