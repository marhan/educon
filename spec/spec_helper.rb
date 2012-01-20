ENV["RAILS_ENV"] ||= 'test'

require 'rubygems'

unless ENV['TRAVIS']
  require 'simplecov'
  SimpleCov.start 'rails'
end

def configure
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'action_mailer'

  Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

  ActiveSupport::Dependencies.clear
  ActiveRecord::Base.instantiate_observers

  DatabaseCleaner.strategy = :truncation
  DatabaseCleaner.clean_with :truncation

  RSpec.configure do |config|
    config.mock_with :rspec
    config.use_transactional_fixtures = true
    # Macros
    config.extend ControllerMacros, :type => :controller
    config.extend ControllerMacros, :type => :helper
  end
end

def run
  DatabaseCleaner.clean
  # Reload FactoryGirl’s Factories
  FactoryGirl.factories.clear
  Dir[Rails.root.join("spec/factories/**/*.rb")].each { |f| load f }
  # Reload routes
  Educon::Application.reload_routes!
end

configure
run






