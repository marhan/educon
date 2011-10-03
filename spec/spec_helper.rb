require 'rubygems'

ENV["RAILS_ENV"] ||= 'test'

def configure
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'

  ActiveSupport::Dependencies.clear
  ActiveRecord::Base.instantiate_observers

  RSpec.configure do |config|
    config.mock_with :rspec
    config.fixture_path               = "#{::Rails.root}/spec/fixtures"
    config.use_transactional_fixtures = true
    config.include Haml::Helpers
    config.include ActionView::Helpers

    config.before :suite do
      DatabaseCleaner.strategy = :truncation
      DatabaseCleaner.clean_with :truncation
    end

    config.before :each do
      DatabaseCleaner.start
      init_haml_helpers
    end

    config.after :each do
      DatabaseCleaner.clean
    end
  end
end

def run
  Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }
  FactoryGirl.factories.clear
  Dir[Rails.root.join("spec/factories/**/*.rb")].each { |f| load f }
  Educon::Application.reload_routes!
end

if defined?(Spork)
  Spork.prefork { configure }
  Spork.each_run { run }
else
  configure
  run
end





