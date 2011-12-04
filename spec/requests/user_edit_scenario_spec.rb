require 'spec_helper'

describe "User" do

  describe "signs in and " do

    before do
      @user = FactoryGirl.create(:user)
      @config = ConfigLoader.create File.expand_path("../support/requests_config.yml", __FILE__)
    end

    it "should be able to edit his account" do
      visit path_to_users_sign_out
      visit path_to_users_sign_in_page
      sign_in_user @user
      user_should_be_signed_in
      click_link @config.account

    end
  end
end
