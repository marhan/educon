ENV["RAILS_ENV"] ||= 'test'

require 'rubygems'

unless ENV['TRAVIS']
  require 'simplecov'
  SimpleCov.start 'rails'
end


def configure
  require File.expand_path("../../../config/environment", __FILE__)
  require 'rspec/rails'

  Dir[Rails.root.join("spec/requests/support/**/*.rb")].each { |f| require f }

  ActiveSupport::Dependencies.clear
  ActiveRecord::Base.instantiate_observers

  # selenium
  Capybara.default_driver = :selenium
  Capybara.current_session.driver.browser.manage.window.resize_to(1100, 800)
end

def run
  # Reload FactoryGirl’s Factories
  FactoryGirl.factories.clear
  Dir[Rails.root.join("spec/factories/**/*.rb")].each { |f| load f }
  # Reload routes
  Educon::Application.reload_routes!
end


configure
run