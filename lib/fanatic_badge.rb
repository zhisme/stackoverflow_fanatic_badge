require 'capybara/session'

module FanaticBadge
  STACKOVERFLOW_URL = 'https://stackoverflow.com/'.freeze

  def self.run
    session = Capybara::Session.new(:selenium_chrome)

    session.visit STACKOVERFLOW_URL + 'users/login/'
    session.within '#login-form' do
      session.fill_in 'email', with: CREDENTIALS['stackoverflow']['email']
      session.fill_in 'password', with: CREDENTIALS['stackoverflow']['password']
    end

    session.find('#submit-button').click

    sleep 10
  end
end
