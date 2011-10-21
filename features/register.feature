Feature: Register for RunHub
  In order to begin using RunHub
  A runner
  Should register to become a member

  Scenario: New user registration
    Given I am on the sign up page
    And I am not yet registered
    When I register to become a member
    Then I should be on my workouts page
    And I should see a message related to my registration success
