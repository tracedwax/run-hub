Given /^I am an existing user$/ do
  User.create!(:email => "acceptance-test-user@testing.com", :password => "long_password")
end

When /^I log in to Runhub$/ do
  fill_in("user_email", :with => "acceptance-test-user@testing.com")
  fill_in("user_password", :with => "long_password")

  click_button("Sign in")
end

When /^I log in to RunHub with incorrect credentials$/ do
  When "I log in to Runhub"
end

Then /^I see a login error message$/ do
  page.should have_content("Invalid email or password")
end

Given /^I am not logged in$/ do
  # Database is clean, no one is logged in.
end

