Given /^I am an existing user$/ do
  User.create!(:email => "acceptance-test-user@testing.com", :password => "long_password")
end

When /^I log in to Runhub$/ do
  fill_in("user_email", :with => "acceptance-test-user@testing.com")
  fill_in("user_password", :with => "long_password")

  click_button("Sign in")
end

