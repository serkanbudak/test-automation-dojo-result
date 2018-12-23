require 'selenium-webdriver'
require_relative '../../config'

include BaseConstants

driver = Selenium::WebDriver.for :chrome

input_text = 'Kloia Dojo'

driver.navigate.to BASE_URL + INPUT_PATH

# Component - Input-1 - find by id
input_first = driver.find_element(:id, 'field1')
input_first.send_key(input_text)

# Component - Input-2 - find by name
input_first = driver.find_element(:name, 'field2')
input_first.send_key(input_text)

# Component - Input-3 - find by placeholder css
input_first = driver.find_element(:css, '[placeholder="field3"]')
input_first.send_key(input_text)

# Component - Input-4 - find by id
input_first = driver.find_element(:id, 'id-field4')
input_first.send_key(input_text)

# Component - Input-5 - find by class
input_first = driver.find_element(:class, 'field5')
input_first.send_key(input_text)

sleep 5