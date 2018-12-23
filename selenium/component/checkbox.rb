require 'selenium-webdriver'
require_relative '../../config'

include BaseConstants

driver = Selenium::WebDriver.for :chrome

driver.navigate.to BASE_URL + CHECKBOX_PATH

# Component - Checkbox-1 - find by id
input_first = driver.find_element(:id, 'field1')
input_first.click

# Component - Checkbox-2 - find by name
input_first = driver.find_element(:name, 'field2')
input_first.click

# Component - Checkbox-3 - find by value css
input_first = driver.find_element(:css, '[value="val-saruman"]')
input_first.click

# Component - Checkbox-4 - find by css
input_first = driver.find_element(:css, '[value="val-gandalf"]')
input_first.click

sleep 5