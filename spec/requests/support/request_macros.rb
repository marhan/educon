# encoding: utf-8
def sign_in(user)
  visit '/users/sign_in'
  fill_in("user_email", :with => user.email)
  fill_in("user_password", :with => user.password)
  click_button("Sign in")
  page.should have_content("Signed in as #{user.email}")
end
