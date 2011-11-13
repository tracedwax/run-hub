Given /^I have no workouts recorded$/ do
  # Clean database, no workouts will be recorded to start.
end

Given /^I recorded a workout on (\d+)\/(\d+)\/(\d+)$/ do |month, day, year|
  Workout.create! :when => Time.new(year, month, day)
end

Then /^I should see an empty training week$/ do
  within "#workout-week" do
    (1..7).each do |day_number|
      assert (page.has_css? ".day##{day_number}"), "Workout week did not show all 7 days."
    end
  end
end

Then /^I should see a workout for (\d+)\/(\d+)\/(\d+) listed$/ do |month, day, year|
  within "#workout-week" do
    assert (page.has_css? ".day#1"), "Workout week did not have Day-1 element."
  end
end

