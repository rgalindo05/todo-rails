Feature: User signs out of the application
  In order to keep my tasks private
  As a user
  I should be able to sign out

  Scenario: Sign out
    Given I have signed in
    When I sign out
    Then I should see that I have signed out
