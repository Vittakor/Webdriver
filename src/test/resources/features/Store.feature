@store
Feature: store

  Background:
    Given I go to store web site
    Then  I verify page title as "My Store"


  @store1
  Scenario Outline: Fill out and validate “Search” field.
    When I type <request> in the search field
    When I click on the search button
    When I wait for element "//div[@id='center_column']" to be displayed
    Then The error message <message> should appears
    Then The search results counter should displayed <counter> results

    Examples:
      | request | message                                 | counter |
      | ""      | "Please enter a search keyword"         | "0"     |
      | "short" | "Showing"                               | "4"     |
      | "car"   | "No results were found for your search" | "0"     |













#
#
#
#Test Case 1: Fill out and validate “Search” field.
#Validate empty input
#Validate input of item existing on the page
#Validate input of item nonexistent on the page
#
#Test Case 2: Validate” Create an account” behavior
#Validate that email field accepts only valid email addresses.
#Validate that email field does not accept email addresses that have already been registered
#
#Test Case 3:
#Fill out and validate “Password” set of fields.
#Validate 5 characters minimum12345
#
#Test Case 4: Validate Required fields behavior
#
#Test Case 5: Submit the form and verify the data on My Account page: My Address and My Personal Information data
#
#Options

