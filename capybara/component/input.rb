require 'capybara'
require 'capybara/dsl'
require 'rspec'
require_relative '../../config'

include BaseConstants
include Capybara::DSL
include RSpec::Matchers

input_text = 'Kloia Dojo'

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

visit INPUT_PATH

# Component - Input-1 - fill by id
fill_in('field1', with: input_text)

# Component - Input-2 - fill by name
fill_in('field2', with: input_text)

# Component - Input-3 - fill by placeholder
fill_in('field3', with: input_text)

# Component - Input-4 - fill by label
fill_in('label', with: input_text)

# Component - Input-5 - fill by css
find('.field5').set(input_text)

sleep 5