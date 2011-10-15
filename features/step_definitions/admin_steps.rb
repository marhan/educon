Given /^No admin exists with an email of "(.*)"$/ do |email|
  AdminUser.find(:first, :conditions => {:email => email}).should be_nil
end

Given /^I am not signed in into administration interface$/ do
  And %{I should not see "Logout"}
  And %{I should not see "Admin Users"}
  And %{I should not see "Users"}
  And %{I should not see "Dashboard"}
end

Then /^As admin i should be signed out$/ do
  And %{I should see "Login"}
  And %{I should not see "Logout"}
end

Then /^I should be signed in as admin "(.*)"$/ do |login|
  And %{I should not see "Login"}
  And %{I should see "Logout"}
  And %{I should see "#{login}"}
end

Given /^I am an admin with an email "([^"]*)" and password "([^"]*)"$/ do | email, password|
  AdminUser.new(:email                 => email,
                :password              => password,
                :password_confirmation => password).save!
end

When /^I sign in as admin with "(.*)\/(.*)"$/ do |email, password|
  And %{I fill in "admin_user_email" with "#{email}"}
  And %{I fill in "admin_user_password" with "#{password}"}
  And %{I press "Login"}
end