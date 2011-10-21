And /^I am not yet registered$/ do
  User.username_exists?("acceptance-test-user").should == false
end

When /^I register to become a member$/ do
  pending 
end

Then /^I am taken to my workouts page$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should see a message related to my registration success$/ do
  pending # express the regexp above with the code you wish you had
end

