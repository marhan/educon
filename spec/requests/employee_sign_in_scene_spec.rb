# encoding: utf-8
require 'requests/spec_helper'

describe "Given Employee" do

  describe "is going to start page and sees the login menu," do

    before(:each) {
      visit '/'
      find("#topbar").find("form").should have_button "Anmelden"
      find_field('field_email')['placeholder'].should == "Email"
      find_field('field_password')['placeholder'].should == "Passwort"
    }

    describe "when he is signed up" do
      before(:each) do
        @employee = FactoryGirl.create(:employee)
      end

      describe "and tries to signin with wrong password," do

        before(:each) do
          fill_in("field_email", :with => @employee.email)
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
          fill_in("field_email", :with => @employee.email)
          fill_in("field_password", :with => @employee.password)
          click_button("Anmelden")
        end

        it "then he should see the flash message 'Hinweis Erfolgreich angemeldet. '" do
          find("#flash_message").should have_content("Hinweis Erfolgreich angemeldet")
        end

        it "then he should see 'Angemeldet als ...'" do
          find("#topbar").should have_content("Angemeldet als #{@employee.email}")
        end
      end
    end
  end
end