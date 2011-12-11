# encoding: utf-8
def sign_in_as(email, password)
  visit '/users/sign_in'
  fill_in("user_email", :with => email)
  fill_in("user_password", :with => password)
  click_button("Sign in")
end
