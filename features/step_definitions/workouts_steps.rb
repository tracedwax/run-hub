Given /^I have no workouts recorded$/ do
  # Clean database, no workouts will be recorded to start.
end

Given /^I recorded a workout on (\d+)\/(\d+)\/(\d+)$/ do |month, day, year|
  Workout.create! :when => Time.new(year, month, day)
end

Then /^I should see an empty training week$/ do
  within "#workout-week" do
    (1..7).each do |day_number|
      assert (page.has_css? ".day##{day_number}"), "Workout week did not show day #{day_number}."
    end
  end
  
  within "#workout-week" do
    assert (page.has_content? "11/06/2011"), "Workout date did not show for day 1."
    assert (page.has_content? "11/07/2011"), "Workout date did not show for day 2."
    assert (page.has_content? "11/08/2011"), "Workout date did not show for day 3."
    assert (page.has_content? "11/09/2011"), "Workout date did not show for day 4."
    assert (page.has_content? "11/10/2011"), "Workout date did not show for day 5."
    assert (page.has_content? "11/11/2011"), "Workout date did not show for day 6."
    assert (page.has_content? "11/12/2011"), "Workout date did not show for day 7."
  end
end

Then /^I should see a workout for (\d+)\/(\d+)\/(\d+) listed$/ do |month, day, year|
  within "#workout-week" do
    assert (page.has_css? ".day#1"), "Workout week did not have Day-1 element."
  end
end

