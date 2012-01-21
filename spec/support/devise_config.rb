RSpec.configure do |config|
  config.include Devise::TestHelpers, :type => :controller
  config.include Rails.application.routes.url_helpers, :type => :controller
  config.include Devise::Mailers::Helpers, :type => :controller
end
