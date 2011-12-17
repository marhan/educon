# encoding: utf-8
require 'spec_helper'
require 'requests/support/request_macros'

describe "Given user is signed in," do

  before(:each) do
    @user = FactoryGirl.create(:user)
    sign_in_as @user.email, @user.password
    page.should have_content("#{I18n.t('topbar.signed_in_as')} #{@user.email}")
  end

  describe "when he is signing out," do

    before(:each) do
      visit '/users/sign_out'
      page.should have_content 'Sign in'
    end

    it "than he should be signed out" do
      visit '/'
      page.should_not have_content("#{I18n.t('topbar.signed_in_as')} #{@user.email}")
      page.should_not have_content I18n.t('topbar.menu.item.sign.out')
      page.should have_content I18n.t('topbar.menu.item.sign.up')
      page.should have_content I18n.t('topbar.menu.item.sign.in')
    end
  end

end