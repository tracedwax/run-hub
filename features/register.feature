Feature: Register for RunHub
  In order to begin using RunHub
  A runner
  Should register to become a member

  Scenario: Going from the home page to the sign up page
    Given I am on the home page
    When I click the sign up button
    Then I should be on the sign up page
  
  Scenario: New user registration
    Given I am on the sign up page
    And I am not yet registered
    When I register to become a member
    Then I should be on my workouts page
    And I should see my email address

  Scenario: New user trying to register with a taken email
    Given I am on the sign up page
    And my desired email is already taken
    When I register to become a member
    Then I should see a message informing me of my registration failure

  Scenario: New user trying to register with a taken username
    Given I am on the sign up page
    And my desired username is already taken
    When I register to become a member
    Then I should see a message informing me that my username is already in use
