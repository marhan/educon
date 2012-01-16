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

  DatabaseCleaner.strategy = :truncation
  DatabaseCleaner.clean_with :truncation

  RSpec.configure do |config|
    config.use_transactional_fixtures = true
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