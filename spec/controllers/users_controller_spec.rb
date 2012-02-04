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
        @controller.current_user.email.should == expected_user.email
      end

    end
  end
end
