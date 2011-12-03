# encoding: utf-8
module ContentValidator

  def user_should_be_signed_in
    page.should have_no_content("Sign up")
    page.should have_no_content("Sign in")
    page.should have_content("Sign out")
  end

end