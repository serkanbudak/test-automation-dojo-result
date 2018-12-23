require 'capybara'
require 'capybara/dsl'
require 'rspec'
require_relative '../../config'

include BaseConstants
include Capybara::DSL
include RSpec::Matchers

RSpec.configure do |config|
  config.include Capybara::DSL, type: :feature
end

Capybara.configure do |config|
  config.default_driver = :selenium
  config.default_selector = :css
  config.app_host = BASE_URL
  config.default_max_wait_time = WAIT_TIME
end

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

visit BASE_URL + CHECKBOX_PATH

# Component - Checkbox-1 - find by label text
check('Aragorn')
sleep 2
uncheck('Aragorn')
sleep 2

# Component - Checkbox-2 - find by name
check('field2')
sleep 2
uncheck('field2')
sleep 2

# Component - Checkbox-3 - find by id
check('field3')
sleep 2
uncheck('field3')
sleep 2

# Component - Checkbox-4
find('fieldset div:nth-of-type(4) input').click
puts find('fieldset div:nth-of-type(4) input').checked?

sleep 5