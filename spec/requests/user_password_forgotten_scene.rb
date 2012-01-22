# encoding: utf-8
require 'requests/spec_helper'
require 'requests/support/request_macros'

describe "Given User is not singed in," do

  before(:each) do
    clear_email_cache
    @user = FactoryGirl.create(:user)
  end

  describe "when he goes to the password forgotten page" do

    before(:each) do
      visit '/'
      find("#topbar").find_link("Passwort vergessen").click
      find('#page_title').should have_content('Passwort vergessen')
    end

    describe "and asks for a password reset" do

      before(:each) do
        within_fieldset('fieldset_password_forgotten') do
          fill_in('field_email', :with => @user.email)
        end
        click_button 'Email mit Anweisungen senden'
      end

      #it "than he will see the flash message 'Hinweis Sie erhalten ...'" do
      #  current_path.should == new_user_session_path
      #  find("#flash_message").should have_content("Hinweis Sie erhalten in wenigen Minuten eine E-Mail mit der Anleitung, wie Sie ihr Passwort zurücksetzten können.")
      #end

      it "than he receives an email with instructions and reset his password" do
        email = get_send_emails.first
        email.should_not be_nil

        email.should deliver_to(@user.email)
        email.should have_subject("Anleitung um das Passwort neu zu setzen")
        email.should have_body_text(/http:\/\/.*\/users\/password\/edit\?reset_password_token=/)

        visit extract_password_reset_hyperlink email
        current_path.should == edit_user_password_path

        within_fieldset('fieldset_password_reset') do
          fill_in('field_password', :with => 'new_password')
          fill_in('field_password_confirmation', :with => 'new_password')
        end
        click_button('Speichern')

        find("#flash_message").should have_content("Hinweis Ihr Passwort wurde geändert. Sie sind angemeldet.")

        click_link('Ausloggen')
        sign_in_as(@user.email, 'new_password')
        current_path.should == root_path
        find("#flash_message").should have_content("Hinweis Erfolgreich angemeldet")
      end
    end
  end
end