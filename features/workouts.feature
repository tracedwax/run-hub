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

  Scenario: User with one workout recorded today
    Given I am an existing user
    And I am on the home page
    And I log in to Runhub
    Then I should see "You logged 1 workout this week."
