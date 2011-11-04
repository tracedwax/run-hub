And /^I am not yet registered$/ do
  User.username_exists?("acceptance-test-user").should == false
end

When /^I register to become a member$/ do
  fill_in("user_email", :with => "acceptance-test-user@testing.com")
  fill_in("user_password", :with => "long_password")
  fill_in("user_password_confirmation", :with => "long_password")

  click_button("Sign up")
end

And /^I should see a message related to my login success$/ do
  page.should have_content("Listing all workouts")
end

Given /^my desired email is already taken$/ do
  User.create!(:email => "acceptance-test-user@testing.com", :password => "long_password")
end

Then /^I should see a message informing me of my registration failure$/ do
  page.should have_content("Email has already been taken")
end
