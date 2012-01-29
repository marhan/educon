module Educon
  module EmailMatchers
    RSpec::Matchers.define :be_a_password_forgotten_email_for do |user|
      match do |email|
        email.should_not be_nil
        email.should deliver_to(user.email)
        email.should have_subject("Anleitung um das Passwort neu zu setzen")
        email.should have_body_text(/http:\/\/.*\/users\/password\/edit\?reset_password_token=/)
      end

      failure_message_for_should do |email|
        "expected that #{email} would be a password forgotten email for #{user}"
      end

      failure_message_for_should_not do |email|
        "expected that #{email} would not be a password forgotten email for #{user}"
      end

      description do
        "be a password forgotten email for #{user}"
      end
    end
  end
end