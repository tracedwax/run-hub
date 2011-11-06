Feature: 
  In order to assess training progress
  A runner
  Should view, add, edit, and delete workouts in RunHub

  Scenario: Existing user with no workouts recorded
    Given I am an existing user
    And I am on the home page
    And I have no workouts recorded
    When I log in to Runhub
    And I am on my workouts page
    Then I should see "You haven't logged any workouts yet."
