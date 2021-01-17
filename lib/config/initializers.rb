require 'capybara'
require 'rollbar'
require 'config/credentials'
require 'selenium/webdriver'

Rollbar.configure do |config|
  config.access_token = CREDENTIALS['rollbar']['token']
end
