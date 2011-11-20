And /^I am not yet registered$/ do
  assert (not User.email_exists?("acceptance-test-user@testing.net"))
end

When /^I register to become a member$/ do
  fill_in("user_username", :with => "acceptance-test-user")
  fill_in("user_email", :with => "acceptance-test-user@testing.net")
  fill_in("user_password", :with => "long_password")
  fill_in("user_password_confirmation", :with => "long_password")
  click_button("Sign up")

  @user = User.find_by_email("acceptance-test-user@testing.net")
end

Given /^my desired email is already taken$/ do
  User.create!(:email => "acceptance-test-user@testing.net", :password => "long_password")
end

Given /^my desired username is already taken$/ do
  User.create!(:username => "acceptance-test-user", :email => "other-email@testing.net", :password => "long_password")
end

Then /^I should see a message informing me of my registration failure$/ do
  page.should have_content("Email has already been taken")
end

Then /^I should see a message informing me that my username is already in use$/ do
  page.should have_content("Username has already been taken")
end
