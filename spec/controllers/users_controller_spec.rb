require 'spec_helper'

describe UsersController do

  describe "GET 'home' with user signed in" do

    signin_user

    it "should be successful" do
      get 'home'
      response.should be_success
    end

  end

end
