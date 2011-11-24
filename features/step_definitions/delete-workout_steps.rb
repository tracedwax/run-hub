When /^I delete the workout on 11\/6\/2011$/ do
  within "#1" do
    click_link "x"
  end
end

Then /^I should not see a workout for 11\/6\/2011 listed$/ do
  within "#1" do
    assert (not page.has_content? "Easy"), "Workout type did not show."
    assert (not page.has_content? "45:00"), "Workout duration did not show."
    assert (not page.has_content? "5.0"), "Workout distance did not show."
    assert (not page.has_content? "9:00 min/mile"), "Workout pace did not show."
    assert (not page.has_content? "Mendon Ponds Park"), "Workout route did not show."
    assert (not page.has_content? "I felt awesome!"), "Workout notes did not show."
  end
end

Then /^I should not see any delete workout links$/ do
  assert (not page.has_css? "div.delete-workout"), "Link for deleting a workout showed in a public profile."
end

Given /^A workout has been recorded by another user$/ do
  @other_workout = Workout.create! :user_id => 2
end

Then /^the workout should still exist$/ do
  pending # express the regexp above with the code you wish you had
end
