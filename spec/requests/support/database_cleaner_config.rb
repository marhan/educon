# encoding: utf-8
DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean_with :truncation
RSpec.configure do |config|
  config.use_transactional_fixtures = false
  config.before(:each) do
    DatabaseCleaner.start
  end
  config.after(:each) do
    DatabaseCleaner.clean
  end
end