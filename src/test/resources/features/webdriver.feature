@webdriver
Feature: Webdriver scenarios

  @webdriver1
  Scenario: Webdriver methods
    Given I navigate to "quote"
    Then I get browser details
    When I navigate to "yahoo"
    Then I get browser details
    When I go back, forward and refresh
    Then I verify current page as "yahoo"
    And I wait for 1 sec

  @webdriver2
  Scenario: Quote - Email errors verification
    Given I navigate to "quote"
    When I type "email" into email field
    And I submit the form
    Then error message "Please enter a valid email address." should be displayed

  @webdriver3
  Scenario Outline: Quote - Email errors verification -parametrized
    Given I navigate to "quote"
    When I type <email> into email field
    And I submit the form
    Then error message <expectedError> should be displayed
    Examples:
      | email     | expectedError                         |
      | "email@"  | "Please enter a valid email address." |
      | "email@." | "Please enter a valid email address." |
      | "email@ " | "Please enter a valid email address." |
      | "!@#"     | "Please enter a valid email address." |
      | ""        | "This field is required."             |