# encoding: utf-8
RSpec.configure do |config|
  Capybara.default_selector = :css
  config.before(:each) do
    Capybara.reset_sessions!
  end
end