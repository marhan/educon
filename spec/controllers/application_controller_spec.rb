require 'spec_helper'

describe ApplicationController do

  describe "Given User is signed in," do

    signin_user

    it "than method 'layout_by_signed_in' returns 'application'" do
      controller.layout_by_signed_in.should == "application"
    end

  end

  describe "Given User is signed out," do

    it "than method 'layout_by_signed_in' returns 'signed_out'" do
      controller.layout_by_signed_in.should == "signed_out"
    end

  end

end