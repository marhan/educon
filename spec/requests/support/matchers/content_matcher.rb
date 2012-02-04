# TODO: Doesn't work
module Educon
  module ContentMatchers
    RSpec::Matchers.define :show_logged_out_content do
      match do |actual|
        actual.find("form").should have_button "Anmelden"
        actual.should have_content("Registrieren")
        actual.should_not have_content("Angemeldet als")
      end

      failure_message_for_should do |actual|
        "#{actual} should show content for logout"
      end

      failure_message_for_should_not do |actual|
        "#{actual} should not show content for logout"
      end

      description do
        "show the content for logout"
      end
    end
  end
end