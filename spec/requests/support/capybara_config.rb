# encoding: utf-8
RSpec.configure do |config|
  Capybara.default_selector = :css
  # selenium
  Capybara.default_driver = :selenium
  Capybara.current_session.driver.browser.manage.window.resize_to(1100, 800)
  #
  config.before(:each) do
    Capybara.reset_sessions!
  end
end