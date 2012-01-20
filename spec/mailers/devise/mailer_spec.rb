# encoding: utf-8
require 'spec_helper'

describe "Mailer" do
  
  before(:each) do
    @user  = FactoryGirl.build(:devise_resource)
    @email = Devise::Mailer.reset_password_instructions @user
  end

  it "should be be delivered to the user's' email address" do
    @email.should deliver_to("user@educon.com")
  end

  it "should contain the user's message in the mail body" do
    @email.should have_body_text(/Hallo #{@user.firstname} #{@user.lastname}/)
  end

  it "should contain the link to the new password page" do
    url = "http://localhost:3000/users/password/edit?reset_password_token=123_password_token"
    @email.should have_body_text(/http:\/\/.*\/users\/password\/edit\?reset_password_token=123token/)
  end

  it "should have the correct subject" do
    @email.should have_subject(/Anleitung um das Passwort neu zu setzen/)
  end

end