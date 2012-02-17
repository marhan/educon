module ControllerMacros

  def signin_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user                           = FactoryGirl.create(:user)
      sign_in user
    end
  end

  def signin_employee
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:employee]
      employee                       = FactoryGirl.create(:employee)
      sign_in employee
    end
  end
end

RSpec.configure do |config|
  # Controllers
  config.extend ControllerMacros, :type => :controller
  # Helpers
  config.extend ControllerMacros, :type => :helper
end