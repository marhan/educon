# encoding: utf-8
require 'spec_helper'
require 'requests/support/request_macros'

describe "Given User" do

  describe "is not signed up," do

    before(:each) do
      User.find(:first, :conditions => {:email => 'user@test.com'}).should be_nil
    end

    describe "when he tries to sign in," do

      before(:each) do
        visit '/users/sign_in'
        sign_in_as 'user@test.com', 'please'
      end

      it "than he see error message and is not signed in" do
        page.should have_content "Warnung Ungültige Anmeldedaten"

        visit '/'
        page.should_not have_content I18n.t('topbar.signed_in_as')
        page.should have_content I18n.t('topbar.menu.item.sign.in')
        page.should have_content I18n.t('topbar.menu.item.sign.up')
      end
    end
  end

  describe "is signed up," do
    before(:each) do
      @user = FactoryGirl.create(:user)
    end

    describe "when he enters wrong password," do

      before(:each) do
        sign_in_as @user.email, 'wrong password'
        page.should have_content I18n.t('devise.failure.invalid')
      end

      it "then he should not signed in" do
        visit '/'
        page.should have_content I18n.t('topbar.menu.item.sign.in')
        page.should have_content I18n.t('topbar.menu.item.sign.up')
        page.should_not have_content I18n.t('topbar.signed_in_as')
      end
    end

    describe "when he types in correct sign in data," do

      before(:each) do
        visit '/users/sign_in'

        fill_in("user_email", :with => @user.email)
        fill_in("user_password", :with => @user.password)
        click_button("button_sign_in")
      end

      it "then he should see 'Signed in successfully.'" do
        page.should have_content I18n.t('devise.sessions.signed_in')
      end

      it 'then he should signed in successfully' do
        page.should have_content("#{I18n.t('topbar.signed_in_as')} #{@user.email}")
        page.should have_content I18n.t('topbar.menu.item.sign.out')
        page.should_not have_content I18n.t('topbar.menu.item.sign.up')
        page.should_not have_content I18n.t('topbar.menu.item.sign.in')
      end
    end
  end

end