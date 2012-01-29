# encoding: utf-8
require 'requests/spec_helper'

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

      it "than he should see 'Ungültige Anmeldedaten.'" do
        page.should have_content "Ungültige Anmeldedaten."
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

      it "then he should see 'Erfolgreich angemeldet.'" do
        page.should have_content "Erfolgreich angemeldet."
      end

      it "then he should be signed in" do
        find('#page_title').should have_content("Übersicht")
        find('#utility_nav').should have_content("#{@admin.email}")
      end

    end

    describe "when he types in wrong password," do

      before(:each) do
        visit '/admin/login'
        fill_in('admin_user_email', :with => @admin.email)
        fill_in('admin_user_password', :with => 'wrongpassword')
        click_button('Login')
      end

      it "then he should see 'Ungültige Anmeldedaten.'" do
        page.should have_content "Ungültige Anmeldedaten."
      end

      it "then he should not be signed in" do
        find_button 'Login'
        page.should_not have_content("#{@admin.email} Abmelden")
      end

    end

  end
end