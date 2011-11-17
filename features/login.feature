Feature: Log in to RunHub
  In order to begin using RunHub
  A runner
  Should log in with their credentials

  Scenario: Existing user successfully logs in
    Given I am on the home page
    And I am an existing user
    When I log in to Runhub
    Then I should be on my workouts page
    And I should see my workouts for this week

  Scenario: User tries to log in with incorrect credentials
    Given I am on the home page
    When I log in to RunHub with incorrect credentials
    Then I see a login error message

  Scenario: User tries to access workouts page without logging in
    Given I am not logged in
    When I go to the workouts page
    Then I should be on the sign in page

  Scenario: User logs in and sees his email listed
    Given I am an existing user
    And I am on the home page
    When I log in to Runhub
    Then I should see my email address
