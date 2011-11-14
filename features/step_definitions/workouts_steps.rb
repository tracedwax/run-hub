Given /^I have no workouts recorded$/ do
  # Clean database, no workouts will be recorded to start.
end

Given /^I recorded a workout on (\d+)\/(\d+)\/(\d+)$/ do |month, day, year|
  Workout.create! :when => Time.new(year, month, day),
                  :category => "Easy",
                  :duration => "45:00",
                  :distance => 5.0,
                  :pace => "9:00 min/mile",
                  :route => "Mendon Ponds Park",
                  :notes => "I felt awesome!",
                  :user_id => 1
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

Then /^I should see a workout for 11\/6\/2011 listed$/ do
  within "#workout-week .day#1" do
    assert (page.has_content? "Easy"), "Workout type did not show."
    assert (page.has_content? "45:00"), "Workout duration did not show."
    assert (page.has_content? "5.0"), "Workout distance did not show."
    assert (page.has_content? "9:00 min/mile"), "Workout pace did not show."
    assert (page.has_content? "Mendon Ponds Park"), "Workout route did not show."
    assert (page.has_content? "I felt awesome!"), "Workout notes did not show."
  end
end

