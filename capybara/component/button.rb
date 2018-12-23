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

visit BASE_URL + BUTTON_PATH

# Component - Button-1 - find by title
click_button('button-title')
page.should have_selector('h3', text: 'You have clicked the button 1')

# Component - Button-2 - find by text
click_link('Button 2')
page.should have_selector('h3', text: 'You have clicked the button 2')
#
# Component - Button-2 - find by id
click_link('button2')
page.should have_selector('h3', text: 'You have clicked the button 2')

# Component - Button-3 - find by value
click_button('Button 3')
page.should have_selector('h3', text: 'You have clicked the button 3')

sleep 5