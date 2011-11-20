Given /^I am an existing user$/ do
  @user = User.create!(:username => "acceptance-test-user", :email => "acceptance-test-user@testing.com", :password => "long_password")
end

When /^I log in to Runhub$/ do
  fill_in("user_email", :with => "acceptance-test-user@testing.com")
  fill_in("user_password", :with => "long_password")

  click_button("Sign in")
end

When /^I log in to RunHub with incorrect credentials$/ do
  step "I log in to Runhub"
end

Then /^I see a login error message$/ do
  page.should have_content("Invalid email or password")
end

Given /^I am not logged in$/ do
  if page.has_content? "Sign out"
    click_link "Sign out"
  end
end

Then /^I should see my email address$/ do
  assert (page.has_content? @user.email), "User's email address not shown after logging in"
end

Then /^I should see my workouts for this week$/ do
  formatted_date = TrainingPeriod.new(@user.id, DateTime.now.in_time_zone).formatted_tip_of_week
  date_header = "Week of #{formatted_date}"
  assert (page.has_content? date_header), "Logging in did not show workouts for this week"
end

