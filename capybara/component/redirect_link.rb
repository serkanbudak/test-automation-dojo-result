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

visit BASE_URL + REDIRECT_LINK_PATH

# Component - Redirect Link-1
click_link('kloia.com')
URI.parse(current_url).to_s.should be == 'https://kloia.com'

# Component - Redirect Link-2 switch window by index
click_link('kloia.co.uk')
page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
page.should have_current_path('https://kloia.co.uk', url: true)