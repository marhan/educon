# encoding: utf-8
require 'spec_helper'
require 'requests/support/request_macros'

describe "Given user is not signed up" do

  before(:each) do
    User.find(:first, :conditions => {:email => 'user@test.com'}).should be_nil
  end

  describe "and goes to the sign up page," do

    before(:each) do
      visit '/users/sign_up'
    end

    describe "when he enters valid data," do

      before(:each) do
        fill_in('Firstname', :with => 'Testy')
        fill_in('Lastname', :with => 'McUserton')
        fill_in('Email', :with => 'user@test.com')
        fill_in('Password', :with => 'please')
        fill_in('Password confirmation', :with => 'please')
        click_button('Register')
      end

      it "than he signed up successfully" do
        page.should have_content 'Welcome! You have signed up successfully.'
      end

    end

    describe "when he signs up with invalid email" do

      before(:each) do
        fill_in('Firstname', :with => 'Testy')
        fill_in('Lastname', :with => 'McUserton')
        fill_in('Email', :with => 'invalidemail')
        fill_in('Password', :with => 'please')
        fill_in('Password confirmation', :with => 'please')
        click_button('Register')
      end

      it "than he should see 'Email is invalid'" do
        page.should have_content "Email is invalid"
      end

    end

    describe "when he signs up without a password" do

      before(:each) do
        fill_in('Firstname', :with => 'Testy')
        fill_in('Lastname', :with => 'McUserton')
        fill_in('Email', :with => 'invalidemail')
        fill_in('Password', :with => '')
        fill_in('Password confirmation', :with => 'please')
        click_button('Register')
      end

      it "than he should see 'Password can't be blank'" do
        page.should have_content "Password can't be blank"
      end

    end

    describe "when he signs up without password confirmation" do

      before(:each) do
        fill_in('Firstname', :with => 'Testy')
        fill_in('Lastname', :with => 'McUserton')
        fill_in('Email', :with => 'invalidemail')
        fill_in('Password', :with => 'please')
        fill_in('Password confirmation', :with => '')
        click_button('Register')
      end

      it "than he should see 'Password doesn't match confirmation'" do
        page.should have_content "Password doesn't match confirmation"
      end
    end
  end
end