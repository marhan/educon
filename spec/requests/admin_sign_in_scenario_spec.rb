# encoding: utf-8
require 'spec_helper'
require 'requests/support/request_macros'

describe "Given admin" do

  describe "is not signed up," do

    before(:each) do
      AdminUser.find(:first, :conditions => {:email => "admin@wrong.com"}).should be_nil
    end

    describe "when he tries to sign in," do

      before(:each) do
        visit '/admin/login'
        fill_in('admin_user_email', :with => 'admin@wrong.com')
        fill_in('admin_user_password', :with => 'please')
        click_button('Login')
      end

      it "than he should see 'Invalid email or password.'" do
        page.should have_content I18n.t('devise.failure.invalid')
      end

      it "than he should not be signed in" do
        page.should have_content 'Login'
        page.should_not have_content 'Logout'
      end

    end

  end

  describe "is signed up," do

    before(:each) do
      @admin = FactoryGirl.create(:admin_user)
    end

    describe "when he tries to sign in with correct data," do

      before(:each) do
        visit '/admin/login'
        fill_in('admin_user_email', :with => @admin.email)
        fill_in('admin_user_password', :with => @admin.password)
        click_button('Login')
      end

      it "then he should see 'Signed in successfully.'" do
        page.should have_content I18n.t('devise.sessions.signed_in')
      end

      it "then he should be signed in" do
        page.should have_content I18n.t('active_admin.logout')
        # not in locales, yet
        page.should_not have_content 'Login'
      end

    end

    describe "when he types in wrong password," do

      before(:each) do
        visit '/admin/login'
        fill_in('admin_user_email', :with => @admin.email)
        fill_in('admin_user_password', :with => 'wrongpassword')
        click_button('Login')
      end

      it "then he should see 'Invalid email or password.'" do
        page.should have_content I18n.t('devise.failure.invalid')
      end

      it "then he should not be signed in" do
        page.should have_content 'Login'
        page.should_not have_content 'Logout'
      end

    end

  end
end