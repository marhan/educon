require 'spec_helper'

describe UsersController do

  describe "with user signed IN" do

    signin_user

    describe "current_user" do

      it "should be found in controller" do
        @controller.current_user.should_not be_nil
      end

      it "should be the expected user" do
        expected_user = FactoryGirl.build(:user)
        @controller.current_user.firstname.should == expected_user.firstname
        @controller.current_user.lastname.should == expected_user.lastname
      end

    end

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
