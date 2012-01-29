# encoding: utf-8
require 'requests/spec_helper'

describe "Given User is not singed in," do

  before(:each) do
    clear_email_cache
    @user = FactoryGirl.create(:user)
  end

  describe "when he goes to the password forgotten page" do

    it "and asks for a password reset" do
      visit '/'

      user_ask_for_password_forgotten_email @user.email

      current_path.should == new_user_session_path
      find("#flash_message").should have_content("Hinweis Sie erhalten in wenigen Minuten eine E-Mail mit der Anleitung, wie Sie ihr Passwort zurücksetzten können.")

      email = last_email_sent
      email.should be_a_password_forgotten_email_for @user

      hyperlink = extract_password_reset_hyperlink email
      visit hyperlink
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