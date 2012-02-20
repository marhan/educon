require 'spec_helper'

describe FlashMessageHelper do

  it "should map flash type to twitter bootstrap class correctly" do
    map_alert_class_name_for(:alert).should == "warning"
    map_alert_class_name_for(:notice).should == "info"
    map_alert_class_name_for(:error).should == "error"
    map_alert_class_name_for(:success).should == "success"
  end

  it "should build flash with parameters" do
    html = create_flash_message("warning", "alert", "flash_message")
    html.should =~ /class='alert alert-warning fade in'/
    html.should =~ /Warnung/ # capitalized
    html.should =~ /flash_message/
  end

end
