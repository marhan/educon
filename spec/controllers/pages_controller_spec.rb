require 'spec_helper'

describe PagesController do

  describe "With user signed in" do
    signin_user

    describe "GET 'welcome'" do

      it "should should be successful" do
        get :welcome
        response.should be_success
      end
    end
  end

  describe "Without user signed in" do

    describe "GET 'welcome'" do

      it "should should be successful" do
        get :welcome
        response.should be_success
      end

    end
  end
end