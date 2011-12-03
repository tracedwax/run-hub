Given /^I have no workouts recorded$/ do
  # Clean database, no workouts will be recorded to start.
end

Given /^I recorded a workout on (\d+)\/(\d+)\/(\d+)$/ do |month, day, year|
  Workout.create! :when => DateTime.new(year.to_i, month.to_i, day.to_i),
                  :category => "Easy",
                  :duration => Duration.new(:minutes => 45),
                  :distance => 5.0,
                  :pace => Duration.new(:minutes => 9),
                  :route => "Mendon Ponds Park",
                  :notes => "I felt awesome!",
                  :user_id => @user.id
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

Then /^I should see the name of each day of the week$/ do
  assert (page.has_content? "Sun"), "Workout week did not show Sunday"
  assert (page.has_content? "Mon"), "Workout week did not show Monday"
  assert (page.has_content? "Tue"), "Workout week did not show Tuesday"
  assert (page.has_content? "Wed"), "Workout week did not show Wednesday"
  assert (page.has_content? "Thu"), "Workout week did not show Thursday"
  assert (page.has_content? "Fri"), "Workout week did not show Friday"
  assert (page.has_content? "Sat"), "Workout week did not show Saturday"
end

Then /^I should see a workout for 11\/6\/2011 listed$/ do
  within "#1" do
    assert (page.has_content? "Easy"), "Workout type did not show."
    assert (page.has_content? "45:00"), "Workout duration did not show."
    assert (page.has_content? "5.0"), "Workout distance did not show."
    assert (page.has_content? "9:00 min/mile"), "Workout pace did not show."
    assert (page.has_content? "Mendon Ponds Park"), "Workout route did not show."
    assert (page.has_content? "I felt awesome!"), "Workout notes did not show."
  end
end

Then /^I should see a workout for 11\/1\/2011 listed$/ do
  within "#3" do
    assert (page.has_content? "Easy"), "Workout type did not show."
    assert (page.has_content? "45:00"), "Workout duration did not show."
    assert (page.has_content? "5.0"), "Workout distance did not show."
    assert (page.has_content? "9:00 min/mile"), "Workout pace did not show."
    assert (page.has_content? "Mendon Ponds Park"), "Workout route did not show."
    assert (page.has_content? "I felt awesome!"), "Workout notes did not show."
  end
end

Then /^I should see the hash of the workout for 11\/6\/2011$/ do
  within "#1" do
    assert (page.has_content? "356a192b7913b04c54574d18c28d46e6395428ab"), "Workout hash did not show."
  end
end

When /^I create a workout for 11\/6\/2011$/ do
  select("2011", :from => "workout_when_1i")
  select("6", :from => "workout_when_3i")
  select("November", :from => "workout_when_2i")
  
  fill_in("workout_category", :with => "Easy")
  fill_in("duration_minutes", :with => "45")
  fill_in("workout_distance", :with => 5.0)
  fill_in("pace_minutes", :with => "9")
  fill_in("workout_route", :with => "Mendon Ponds Park")
  fill_in("workout_notes", :with => "I felt awesome!")

  click_on("Create Workout")
end

When /^I create a workout for 11\/1\/2011$/ do
  fill_in("workout_category", :with => "Easy")
  fill_in("duration_minutes", :with => "45")
  fill_in("workout_distance", :with => 5.0)
  fill_in("pace_minutes", :with => "9")
  fill_in("workout_route", :with => "Mendon Ponds Park")
  fill_in("workout_notes", :with => "I felt awesome!")

  click_on("Create Workout")
end

Then /^I should be my workouts on the week of (\d+)\/(\d+)\/(\d+)$/ do |year, month, day|
  # current_path.should == training_period_path(year, month, day)
  current_path.should == ("/workouts/" + year + "-" + month + "-" + day)
end

Then /^I should see "([^"]*)" for each day in the training period$/ do |text|
  (1..7).each do |day_number|
    within "##{day_number}" do
      assert (page.has_content? text), "Training period did not show #{text}"
    end
  end
end

When /^I click Add Workout button for 11\/6\/2011$/ do
  within "#1" do
    click_link("Add Workout")
  end
end

When /^I click Add Workout button for 11\/1\/2011$/ do
  within "#3" do
    click_link("Add Workout")
  end
end

When /^I click the previous period button$/ do
  click_link("previous-period")
end

When /^I click the next period button$/ do
  click_link("next-period")
end

Given /^I recorded a workout on 11\/6\/2011 without a distance$/ do
    Workout.create! :when => DateTime.new(2011, 11, 6),
                  :category => "Easy",
                  :duration => Duration.new(:minutes => 45),
                  :pace => Duration.new(:minutes => 9),
                  :route => "Mendon Ponds Park",
                  :notes => "I felt awesome!",
                  :user_id => @user.id
end

Given /^I recorded a workout on 11\/6\/2011 without a pace$/ do
    Workout.create! :when => DateTime.new(2011, 11, 6),
                  :category => "Easy",
                  :duration => Duration.new(:minutes => 45),
                  :distance => 5.0,
                  :route => "Mendon Ponds Park",
                  :notes => "I felt awesome!",
                  :user_id => @user.id
end

Then /^I should not see the mileage field for 11\/6\/2011$/ do
  within "#1" do
    assert (not page.has_content? "miles"), "Training period showed a mileage field when workout did not record mileage."
  end
end

Then /^I should not see the pace field for 11\/6\/2011$/ do
  within "#1" do
    assert (not page.has_content? "min/mile"), "Training period showed a pace field when workout did not record pace."
  end
end

Then /^My total mileage this week should be (\d+)$/ do |mileage|
  within "#mpw" do
    assert (page.has_content? mileage), "Training period did not show MPW."
  end
end

