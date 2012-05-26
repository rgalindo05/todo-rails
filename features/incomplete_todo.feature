Feature: Incomplete a todo
  In order to return a completed todo to the incomplete todo list
  As a user
  I should be able to incomplete todos

  Scenario: Incomplete a todo
    Given I have signed in
    And I have the following complete todos:
      | name      |
      | Buy milk  |
      | Buy eggs  |
      | Buy flour |
    When I mark the todo "Buy flour" as incomplete
    Then my list of complete todos should be:
      | name      |
      | Buy milk  |
      | Buy eggs  |
    And my list of incomplete todos should be:
      | name      |
      | Buy flour |
