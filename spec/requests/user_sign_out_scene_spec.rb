# encoding: utf-8
require 'requests/spec_helper'

describe "Given user is signed in," do

  before(:each) do
    @user = FactoryGirl.create(:user)
    sign_in_as @user.email, @user.password
  end

  describe "when he signing out," do

    before(:each) do
      click_link("Abmelden")
    end

    it "then he should see the flash message 'Hinweis Erfolgreich abgemeldet.'" do
      find("#flash_message").should have_content("Hinweis Erfolgreich abgemeldet.")
    end

    it "than he should be signed out" do
      find("#topbar").should have_content("Registrieren")
      find("#topbar").find("form").should have_button "Anmelden"
      find("#topbar").should_not have_content("Angemelet als")
    end
  end

end