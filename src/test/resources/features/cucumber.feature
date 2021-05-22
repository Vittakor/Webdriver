@quote
Feature: Quote page - Cucumber Scenarios

  Background:
    Given I open url "http://skryabin.com/market/quote.html"
    Then I should see page title contains "Get a Quote"

  @quote1
  Scenario: Validate responsive UI behavior
    When I resize window to 1920 and 1080
    Then element with xpath "//b[@id='location']" should be displayed
    Then element with xpath "//b[@id='currentDate']" should be displayed
    Then element with xpath "//b[@id='currentTime']" should be displayed
    When I resize window to 1024 and 768
    Then element with xpath "//b[@id='location']" should be displayed
    Then element with xpath "//b[@id='currentDate']" should be displayed
    Then element with xpath "//b[@id='currentTime']" should be displayed
    When I resize window to 375 and 667
    Then element with xpath "//b[@id='location']" should not be displayed
    Then element with xpath "//b[@id='currentDate']" should not be displayed
    Then element with xpath "//b[@id='currentTime']" should not be displayed

  @quote2
  Scenario: Fill out and validate Username field
    When I type "a" into element with xpath "//*[@name='username']"
    When I click on element with xpath "//button[@id='formSubmit']"
    Then element with xpath "//label[@id='username-error']" should contain text "Please enter at least 2 characters."
    When I clear element with xpath "//input[@name='username']"
    Then element with xpath "//label[@id='username-error']" should contain text "This field is required."
    When I type "11" into element with xpath "//input[@name='username']"
    When I click on element with xpath "//button[@id='formSubmit']"
    Then element with xpath "//label[@id='username-error']" should not be displayed

  @quote3
  Scenario: Validate that email field accepts only valid email addresses
    When I wait for element with xpath "//*[@name='email']" to be present
    When I click on element with xpath "//button[@id='formSubmit']"
    Then element with xpath "//label[@id='email-error']" should contain text "This field is required."
    When I type "email" into element with xpath "//*[@name='email']"
    When I click on element with xpath "//button[@id='formSubmit']"
    Then element with xpath "//label[@id='email-error']" should contain text "Please enter a valid email address."
    When I click on element with xpath "//button[@id='formSubmit']"
    When I type "@" into element with xpath "//*[@name='email']"
    Then element with xpath "//label[@id='email-error']" should contain text "Please enter a valid email address."
    When I type "gmail.com" into element with xpath "//*[@name='email']"
    When I click on element with xpath "//button[@id='formSubmit']"
    Then element with xpath "//label[@id='email-error']" should not be displayed

  @quote4
  Scenario: Validate that Confirm Password is disabled if Password field is empty
    When I wait for element with xpath "//input[@id='password']" to be present
    When I click on element with xpath "//button[@id='formSubmit']"
    Then element with xpath "//label[@id='password-error']" should contain text "This field is required."
    Then element with xpath "//input[@id='confirmPassword']" should be disabled
    When I type "1" into element with xpath "//input[@id='password']"
    Then element with xpath "//label[@id='password-error']" should contain text "Please enter at least 5 characters."
    Then element with xpath "//input[@id='confirmPassword']" should be enabled
    When I type "2345" into element with xpath "//input[@id='password']"
    When I click on element with xpath "//button[@id='formSubmit']"
    Then element with xpath "//label[@id='confirmPassword-error']" should contain text "This field is required."
    When I type "1" into element with xpath "//input[@id='confirmPassword']"
    Then element with xpath "//label[@id='confirmPassword-error']" should contain text "Please enter at least 5 characters."
    When I type "2346" into element with xpath "//input[@id='confirmPassword']"
    Then element with xpath "//label[@id='confirmPassword-error']" should contain text "Passwords do not match!"
    When I clear element with xpath "//input[@id='confirmPassword']"
    When I type "12345" into element with xpath "//input[@id='confirmPassword']"
    When I click on element with xpath "//button[@id='formSubmit']"
    Then element with xpath "//label[@id='confirmPassword-error']" should not be displayed

  @quote5
  Scenario: Validate “Name” field behavior Modal dialog:
    When I wait for element with xpath "//input[@id='name']" to be present
    When I click on element with xpath "//button[@id='formSubmit']"
    Then element with xpath "//label[@id='name-error']" should contain text "This field is required."
    When I click on element with xpath "//input[@id='name']"
    Then element with xpath "//div[@id='nameDialog']" should be displayed
    When I type "First" into element with xpath "//input[@id='firstName']"
    When I type "Middle" into element with xpath "//input[@id='middleName']"
    When I type "Last" into element with xpath "//input[@id='lastName']"
    When I click on element with xpath "//*[text()='Save']"
    Then element with xpath "//input[@id='name']" should have attribute "value" as "First Middle Last"
    When I click on element with xpath "//button[@id='formSubmit']"
    Then element with xpath "//label[@id='name-error']" should not be displayed

  @quote6
  Scenario: Validate that Accepting Privacy Policy is required
    When I wait for element with xpath "//*[@name='agreedToPrivacyPolicy']" to be present
    When I click on element with xpath "//button[@id='formSubmit']"
    Then element with xpath "//label[@id='agreedToPrivacyPolicy-error']" should contain text "Must check!"
    When I click on element with xpath "//*[@name='agreedToPrivacyPolicy']"
    When I click on element with xpath "//button[@id='formSubmit']"
    Then element with xpath "//label[@id='agreedToPrivacyPolicy-error']" should not be displayed

  @quote7
  Scenario: Validate non-required fields
    When I wait for element with xpath "//*[@name='phone']" to be present
    When I type "012345678901234567890" into element with xpath "//*[@name='phone']"
    When I click on element with xpath "//button[@id='formSubmit']"
    Then element with xpath "//label[@id='phone-error']" should contain text "Please enter no more than 20 characters."
    When I clear element with xpath "//input[@name='phone']"
    When I type "+0123456789" into element with xpath "//input[@name='phone']"
    When I click on element with xpath "//button[@id='formSubmit']"
    Then element with xpath "//label[@id='phone-error']" should not be displayed
    When I click on element with xpath "//select[@name='countryOfOrigin']"
    When I click on element with xpath "//select[@name='countryOfOrigin']/*[@value='USA']"
    When I click on element with xpath "//*[@name='gender'][@value='male']"
    When I click on element with xpath "//input[@name='allowedToContact']"
    When I type "123 Main ave." into element with xpath "//*[@name='address']"
    When I click on element with xpath "//select[@name='carMake']/option[@value='Other']"
    When I click on element with xpath "//button[@id='thirdPartyButton']"
    When I dismiss alert
    Then element with xpath "//span[@id='thirdPartyResponseMessage']" should contain text "You did not accept third party agreement."
    When I click on element with xpath "//button[@id='thirdPartyButton']"
    When I accept alert

    Then element with xpath "//span[@id='thirdPartyResponseMessage']" should contain text "You accepted third party agreement."
    When I click on element with xpath "//input[@id='dateOfBirth']"
    Then element with xpath "//div[@id='ui-datepicker-div']" should be displayed
    When I click on element with xpath "//select[@class='ui-datepicker-month']"
    When I click on element with xpath "//select[@class='ui-datepicker-month']/option[@value='2']"
    When I click on element with xpath "//select[@class='ui-datepicker-year']"
    When I scroll to the element with xpath "//select[@class='ui-datepicker-year']/option[@value='1993']" with offset 10
    When I click on element with xpath "//select[@class='ui-datepicker-year']/option[@value='1993']"
    When I click on element with xpath "//*[@class='ui-datepicker-calendar']//a[text()='8']"
    Then element with xpath "//input[@id='dateOfBirth']" should have attribute "value" as "03/08/1993"

  @quote8
  Scenario: Validate the form after submission
    When I type "Tester" into element with xpath "//input[@name='username']"
    When I type "mail@gmail.com" into element with xpath "//*[@name='email']"
    When I type "qwert" into element with xpath "//input[@id='password']"
    When I type "qwert" into element with xpath "//input[@id='confirmPassword']"
    When I click on element with xpath "//input[@id='name']"
    When I type "First" into element with xpath "//input[@id='firstName']"
    When I type "Middle" into element with xpath "//input[@id='middleName']"
    When I type "Last" into element with xpath "//input[@id='lastName']"
    When I click on element with xpath "//*[text()='Save']"
    When I click on element with xpath "//*[@name='agreedToPrivacyPolicy']"
    When I type "+123456789" into element with xpath "//input[@name='phone']"
    When I click on element with xpath "//select[@name='countryOfOrigin']"
    When I click on element with xpath "//select[@name='countryOfOrigin']/*[@value='USA']"
    When I click on element with xpath "//*[@name='gender'][@value='male']"
    When I click on element with xpath "//input[@name='allowedToContact']"
    When I type "123 Main ave." into element with xpath "//*[@name='address']"
    When I click on element with xpath "//select[@name='carMake']/option[@value='Other']"
    When I click on element with xpath "//button[@id='thirdPartyButton']"
    When I accept alert
    When I click on element with xpath "//input[@id='dateOfBirth']"
    When I click on element with xpath "//select[@class='ui-datepicker-month']"
    When I click on element with xpath "//select[@class='ui-datepicker-month']/option[@value='2']"
    When I click on element with xpath "//select[@class='ui-datepicker-year']"
    When I scroll to the element with xpath "//select[@class='ui-datepicker-year']/option[@value='1993']" with offset 10
    When I click on element with xpath "//select[@class='ui-datepicker-year']/option[@value='1993']"
    When I click on element with xpath "//*[@class='ui-datepicker-calendar']//a[text()='8']"
    When I switch to iframe with xpath "//*[@name='additionalInfo']"
    When I type "Jack" into element with xpath "//input[@id='contactPersonName']"
    When I type "+9876543210" into element with xpath "//input[@id='contactPersonPhone']"
    When I switch to default content
    When I click on element with xpath "//button[@id='formSubmit']"
    When I wait for element with xpath "//b[@name='phone']" to be present
    Then element with xpath "//b[@name='phone']" should contain text "123456789"
    Then element with xpath "//b[@name='dateOfBirth']" should contain text "03/08/1993"
    Then element with xpath "//b[@name='lastName']" should contain text "Last"
    Then element with xpath "//b[@name='email']" should contain text "mail@gmail.com"
    Then element with xpath "//b[@name='contactPersonPhone']" should contain text "9876543210"
    Then element with xpath "//b[@name='thirdPartyAgreement']" should contain text "accepted"
    Then element with xpath "//b[@name='carMake']" should contain text "Other"
    Then element with xpath "//b[@name='address']" should contain text "123 Main ave."
    Then element with xpath "//b[@name='name']" should contain text "First Middle Last"
    Then element with xpath "//b[@name='agreedToPrivacyPolicy']" should contain text "true"
    Then element with xpath "//b[@name='countryOfOrigin']" should contain text "USA"
    Then element with xpath "//b[@name='firstName']" should contain text "First"
    Then element with xpath "//b[@name='password']" should contain text "[entered]"
    Then element with xpath "//b[@name='gender']" should contain text "male"
    Then element with xpath "//b[@name='allowedToContact']" should contain text "true"
    Then element with xpath "//b[@name='middleName']" should contain text "Middle"
    Then element with xpath "//b[@name='username']" should contain text "Tester"
    Then element with xpath "//b[@name='contactPersonName']" should contain text "Jack"
    Then element with xpath "//*[contains(text(),'qwert')]" should not be present
    Then element with xpath "//div[@id='quotePageForm']" should not contain text "qwert"
