Feature: 
  In order to assess training progress
  A runner
  Should view, add, edit, and delete workouts in RunHub

  Scenario: User with no workouts views a training period
    Given I am an existing user
    And I am on the home page
    And I have no workouts recorded
    When I log in to Runhub
    And I go to my workouts on the week of 11/6/2011
    Then I should see an empty training week
  
  Scenario: User sees the name of each day on the training log
    Given I am an existing user
    And I am on the home page
    And I have no workouts recorded
    When I log in to Runhub
    And I go to my workouts on the week of 11/6/2011
    Then I should see the name of each day of the week 
 
  Scenario: User views a training period and sees the starting date
    Given I am an existing user
    And I am on the home page
    And I have no workouts recorded
    When I log in to Runhub
    And I go to my workouts on the week of 11/6/2011
    Then I should see "Week of November 06, 2011"

  Scenario: User with one workout recorded November 6, 2011
    Given I am an existing user
    And I recorded a workout on 11/6/2011
    And I am on the home page
    When I log in to Runhub
    And I go to my workouts on the week of 11/6/2011
    Then I should see a workout for 11/6/2011 listed

  Scenario: User sees the hash of the workout on 11/6/2011
    Given I am an existing user
    And I recorded a workout on 11/6/2011
    And I am on the home page
    When I log in to Runhub
    And I go to my workouts on the week of 11/6/2011
    Then I should see the hash of the workout for 11/6/2011

  Scenario: User creates his first workout
    Given I am an existing user
    And I have no workouts recorded
    And I am on the home page
    When I log in to Runhub
    And I go to create a workout
    And I create a workout for 11/6/2011
    Then I should be my workouts on the week of 11/6/2011
    And I should see a workout for 11/6/2011 listed

  Scenario: User creates a workout by clicking a button on the training period page
    Given I am an existing user
    And I have no workouts recorded
    And I am on the home page
    When I log in to Runhub
    Then I should see "Add" for each day in the training period
    And I go to my workouts on the week of 11/6/2011
    When I click Add Workout button for 11/6/2011
    And I create a workout for 11/6/2011
    Then I should see a workout for 11/6/2011 listed

  Scenario: User creates a workout for the previous week using the create workout button
    Given I am an existing user
    And I have no workouts recorded
    And I am on the home page
    And I log in to Runhub
    And I go to my workouts on the week of 11/6/2011
    And I click the previous period button
    And I click Add Workout button for 11/1/2011
    When I create a workout for 11/1/2011
    Then I should see a workout for 11/1/2011 listed

  Scenario: User clicks the Previous Period button and goes back a week
    Given I am an existing user
    And I am on the home page
    When I log in to Runhub
    And I go to my workouts on the week of 11/6/2011
    And I click the previous period button
    Then I should see "Week of October 30, 2011"

  Scenario: User clicks the Next Period button and goes forward a week
    Given I am an existing user
    And I am on the home page
    When I log in to Runhub
    And I go to my workouts on the week of 11/6/2011
    And I click the next period button
    Then I should see "Week of November 13, 2011"
  
  Scenario: User creates a workout with a specified distance
    Given I am an existing user
    And I am on the home page
    And I log in to Runhub
    And I recorded a workout on 11/6/2011 without a distance
    When I go to my workouts on the week of 11/6/2011
    Then I should not see the mileage field for 11/6/2011
    
  Scenario: User creates a workout with a specified pace
    Given I am an existing user
    And I am on the home page
    And I log in to Runhub
    And I recorded a workout on 11/6/2011 without a pace
    When I go to my workouts on the week of 11/6/2011
    Then I should not see the pace field for 11/6/2011
