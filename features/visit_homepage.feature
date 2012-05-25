# Feature descriptions do not have an affect on the test.
# The purpose is to outline the who, why, how (aka business value) to developers.
Feature: Visit the homepage
  In order to make an informed decision about signing up
  As a guest
  I should be able to read information about the site

  Scenario: Guest visits the homepage
    When I view the homepage
    Then I should be able to read about the application

  Scenario: User visits the homepage
    Given I have signed in
    When I view the homepage
    Then I should be able to view my todos
