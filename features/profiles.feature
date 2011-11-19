Feature: View a user's profile
  In order to see if I am interested in another runner
  A runner
  Should view the other runner's profile

  Scenario: Viewing my own profile while I am logged out
    Given I am an existing user
    And I am on the home page
    And I am not logged in
    When I go to my profile page
    Then I should see my username

  Scenario: Viewing my own workouts while I am logged out
    Given I am an existing user
    And I recorded a workout on 11/6/2011
    And I am on the home page
    And I am not logged in
    When I go to my public workouts on 11/6/2011
    Then I should see a workout for 11/6/2011 listed
    And I should not see "Add Workout"
