require 'spec_helper'

describe PagesController do

  describe "GET 'impressum'" do
    it "should be successful" do
      get 'impressum'
      response.should be_success
    end
  end

    describe "GET 'about'" do
    it "should be successful" do
      get 'about'
      response.should be_success
    end
  end

end
