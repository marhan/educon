# encoding: utf-8
require 'requests/spec_helper'

describe "Given User" do

  describe "is going to start page and sees the login menu," do

    before(:each) {
      visit '/'
      find("#topbar").find("form").should have_button "Anmelden"
      find_field('field_email')['placeholder'].should == "Email"
      find_field('field_password')['placeholder'].should == "Passwort"
    }

    describe "when he is not signed up," do

      before(:each) do
        User.find(:first, :conditions => {:email => 'user@not-signed-in.com'}).should be_nil
      end

      describe "and tries to sign in," do

        before(:each) do
          fill_in("field_email", :with => "user@not-signed-in.com")
          fill_in("field_password", :with => "please")
          click_button("Anmelden")
        end

        it "than he see the flash message 'Warnung Ungültige Anmeldedaten'" do
          find("#flash_message").should have_content("Warnung Ungültige Anmeldedaten")
        end

        it "than he is still signed out" do
          find("#topbar").should have_content("Registrieren")
          find("#topbar").find("form").should have_button "Anmelden"
          find("#topbar").should_not have_content("Angemeldet als")
        end
      end
    end

    describe "when he is signed up" do
      before(:each) do
        @user = FactoryGirl.create(:user)
      end

      describe "and tries to signin with wrong password," do

        before(:each) do
          fill_in("field_email", :with => @user.email)
          fill_in("field_password", :with => "wrong-password")
          click_button("Anmelden")
        end

        it "than he see the flash message 'Warnung Ungültige Anmeldedaten'" do
          find("#flash_message").should have_content("Warnung Ungültige Anmeldedaten")
        end

        it "than he should still signed out" do
          find("#topbar").find("form").should have_button "Anmelden"
          find("#topbar").should have_content("Registrieren")
          find("#topbar").should_not have_content("Angemeldet als")
        end
      end

      describe "and signs in with correct data," do

        before(:each) do
          fill_in("field_email", :with => @user.email)
          fill_in("field_password", :with => @user.password)
          click_button("Anmelden")
        end

        it "then he should see the flash message 'Hinweis Erfolgreich angemeldet. '" do
          find("#flash_message").should have_content("Hinweis Erfolgreich angemeldet")
        end

        it "then he should see 'Angemeldet als ...'" do
          find("#topbar").should have_content("Angemeldet als #{@user.email}")
        end
      end
    end
  end
end