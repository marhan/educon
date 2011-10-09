require 'spec_helper'

describe ApplicationHelper do

  describe "flash message helper methods" do

    it "should map flash type to twitter bootstrap class correctly" do
      map_alert_class_name_for(:alert).should == "warning"
      map_alert_class_name_for(:notice).should == "info"
      map_alert_class_name_for(:error).should == "error"
      map_alert_class_name_for(:success).should == "success"
    end

    it "should build flash with parameters" do
      html = create_flash_message("flash_message_class", "flash_type", "flash_message")
      html.should =~ /class='alert-message flash_message_class fade in'/
      html.should =~ /Flash_type/ # capitalized
      html.should =~ /flash_message/
    end

  end

  describe "error message helper methods" do

    it "should build flash with parameters" do
      html = create_error_message("Sentence", %w{"message_1", "message_2"})
      html.should =~ /class='alert-message block-message error fade in'/
      html.should =~ /Sentence/
      html.should =~ /message_1/
      html.should =~ /message_2/
    end

  end

  describe "menu items" do

    it "should build with class='active'" do
      html = create_top_bar_menu_item("active", "Label","http://www.path.de")
      html.should =~ /class='active'/
      html.should =~ /href='http:\/\/www.path.de'/
    end

    it "should build without class='active'" do
      html = create_top_bar_menu_item(nil, "Label","http://www.path.de")
      html.should_not =~ /class='active'/
      html.should =~ /href='http:\/\/www.path.de'/
    end

  end

 

end