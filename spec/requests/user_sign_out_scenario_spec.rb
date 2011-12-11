# encoding: utf-8
require 'spec_helper'
require 'requests/support/request_macros'

describe "Given user is signed in," do

  before(:each) do
    @user = FactoryGirl.create(:user)
    sign_in_as @user.email, @user.password
    page.should have_content("Signed in as #{@user.email}")
  end

  describe "when he is signing out," do

    before(:each) do
      visit '/users/sign_out'
      page.should have_content 'Sign in'
    end

    it "than he should be signed out" do
      visit '/'
      page.should_not have_content("Signed in as #{@user.email}")
      page.should_not have_content 'Sign out'
      page.should have_content 'Sign up'
      page.should have_content 'Sign in'
    end
  end

end