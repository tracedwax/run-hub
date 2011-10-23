Feature: Log in to RunHub
  In order to begin using RunHub
  A runner
  Should log in with their credentials

  Scenario: Existing user successfully logs in
    Given I am on the sign in page
    And I am an existing user
    When I log in to Runhub
    Then I should be on my workouts page
