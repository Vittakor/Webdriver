@store
Feature: store

  Background:
    Given I go to store web site
    Then  I verify page title as "My Store"

  @store1
  Scenario Outline: Fill out and validate “Search” field.
    When I type <request> in the search field
    When I click on the search button
    When I decide to wait for 2 seconds
    Then The error message <message> should appears
    Then The search results counter should displayed <counter> results
    Then The message Showing ... of <results> items appears
    Examples:
      | request  | message                                 | counter | results |
      | ""       | "Please enter a search keyword"         | 0       | 0       |
      | "blouse" | ""                                      | 1       | 1       |
      | "short"  | ""                                      | 4       | 4       |
      | "car"    | "No results were found for your search" | 0       | 0       |

  @store2
  Scenario Outline: Validate ”Create an account” behavior
    When I click Sign in button
    When I type <email> in the email field
    When I try to create an account
    When I decide to wait for 2 seconds
    Then I get <message> error message
    Examples:
      | email           | message                                                            |
      | ""              | "Invalid email address"                                            |
      | " "             | "Invalid email address"                                            |
      | "@"             | "Invalid email address"                                            |
      | "a@"            | "Invalid email address"                                            |
      | "a@a"           | "Invalid email address"                                            |
      | "a@a."          | "Invalid email address"                                            |
      | "@."            | "Invalid email address"                                            |
      | "test"          | "Invalid email address"                                            |
      | ".com"          | "Invalid email address"                                            |
      | "test@test.com" | "An account using this email address has already been registered." |


  @store3
  Scenario: Fill out and validate “Password” set of fields
    When I click Sign in button
    When I type "carqsikgt@mail.ru" in the email field
    When I try to create an account
    When I wait for element with xpath "//button[@id='submitAccount']" to be present
    When I try to submit the form
    Then I assert actual error message with "passwd is required."
    When I fill out password field as "1234"
    When I try to submit the form
    Then I assert actual error message with "passwd is invalid."
    Then I fill out password field as "12345"
    When I try to submit the form
    Then no password errors appear

  @store4
  Scenario Outline: Validate Required fields behavior
    When I click Sign in button
    When I type "aarsikgt@mail.ru" in the email field
    When I try to create an account
    When I wait for element with xpath "//button[@id='submitAccount']" to be present
    When I clear the form
    When I try to submit the form
    Then required fields trigger error messages
    When I fill out country
    When I try to submit the form
    Then The country and zip related messages appears
    When I select a state
    When I provide valid input <input> to field <field>
    When I try to submit the form
    Then Error message <message> should not be displayed

    Examples:
      | input              | field                | message                                        |
      | "First"            | "customer_firstname" | "firstname is required."                       |
      | "Last"             | "customer_lastname"  | "lastname is required."                        |
      | "qarsikgt@mail.ru" | "email"              | "email is required."                           |
      | "12345"            | "passwd"             | "passwd is required."                          |
      | "123 Main ave."    | "address1"           | "address1 is required."                        |
      | "Austin"           | "city"               | "city is required."                            |
      | "8765432112"       | "phone_mobile"       | "You must register at least one phone number." |
      | "My address"       | "alias"              | "alias is required."                           |
      | "54321"            | "postcode"           | "It must follow this format: 00000"            |
      | ""                 | ""                   | "This country requires you to choose a State." |

  @store5
  Scenario: Submit the form and verify the data on My Account page: My Address and My Personal Information data
    When I click Sign in button
    When I type "zqarsgiaqkagt@mail.ru" in the email field
    When I try to create an account
    When I wait for element with xpath "//button[@id='submitAccount']" to be present
    When I fill out the form with valid info
    When I try to submit the form
    Then element with xpath "//*[@title='Addresses']" should be displayed
    When I click on `My address` button
    Then element with xpath "//*[@title='Update']" should be displayed
    Then I verify info in `My address` tab
    When I go back to my account
    When I click on `My personal info` button
    Then element with xpath "//*[@name='submitIdentity']" should be displayed
    Then I verify info inside `My personal info` tab
