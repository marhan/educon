# encoding: utf-8
require 'requests/spec_helper'
require 'requests/support/request_macros'

describe "Given user is signed in," do
  
  before(:each) do
    @user = FactoryGirl.create(:user)
    sign_in_as @user.email, @user.password
  end

  describe "when he edit his account" do

    before(:each) do
      click_link 'Edit Account'

      fill_in('user_firstname', :with => 'foz')
      fill_in('user_lastname', :with => 'baz')
      fill_in('user_email', :with=> 'foz.baz@test.com')
      fill_in('user_current_password', :with=> @user.password)
      click_button(I18n.t("form.button.save"))
    end

    it "than the new account data should be used in layout" do
      visit '/'
      page.should have_content("#{I18n.t('topbar.signed_in_as')} foz.baz@test.com")
    end
  end
end

