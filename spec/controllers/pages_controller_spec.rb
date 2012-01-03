require 'spec_helper'

describe PagesController do

  describe "Given User is signed in," do

    signin_user

    describe "when he visits 'welcome' via get," do

      before { get :welcome }

      it "than response should be successful" do
        response.should be_success
      end

      it "than 'welcome' view should rendered" do
        response.should render_template(:welcome)
      end

    end

    describe "when he visits 'home' via get," do

      before { get :home }

      it "than response should be successful" do
        response.should be_success
      end

      it "than 'home' should view should rendered" do
        response.should render_template(:home)
      end
    end
  end
  
  describe "Given User is not signed in," do

    describe "when he visits 'welcome' via get," do

      before { get :welcome }

      it "than response should be successful" do
        response.should be_success
      end

      it "than view 'welcome' should be rendered" do
        response.should render_template(:welcome)
      end

    end

    describe "when he visits 'home' via get," do

      before { get :home }

      it "than response should  NOT be successful" do
        response.should_not be_success
      end
    end
  end
end