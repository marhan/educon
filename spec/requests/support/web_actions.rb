# encoding: utf-8
module WebActions

  def sign_in_user(user)
    fill_in("user_email", :with => user.email)
    fill_in("user_password", :with => user.password)
    click_button("Sign in")
  end

  def click_edit_account
    click_link("Edit Account")
  end

end