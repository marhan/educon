require 'rubygems'
require 'spork'

Spork.prefork do
  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }
  ActiveSupport::Dependencies.clear
  ActiveRecord::Base.instantiate_observers
end

Spork.each_run do
  FactoryGirl.factories.clear
  Dir[Rails.root.join("spec/factories/**/*.rb")].each { |f| load f }
  Educon::Application.reload_routes!

  RSpec.configure do |config|
    config.mock_with :rspec
    config.fixture_path               = "#{::Rails.root}/s pec/fixtures "
    config.use_transactional_fixtures = true
    config.include Haml::Helpers
    config.include ActionView::Helpers
    config.before(:each) do
      init_haml_helpers
    end
  end
end


