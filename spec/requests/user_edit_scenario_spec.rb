require 'spec_helper'

describe "User" do

  describe "signs in and " do

    before do
      @user = FactoryGirl.create(:user)
      @config = ConfigLoader.create File.expand_path("../support/requests_config.yml", __FILE__)
    end

    it "should be able to edit his account" do
      visit @config.path.to.users.sign.out
      visit @config.path.to.users.sign.in
      sign_in_user @user
      user_should_be_signed_in
      click_link @config.link.edit.account

    end
  end
end
