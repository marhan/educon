Given /^no user exists with an email of "(.*)"$/ do |email|
  User.find(:first, :conditions => {:email => email}).should be_nil
end

Given /^I am a user named "([^"]*)" "([^"]*)" with an email "([^"]*)" and password "([^"]*)"$/ do | firstname, lastname, email, password|
    User.new(:firstname             => firstname,
             :lastname              => lastname,
             :email                 => email,
             :password              => password,
             :password_confirmation => password).save!
end

Then /^I should be already signed in$/ do
  And %{I should see "Sign out"}
end

Given /^I am signed up as "(.*)\/(.*)"$/ do |email, password|
  Given %{I am not logged in}
  When %{I go to the sign up page}
  And %{I fill in "Email" with "#{email}"}
  And %{I fill in "Password" with "#{password}"}
  And %{I fill in "Password confirmation" with "#{password}"}
  And %{I press "Sign up"}
  Then %{I should see "You have signed up successfully. If enabled, a confirmation was sent to your e-mail."}
  And %{I am logout}
end

Then /^I sign out$/ do
  visit('/users/sign_out')
end

Given /^I am signed out/ do
  Given %{I sign out}
end

Given /^I am not signed in$/ do
  Given %{I sign out}
end

When /^I sign in as "(.*)\/(.*)"$/ do |email, password|
  Given %{I am not signed in}
  When %{I go to the sign in page}
  And %{I fill in "user_email" with "#{email}"}
  And %{I fill in "user_password" with "#{password}"}
  And %{I press "Sign in"}
end

Then /^I should be signed in$/ do
  Then %{I should see "Signed in successfully."}
end

When /^I return next time$/ do
  And %{I go to the home page}
end

Then /^I should be signed out$/ do
  And %{I should see "Sign up"}
  And %{I should see "Sign in"}
  And %{I should not see "Sign out"}
end
