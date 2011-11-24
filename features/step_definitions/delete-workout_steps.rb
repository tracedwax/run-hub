When /^I delete the workout on 11\/6\/2011$/ do
  within "#1" do
    click_link "[x]"
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

