Feature: Edit todo
  In order to update my todos
  As a user
  I should be edit an existing todo

  @javascript
  Scenario: User edits a todo
    Given I have signed in
    And I have the following todos:
      | name      |
      | Buy milk  |
      | Buy eggs  |
      | Buy flour |
    When I update the todo "Buy eggs" to "Walk the dog"
    Then my list of incomplete todos should be:
      | name         |
      | Buy milk     |
      | Walk the dog |
      | Buy flour    |

  @javascript
  Scenario: User edits a todo with an invalid todo
    Given I have signed in
    And I have the following todos:
      | name      |
      | Buy milk  |
      | Buy eggs  |
      | Buy flour |
    When I update the todo "Buy eggs" to ""
    Then I should see a todo error
