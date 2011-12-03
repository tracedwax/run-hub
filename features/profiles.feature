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

  Scenario: Viewing my root workouts page while I am logged out
    Given I am an existing user
    And I am on the home page
    And I am not logged in
    When I go to my public workouts
    Then I should see my workouts for this week

  Scenario: Viewing the previous week of my own workouts while I am logged out
    Given I am an existing user
    And I am on the home page
    And I am not logged in
    When I go to my public workouts on 11/6/2011
    And I click the previous period button
    Then I should see "Week of October 30, 2011"
    And I should not see "Add Workout"

  Scenario: Viewing the next week of my own workouts while I am logged out
    Given I am an existing user
    And I am on the home page
    And I am not logged in
    When I go to my public workouts on 11/6/2011
    And I click the next period button
    Then I should see "Week of November 13, 2011"
    And I should not see "Add Workout"

  Scenario: Clicking on my email address in the navigation takes me to my public profile
    Given I am an existing user
    And I am on the home page
    And I log in to Runhub
    When I follow the link for my email address in the navigation bar
    Then I should be on my profile page
