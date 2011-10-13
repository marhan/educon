require 'spec_helper'

describe ApplicationHelper do

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