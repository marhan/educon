RSpec.configure do |config|
  # Mailers
  config.include EmailSpec::Helpers, :type => :mailer
  config.include EmailSpec::Matchers, :type => :mailer
end