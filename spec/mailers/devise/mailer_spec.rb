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
    @email.should have_body_text(/Hallo #{@user.email}/)
  end

  it "should contain the link to the new password page" do
    @email.should have_body_text(/http:\/\/.*\/users\/password\/edit\?reset_password_token=123token/)
  end

  it "should contain the id 'link_reset_password'" do
    @email.should have_body_text(/id="link_reset_password"/)
  end

  it "should have the correct subject" do
    @email.should have_subject(/Anleitung um das Passwort neu zu setzen/)
  end

end