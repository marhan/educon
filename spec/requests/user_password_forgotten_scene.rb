# encoding: utf-8
require 'requests/spec_helper'
require 'requests/support/request_macros'

#TODO: reset password with link in email
describe "Given User is not singed in," do

  before(:all) do
    clear_email_cache
    @user = FactoryGirl.create(:user)
  end

  describe "when he goes to the password forgotten page" do

    before(:all) do
      visit '/'
      find("#topbar").find_link("Passwort vergessen").click
      find('#page_title').should have_content('Passwort vergessen')
    end

    describe "and asks for a password reset" do

      before(:all) do
        within_fieldset('fieldset_password_forgotten') do
          fill_in('field_email', :with => @user.email)
        end
        click_button 'Email mit Anweisungen senden'
      end

      it "than the receives an email with instrauctions" do
        @email = get_send_emails.first
        @email.should_not be_nil

        @email.should deliver_to(@user.email)
        @email.should have_subject("Anleitung um das Passwort neu zu setzen")
        @email.should have_body_text(/http:\/\/.*\/users\/password\/edit\?reset_password_token=/)
      end
    end
  end
end