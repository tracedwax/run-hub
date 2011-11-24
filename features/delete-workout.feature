Feature:
  In order to get rid of workouts I don't want anymore
  A runner
  Should delete the workout in RunHub

  Scenario: User with one workout deletes the workout
    Given I am an existing user
    And I am on the home page
    And I recorded a workout on 11/6/2011
    And I log in to Runhub
    And I go to my workouts on the week of 11/6/2011
    When I delete the workout on 11/6/2011
    Then I should not see a workout for 11/6/2011 listed
  
  Scenario: Logged out user shouldn't be able to delete workouts on a public profile
    Given I am an existing user
    And I recorded a workout on 11/6/2011
    And I am on the home page
    And I am not logged in
    When I go to my public workouts on 11/6/2011
    Then I should not see any delete workout links

  Scenario: User should not be able to delete other users' workouts
    Given I am an existing user
    And A workout has been recorded by another user
    And I am on the home page
    And I log in to Runhub
    When I go to delete the workout of the other user
    Then the workout should still exist
