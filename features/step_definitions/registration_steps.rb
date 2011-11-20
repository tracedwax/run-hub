And /^I am not yet registered$/ do
  User.email_exists?("acceptance-test-user@testing.net").should == false
end

When /^I register to become a member$/ do
  fill_in("user_email", :with => "acceptance-test-user@testing.com")
  fill_in("user_password", :with => "long_password")
  fill_in("user_password_confirmation", :with => "long_password")
  click_button("Sign up")

  @user = User.find_by_email("acceptance-test-user@testing.com")
end

Given /^my desired email is already taken$/ do
  User.create!(:email => "acceptance-test-user@testing.com", :password => "long_password")
end

Then /^I should see a message informing me of my registration failure$/ do
  page.should have_content("Email has already been taken")
end

