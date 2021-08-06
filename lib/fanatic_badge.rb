require 'capybara/session'

module FanaticBadge
  STACKOVERFLOW_URL = 'https://stackoverflow.com/'.freeze
  REVIEW_URL = "#{STACKOVERFLOW_URL}review/".freeze
  LOGIN_URL = "#{STACKOVERFLOW_URL}users/login/".freeze

  class CookiesButtonNotFound < StandardError; end

  class FormInputNotFound < StandardError; end

  class << self
    def run
      session = Capybara::Session.new(:selenium_chrome_headless)

      session.visit LOGIN_URL
      accept_cookies(session)
      fill_form(session)

      session.find('#submit-button').click

      sleep 3
      session.visit REVIEW_URL
      sleep 3
    end

    private

    def accept_cookies(session)
      session.find('.js-accept-cookies').click
    rescue Capybara::ElementNotFound
      raise CookiesButtonNotFound
    end

    def fill_form(session)
      session.within '#login-form' do
        session.fill_in 'email', with: CREDENTIALS['stackoverflow']['email']
        session.fill_in 'password', with: CREDENTIALS['stackoverflow']['password']
      end
    rescue Capybara::ElementNotFound
      raise FormInputNotFound
    end
  end
end
