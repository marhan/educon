require 'rubygems'

ENV["RAILS_ENV"] ||= "test"

def configure
  require File.expand_path(File.dirname(__FILE__) + '/../../config/environment')

  require 'cucumber'
  require 'cucumber/rails'
  require 'cucumber/formatter/unicode' # Comment out this line if you don't want Cucumber Unicode support
  require 'rspec/rails'
  require 'cucumber/rails/rspec'

  Capybara.default_selector = :css
  ActionController::Base.allow_rescue               = false
  Cucumber::Rails::World.use_transactional_fixtures = true
end

def run

  begin
    DatabaseCleaner.strategy = :truncation
  rescue NameError
    raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
  end
end

configure
run




