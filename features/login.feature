Feature: Log in to RunHub
  In order to begin using RunHub
  A runner
  Should log in with their credentials

  Scenario: Existing user successfully logs in
    Given I am on the sign in page
    And I am an existing user
    When I log in to Runhub
    Then I should be on my workouts page

  Scenario: User tries to log in with incorrect credentials
    Given I am on the sign in page
    When I log in to RunHub with incorrect credentials
    Then I see a login error message