# encoding: utf-8
require 'requests/spec_helper'

describe "Given User is not singed in," do

  before(:each) do
    # I don't wont www.example.com as my host name
    host! 'localhost:8989'
    #
    reset_mailer
    @user = FactoryGirl.create(:user)
  end

  describe "when he ask for password reset," do

    before(:each) do
      visit '/'
      user_asks_for_password_forgotten_email @user.email
      current_path.should == new_user_session_path
      find("#flash_message").should have_content("Hinweis Sie erhalten in wenigen Minuten eine E-Mail mit der Anleitung, wie Sie ihr Passwort zurücksetzten können.")
    end

    describe "than he gets an email with the hyperlink to password reset" do

      before(:each) do
        email = last_email_sent
        email.should be_a_password_forgotten_email_for @user
        @hyperlink = extract_password_reset_hyperlink email
        @hyperlink.should be_equal_ignore_params(edit_user_password_url)
      end

      it "and he is able to reset his password with given hyperlink" do
        visit @hyperlink
        user_fills_password_reset_with 'new_password'
        find("#flash_message").should have_content("Hinweis Ihr Passwort wurde geändert. Sie sind angemeldet.")
        
        click_link('Ausloggen')
        sign_in_as(@user.email, 'new_password')
        current_path.should == root_path
        find("#flash_message").should have_content("Hinweis Erfolgreich angemeldet")
      end
    end
  end
end