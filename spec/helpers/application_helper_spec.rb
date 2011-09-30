require 'spec_helper'

describe ApplicationHelper do

  before :each do
    helper.extend Haml
    helper.extend Haml::Helpers
    helper.send :init_haml_helpers
  end

  describe "helper class" do

    it "should map flash type to twitter bootstrap class correctly" do
      map_alert_class_name_for("alert").should == "warning"
      map_alert_class_name_for("notice").should == "info"
      map_alert_class_name_for("error").should == "error"
      map_alert_class_name_for("success").should == "success"
    end

    it "should build flash element classes string correctly" do
      alert_type = "success"
      build_flash_element_classes_with(alert_type).should == "alert-message #{alert_type} fade in"
    end

    it "should build flash with parameters" do
      html = create_flash_message("flash_message_class", "flash_type", "flash_message")
      html.should =~ /<div class='flash_message_class' data-alert='alert'>.*/
      html.should =~ /.*Flash_type.*/ # capitalize
      html.should =~ /.*flash_message.*/
    end

  end

end