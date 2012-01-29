RSpec.configure do |config|
  config.include EmailSpec::Helpers
  config.include EmailSpec::Matchers
  config.include EmailSpec::MailerDeliveries
end