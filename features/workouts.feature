Feature: 
  In order to assess training progress
  A runner
  Should view, add, edit, and delete workouts in RunHub

  Scenario: Existing user with no workouts recorded
    Given I am an existing user
    And I am on the home page
    And I have no workouts recorded
    When I log in to Runhub
    Then I should see "You haven't logged any workouts yet."
  
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
