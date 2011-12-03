require 'spec_helper'

describe "User" do

  describe "signs in and " do

    before do
      @user = FactoryGirl.create(:user)
    end

    it "should be able to edit his account" do
      visit path_to_users_sign_out
      visit path_to_users_sign_in_page
      sign_in_user @user
      user_should_be_signed_in
      click_link link_for_edit_account

    end
  end
end
