Feature: Guest signs in to application
  In order to manage my todo items
  As a guest
  I should be able to sign in

  Scenario: Sign in
    When I sign in as "steve@example.com"
    Then I should see that I have signed in as "steve@example.com"
