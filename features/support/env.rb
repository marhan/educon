require 'rubygems'

# 
def prefork
  ENV["RAILS_ENV"] ||= "test"
  require File.expand_path(File.dirname(__FILE__) + '/../../config/environment')

  require 'cucumber'
  require 'cucumber/rails'
  require 'cucumber/formatter/unicode' # Comment out this line if you don't want Cucumber Unicode support
  require 'rspec/rails'
  require 'cucumber/rails/rspec'

  Capybara.default_selector = :css
end

#
def each_run
  ActionController::Base.allow_rescue               = false
  Cucumber::Rails::World.use_transactional_fixtures = true

  begin
    DatabaseCleaner.strategy = :truncation
  rescue NameError
    raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
  end
end

# Configuration for Travis-CI
if ENV['TRAVIS']
  prefork()
  each_run()
else
  require 'spork'
  Spork.prefork do
    prefork()
  end
  Spork.each_run do
    each_run()
  end
end



