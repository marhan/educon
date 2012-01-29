# encoding: utf-8
def sign_in_as(email, password)
  visit '/'
  fill_in("field_email", :with => email)
  fill_in("field_password", :with => password)
  click_button("button_sign_in")
  find("#topbar").should have_content("Eingeloggt als #{email}")
end

def extract_password_reset_hyperlink(email)
  regex = /<a[\s]+[^>]*?href[\s]?=[\s\""\']+(.*?)[\""\']+.*?link_reset_password.*?>([^<]+|.*?)?<\/a>/
  email_body_text = email.default_part_body.to_s
  matches = email_body_text.scan(regex)
  matches.first.first
end

def extract_password_token(url)
  url.scan(/reset_password_token=(.*)/).first
end
