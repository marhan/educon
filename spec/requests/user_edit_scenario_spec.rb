require 'spec_helper'
require 'requests/support/request_macros'

describe "Given user is signed in," do
  
  before(:each) do
    @user = FactoryGirl.create(:user)
    sign_in_as @user.email, @user.password
  end

  describe "when he edit his account" do

    before(:each) do
      click_link 'Edit Account'

      fill_in('Firstname', :with => 'foz')
      fill_in('Lastname', :with => 'baz')
      fill_in('Email', :with=> 'foz.baz@test.com')
      fill_in('Current password', :with=> @user.password)
      click_button('Save')
    end

    it "than the new account data should be used in layout" do
      visit '/'
      page.should have_content('Signed in as foz.baz@test.com')
    end
  end
end

