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

visit BASE_URL + DROPDOWN_PATH

# Component - Dropdown-1 - find by id and select Volvo
select('Volvo', from: 'field1')

# Component - Dropdown-2 - find by name and select Audi
select('Audi', from: 'field2')
find('[name="field2"]').value.should be == 'audi'

# Component - Dropdown-3 - find by placeholder and select Mercedes by value
select('Mercedes', from: 'field3')
find('[placeholder="field3"]').value.should be == 'mercedes'

# Component - Dropdown-4 - find by css and verify selected value
# find('.field4').select('Saab')                ==> option1
# find('.field4 [value="saab"]').select_option  ==> option2
find('.field4').value.should be == 'saab'

sleep 5