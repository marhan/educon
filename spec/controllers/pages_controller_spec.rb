require 'spec_helper'

describe PagesController do

  describe "with user signed IN" do

    signin_user

    describe "request get 'welcome'" do

      before{ get :welcome }

      it "should be successful" do
        response.should be_success
      end

      it "should render view 'welcome'" do
        response.should render_template(:welcome)
      end

    end
  end

  describe "with user signed OUT" do

    describe "request get 'welcome'" do

      before { get :welcome }

      it "should be successful" do
        response.should be_success
      end

      it "should render view 'welcome'" do
        response.should render_template(:welcome)
      end

    end
  end
end