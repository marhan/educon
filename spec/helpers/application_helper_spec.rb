require 'spec_helper'

describe ApplicationHelper do

  before(:each) do
  end

  describe "Flash message types" do

    it "should mapped correctly to twitter bootstrap types" do
      alert_class_name_for("alert").should == "warning"
      alert_class_name_for("notice").should == "info"
      alert_class_name_for("error").should == "error"
      alert_class_name_for("success").should == "success"
    end


  end

end