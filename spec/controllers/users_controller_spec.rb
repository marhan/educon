require 'spec_helper'

describe UsersController do

  describe "with user signed IN" do

    signin_user

    describe "request get 'home'" do

      before { get :home }

      it "should be successful" do
        response.should be_success
      end

      it "should render view 'home'" do
        response.should render_template(:home)
      end

    end

  end

  describe "with user signed OUT" do

    describe "request get 'home'" do

      before { get :home }

      it "should NOT be successful" do
        response.should_not be_success
      end

    end

  end

end
