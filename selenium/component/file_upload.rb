require 'selenium-webdriver'
require_relative '../../config'

include BaseConstants

driver = Selenium::WebDriver.for :chrome

driver.navigate.to BASE_URL + FILE_UPLOAD_PATH

# # Component - File Upload-1
input = driver.find_element(:css, '[type="file"]')
input.send_key(File.expand_path('../../resource/big-logo.png', __dir__))

if driver.find_element(:css, 'aside li').text == 'big-logo.png'
  puts true
else
  puts false
end


sleep 5