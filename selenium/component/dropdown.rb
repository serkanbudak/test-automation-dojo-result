require 'selenium-webdriver'
require_relative '../../config'

include BaseConstants

driver = Selenium::WebDriver.for :chrome

driver.navigate.to BASE_URL + DROPDOWN_PATH

# Component - Dropdown-1 - find by id and select by value
dropdown = driver.find_element(:id, 'field1')
option_list = Selenium::WebDriver::Support::Select.new(dropdown)
option_list.select_by(:value, 'volvo')

# Component - Dropdown-2 - find by name and select by index
dropdown = driver.find_element(:name, 'field2')
option_list = Selenium::WebDriver::Support::Select.new(dropdown)
option_list.select_by(:index, '2')

# Component - Dropdown-3 - find by placeholder css and select by text
dropdown = driver.find_element(:css, '[placeholder="field3"]')
option_list = Selenium::WebDriver::Support::Select.new(dropdown)
option_list.select_by(:text, 'Saab')

# Component - Dropdown-4 - find by class and select by text
dropdown = driver.find_element(:class, 'field4')
option_list = Selenium::WebDriver::Support::Select.new(dropdown)
option_list.select_by(:text, 'Audi')

sleep 5