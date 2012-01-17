# encoding: utf-8
require 'requests/spec_helper'
require 'requests/support/request_macros'

describe "Given user is signed in," do

  before(:each) do
    @user = FactoryGirl.create(:user)
    sign_in_as @user.email, @user.password
  end

  describe "when he goes to the edit profile page," do

    before(:each) do
      visit("/")
      click_link 'link_edit_account'
    end

    describe "than he should see" do

      it "the page correct page header" do
          expected_content = "Dein Profil #{@user.firstname} #{@user.lastname}"
          find("h1").should have_content(expected_content);
      end

    end

    describe "and edit his account with correct data," do

      before(:each) do
        fill_in('field_firstname', :with => 'foz')
        fill_in('field_lastname', :with => 'baz')
        fill_in('field_email', :with=> 'foz.baz@test.com')
        fill_in('field_current_password', :with=> @user.password)
        click_button "Speichern"
      end

      it "than the new account data should be applied" do
        page.should have_content("Eingeloggt als foz.baz@test.com")
      end

    end

     describe "and tries to edit his account without current password," do

      before(:each) do
        fill_in('field_firstname', :with => 'foz')
        fill_in('field_lastname', :with => 'baz')
        fill_in('field_email', :with=> 'foz.baz@test.com')
        click_button "Speichern"
      end

      it "than he schould see the error message 'Aktuelles Passwort muss ausgefüllt werden'" do
        find("#error_message").should have_content("Aktuelles Passwort muss ausgefüllt werden")
      end

    end

  end

end

