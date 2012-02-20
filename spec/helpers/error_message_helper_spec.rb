require 'spec_helper'

describe ErrorMessageHelper do

  describe do

    it "should build error message with parameters" do
      html = create_error_message("Sentence", %w{"message_1", "message_2"})
      html.should =~ /class='alert block-message error fade in'/
      html.should =~ /Sentence/
      html.should =~ /message_1/
      html.should =~ /message_2/
    end

  end
end