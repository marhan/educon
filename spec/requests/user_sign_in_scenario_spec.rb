require 'spec_helper'
require 'requests/support/request_macros'

describe "User" do

  describe "is not signed up" do

    before(:each) do
      User.find(:first, :conditions => {:email => 'user@test.com'}).should be_nil
    end

    it "should not be able to sign in" do
      visit '/users/sign_in'
      sign_in_as 'user@test.com', 'please'
      page.should have_content 'Invalid email or password.'

      visit '/'
      page.should_not have_content("Signed in as")
      page.should have_content("Sign in")
      page.should have_content("Sign up")
    end
  end

  describe "enters wrong password" do

    before(:each) do
      @user = FactoryGirl.create(:user)
    end

    it "should not signed in" do
      sign_in_as @user.email, 'wrong password'
      page.should have_content 'Invalid email or password.'

      visit '/'
      page.should_not have_content("Signed in as")
      page.should have_content("Sign in")
      page.should have_content("Sign up")
    end
  end

  describe "signs in with correct sign in data" do

    before(:each) do
      @user = FactoryGirl.create(:user)
    end

    it 'should sign in successfully' do
      visit '/users/sign_in'
      fill_in("user_email", :with => @user.email)
      fill_in("user_password", :with => @user.password)
      click_button("Sign in")

      page.should have_content 'Signed in successfully.'

      page.should_not have_content 'Sign up'
      page.should_not have_content 'Sign in'
      page.should have_content 'Sign out'
    end
  end

end