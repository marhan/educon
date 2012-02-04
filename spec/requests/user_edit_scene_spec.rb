# encoding: utf-8
require 'requests/spec_helper'

describe "Given user is signed in" do

  before(:each) do
    @user = FactoryGirl.create(:user)
    sign_in_as @user.email, @user.password
  end

  describe "and goes to the user edit page," do

    before(:each) do
      click_link 'link_edit_account'
    end

    describe "when the page is rendered" do

      it "than he should see the correct page header" do
        find("h1").should have_content("Deine Anmeldedaten");
      end

      it "than he should see the edit form" do
        find("#label_email").should have_content "Email"
        find("#label_password_new").should have_content "Neues Passwort"
        find("#label_password_new_confirmation").should have_content "Neues Passwort"
        find("#label_password_current").should have_content "Aktuelles Passwort"
        find("#help_password_confirmation").should have_content "Passwort Wiederholung"

        find("#fieldset_user_edit").find_button('Speichern')
        find("#fieldset_user_edit").find_link('Abbrechen')
      end

    end

    describe "when he edit his name and email with current password," do

      before(:each) do
        fill_in('field_email', :with=> 'foz.baz@test.com')
        fill_in('field_current_password', :with=> @user.password)
        click_button "Speichern"
      end

      it "than the new account data should be applied" do
        find("#topbar").should have_content("Eingeloggt als foz.baz@test.com")
      end

      it "than he should see the flash message 'Hinweis Die Angaben wurden erfolgreich geändert.'" do
        find("#flash_message").should have_content("Hinweis Die Angaben wurden erfolgreich geändert.");
      end

    end

    describe "when he edit his name and email without current password," do

      before(:each) do
        fill_in('field_email', :with=> 'foz.baz@test.com')
        click_button "Speichern"
      end

      it "than he should see the error message 'Aktuelles Passwort muss ausgefüllt werden'" do
        find("#error_message").should have_content("Aktuelles Passwort muss ausgefüllt werden")
      end

      it "than the original data should still be applied" do
        find("#topbar").should have_content("Eingeloggt als #{@user.email}")
      end

    end

  end

end

