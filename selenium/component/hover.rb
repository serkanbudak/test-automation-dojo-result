require 'selenium-webdriver'
require_relative '../../config'

include BaseConstants

driver = Selenium::WebDriver.for :chrome

driver.navigate.to BASE_URL + HOVER_PATH

# Component - Hover - Hover and puts text
element = driver.find_element(:class, 'hover-item-box')
driver.action.move_to(element).perform
text_content = driver.find_element(:class, 'hover-explanation-wrapper')
puts text_content.text

sleep 5