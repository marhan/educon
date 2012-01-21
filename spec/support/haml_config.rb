RSpec.configure do |config|
  config.include Haml, :type => :helper
  config.include Haml::Helpers, :type => :helper
  config.before(:each, :type => :helper) do |config|
    init_haml_helpers
  end
end