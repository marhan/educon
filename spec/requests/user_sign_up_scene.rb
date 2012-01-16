# encoding: utf-8
require 'requests/spec_helper'
require 'requests/support/request_macros'

describe "Given user is not signed up" do

  before(:each) do
    User.find(:first, :conditions => {:email => 'user@test.com'}).should be_nil
  end

  describe "and goes to the sign up page," do

    before(:each) do
      visit '/users/sign_up'
    end

    describe "when the page is rendered" do

      it "than he see the expected content" do
        page.should have_content("Willkommen")
        page.should have_content("hier kannst du dein Profil erstellen")

        page.should have_content("Registrieren")

        page.should have_content('Vorname')
        page.should have_content('Nachname')
        page.should have_content('Email')
        page.should have_content('Passwort')
        page.should have_content("Passwort Wiederholung")

        find_button('Anlegen')
        find_button('Zurücksetzen')

        page.should have_content("Verwandte Links")
        find_link('Passwort vergessen?')
      end

    end

    describe "when he enters valid data'," do

      before(:each) do
        fill_in('field_firstname', :with => 'Testy')
        fill_in('field_lastname', :with => 'McUserton')
        fill_in('field_email', :with => 'user@test.com')
        fill_in('field_password', :with => 'please')
        fill_in('field_password_confirmation', :with => 'please')
      end

      describe "and click button 'Zurücksetzen'" do

        before do
          click_button('button_reset')
        end

        it "than all entered data is removed", :js => true do
          find_field('field_firstname').value.should == ""
          find_field('field_lastname').value.should == ""
          find_field('field_email').value.should == ""
          find_field('field_password').value.should == ""
          find_field('field_password_confirmation').value.should == ""
        end

      end

      describe "and click button 'Anlegen" do

        before do
          click_button('button_signup')
        end

        it "than he signed up successfully" do
          page.should have_content 'Hinweis Sie haben sich erfolgreich registriert.'
        end

      end

    end

    describe "when he signs up with invalid email" do

      before(:each) do
        fill_in('field_firstname', :with => 'Testy')
        fill_in('field_lastname', :with => 'McUserton')
        fill_in('field_email', :with => 'invalidemail')
        fill_in('field_password', :with => 'please')
        fill_in('field_password_confirmation', :with => 'please')
        click_button('button_signup')
      end

      it "than he should see 'Email is invalid'" do
        page.should have_content "Email ist nicht gültig"
      end

    end

    describe "when he signs up without a password" do

      before(:each) do
        fill_in('field_firstname', :with => 'Testy')
        fill_in('field_lastname', :with => 'McUserton')
        fill_in('field_email', :with => 'invalidemail')
        fill_in('field_password', :with => '')
        fill_in('field_password_confirmation', :with => 'please')
        click_button('button_signup')
      end

      it "than he should see 'Passwort errors.messages.blank'" do
        page.should have_content "Passwort muss ausgefüllt werden"
      end

    end

    describe "when he signs up without password confirmation" do

      before(:each) do
        fill_in('field_firstname', :with => 'Testy')
        fill_in('field_lastname', :with => 'McUserton')
        fill_in('field_email', :with => 'invalidemail')
        fill_in('field_password', :with => 'please')
        fill_in('field_password_confirmation', :with => '')
        click_button('button_signup')
      end

      it "than he should see 'Passwort errors.messages.confirmation'" do
        page.should have_content "Passwort stimmt nicht mit der Bestätigung überein"
      end
    end
  end
end