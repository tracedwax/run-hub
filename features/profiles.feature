Feature: View a user's profile
  In order to see if I am interested in another runner
  A runner
  Should view the other runner's profile

  Scenario: Viewing my own profile while I am logged out
    Given I am an existing user
    And I am not logged in
    When I go to my profile page
    Then I should see my username
