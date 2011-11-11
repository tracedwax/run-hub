Given /^I have no workouts recorded$/ do
  # Clean database, no workouts will be recorded to start.
end

Given /^I recorded a workout on (\d+)\/(\d+)\/(\d+)$/ do |month, day, year|
  Workout.create! :when => Time.new(year, month, day)
end

Then /^I should see a workout for (\d+)\/(\d+)\/(\d+) listed$/ do |month, day, year|
  within "#workout-week" do
    page.has_content? ".day-1"
  end
end

