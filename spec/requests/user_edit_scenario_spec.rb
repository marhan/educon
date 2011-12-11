require 'spec_helper'
require 'requests/support/request_macros'

describe "User" do

  describe "signed in" do

    before(:each) do
      @user = FactoryGirl.create(:user)
      sign_in_as @user.email, @user.password
    end

    it "should be able to edit his account" do
      click_link 'Edit Account'

      fill_in('Firstname', :with => 'foz')
      fill_in('Lastname', :with => 'baz')
      fill_in('Email', :with=> 'foz.baz@test.com')
      fill_in('Current password', :with=> @user.password)
      click_button('Save')

      visit '/'
      page.should have_content('Signed in as foz.baz@test.com')
    end
  end
end

