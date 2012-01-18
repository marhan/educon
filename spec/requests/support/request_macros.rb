# encoding: utf-8
def sign_in_as(email, password)
  visit '/'
  fill_in("field_email", :with => email)
  fill_in("field_password", :with => password)
  click_button("button_sign_in")
  find("#topbar").should have_content("Eingeloggt als #{email}")
end
