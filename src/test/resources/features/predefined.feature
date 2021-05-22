@predefined
Feature: Smoke steps

  @predefined1
  Scenario: Predefined steps for Google
    Given I open url "https://google.com"
    Then I should see page title as "Google"
    Then element with xpath "//input[@name='q']" should be present
    When I type "Behavior Driven Development" into element with xpath "//input[@name='q']"
    Then I click on element using JavaScript with xpath "(//input[@name='btnK'])[1]"
    Then I wait for element with xpath "//*[@id='res']" to be present
    Then element with xpath "//*[@id='res']" should contain text "Cucumber"

  @predefined2
  Scenario: Predefined steps for Gibiru
    Given I open url "https://gibiru.com/"
    Then I should see page title contains "Gibiru"
    Then element with xpath "//*[@id='q']" should be present
    When I type "Behavior Driven Development" into element with xpath "//*[@id='q']"
    And I click on element with xpath "//button[@type='submit']"
    And I wait for element with xpath "//*[@id='web-results']" to be present
    Then element with xpath "//*[@id='web-results']" should contain text "Cucumber"

  @predefined3
  Scenario: Steps for Duckduckgo
    Given I open url "https://duckduckgo.com/"
    Then I should see page title contains "DuckDuckGo"
    Then element with xpath "//*[@id='search_form_input_homepage']" should be displayed
    When I type "Behavior Driven Development" into element with xpath "//*[@id='search_form_input_homepage']"
    When I click on element with xpath "//*[@id='search_button_homepage']"
    When I wait for element with xpath "//*[@class='results--main']" to be present
    Then element with xpath "//*[@class='results--main']" should contain text "Cucumber"

  @predefined4
  Scenario: Steps for Swisscows
    Given I open url "https://swisscows.com/"
    Then I should see page title contains "Swisscows"
    Then element with xpath "//*[@name='query']" should be displayed
    When I type "Behavior Driven Development" into element with xpath "//*[@name='query']"
    When I click on element with xpath "//*[@class='search-submit']"
    When I wait for element with xpath "//*[@class='web-results']" to be present
    Then element with xpath "//*[@class='web-results']" should contain text "Cucumber"

  @predefined5
  Scenario: Steps for Searchencrypt
    Given I open url "https://www.searchencrypt.com/"
    Then I should see page title contains "Search Encrypt"
    When I type "Behavior Driven Development" into element with xpath "//*[@name='q']"
    When I click on element with xpath "//*[@class='search-bar__submit']"
    Then I wait for element with xpath "//*[@class='related-search__list']" to be present
    Then element with xpath "//*[@class='related-search__list']" should contain text "Cucumber"

  @predefined6
  Scenario: Steps for Startpage
    Given I open url "https://www.startpage.com/"
    Then I should see page title contains "Startpage"
    When I type "Behavior Driven Development" into element with xpath "//*[@id='q']"
    When I click on element with xpath "//*[@class='search-form-home__button']"
    When I wait for 1 sec
    #When I wait for element with xpath "//*[@id='gcsa-top']/iframe[2]" to be present
    #When I switch to iframe with xpath "//*[@id='gcsa-top']/iframe[2]"
    #When I wait for element with xpath "//iframe[@id='master-1']" to be present
    #When I switch to iframe with xpath "//iframe[@id='master-1']"
    #When I wait for element with xpath "//*[@id='adBlock']" to be present
    #Then element with xpath "//*[@id='adBlock']" should contain text "BDD"
    #When I switch to default content
    When I wait for element with xpath "//*[contains(@class,'w-gl w-gl')]" to be present
    When I wait for 1 sec
    Then element with xpath "//*[contains(@class,'w-gl w-gl')]" should contain text "BDD"

  @predefined7
  Scenario: Steps for Yandex
    Given I open url "https://yandex.com/"
    Then I should see page title as "Яндекс"
    Then element with xpath "//*[@id='text']" should be present
    When I type "Behavior Driven Development" into element with xpath "//*[@id='text']"
    And I click on element with xpath "//button"
    And I wait for element with xpath "//ul[@id='search-result']" to be present
    Then element with xpath "//ul[@id='search-result']" should contain text "software"

  @predefined8
  Scenario: Steps for Ecosia
    Given I open url "https://www.ecosia.org/"
    Then I should see page title contains "Ecosia"
    Then element with xpath "//*[@name='q']" should be displayed
    When I type "Behavior Driven Development" into element with xpath "//*[@name='q']"
    When I click on element with xpath "//*[@type='submit']"
    When I wait for element with xpath "//*[@class='mainline-results']" to be present
    When element with xpath "//*[@class='mainline-results']" should contain text "Cucumber"

  @predefined9
  Scenario: Steps for Wiki
    Given I open url "http://www.wiki.com/"
    Then I should see page title contains "Wiki.com"
    Then element with xpath "//*[@name='q']" should be present
    When I type "Behavior driven development" into element with xpath "//*[@name='q']"
    And I click on element with xpath "//*[@name='btnG']"
    When I switch to iframe with xpath "//iframe[@name='googleSearchFrame']"
    Then element with xpath "//*[@id='cse-body']" should be displayed
    And element with xpath "//*[@id='cse-body']" should contain text "Cucumber"
    When I switch to default content

  @predefined10
  Scenario: Steps for Givewater
    Given I open url "https://www.givewater.com/"
    Then I should see page title contains "giveWater"
    When I wait for element with xpath "//*[@id='popmake-172']/button" to be present
    When I click on element using JavaScript with xpath "//*[@id='popmake-172']/button"
    Then element with xpath "//*[@id='site-search']" should be displayed
    When I type "Behavior driven development" into element with xpath "//*[@id='site-search']"
    When I click on element with xpath "//*[@class='btn-search']"
    When I wait for element with xpath "//*[contains(@class,'mainline-results')]" to be present
    Then element with xpath "//*[contains(@class,'mainline-results')]" should contain text "Cucumber"

  @predefined11
  Scenario: Steps for Ekoru
    Given I open url "https://ekoru.org/"
    Then I should see page title contains "Ekoru"
    When element with xpath "//*[@id='fld_q']" should be displayed
    When I type "Behavior driven development" into element with xpath "//input[@id='fld_q']"
    When I click on element with xpath "//*[@id='btn_search']"
    When I wait for element with xpath "//div[@id='div_results']" to be present
    Then element with xpath "//div[@id='div_results']" should contain text "Cucumber"







