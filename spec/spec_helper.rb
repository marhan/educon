require 'simplecov'
SimpleCov.start 'rails'

require 'rubygems'

ENV["RAILS_ENV"] ||= 'test'

def configure
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'

  Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

  ActiveSupport::Dependencies.clear
  ActiveRecord::Base.instantiate_observers
  
  DatabaseCleaner.strategy = :truncation
  DatabaseCleaner.clean_with :truncation

  RSpec.configure do |config|
    config.mock_with :rspec
    config.use_transactional_fixtures = true
    # Controller 
    config.extend ControllerMacros, :type => :controller
    # For ApplicationHelper_Specs -> HAML Helper Methods
    config.include Haml, :type => :helper
    config.include Haml::Helpers, :type => :helper
    config.before(:each, :type => :helper) do |config|
      init_haml_helpers
    end


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

if defined?(Spork)
  Spork.prefork { configure }
  Spork.each_run { run }
else
  configure
  run
end





