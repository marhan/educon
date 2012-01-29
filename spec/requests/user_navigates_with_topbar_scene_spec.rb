# encoding: utf-8
require 'requests/spec_helper'

describe "Given User" do

  describe "is signed in," do

    before(:each) do
      @user = FactoryGirl.create(:user)
      sign_in_as @user.email, @user.password
    end

    describe "when he clicks the link 'Home'," do

      before(:each) do
        find("#topbar").find_link("Home").click
      end

      it "than he goes to the home page" do
        find("#topbar").find("a.brand").should have_content("Educon")
        find("#topbar").find_link("Home")
        find("#topbar").find_link("Wiki")
        find("#topbar").find_link("Ausloggen")
      end

    end

  end

  describe "is not signed in," do

    before(:each) do
      visit '/'
      find("#topbar").should_not have_content("Eingeloggt als")
    end

    describe "when he clicks the link 'Home'," do

      before(:each) do
        find("#topbar").find_link("Home").click
      end

      it "than he goes to the home page" do
        find("#topbar").find("a.brand").should have_content("Educon")
        find("#topbar").find_link("Home")
        find("#topbar").find_link("Wiki")
        find("#topbar").find_link("Passwort vergessen")
      end
    end
  end
end