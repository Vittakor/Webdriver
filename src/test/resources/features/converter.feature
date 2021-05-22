@converter
Feature: Unit converter

  @converter1
  Scenario Outline: Validate temperature conversion from C to F
    Given I navigate to "converter"
    When I click on tab <tab>
    When I type <input> in From input field
    When I select <fromOption> in options FROM
    When I select <toUnit> in select element TO
    Then I verify that result is equal to <expectedRes>
    Examples:
      | tab           | input | fromOption          | toUnit              | expectedRes |
      | "Length"      | "1"   | "Kilometer"         | "Meter"             | "1000"      |
      | "Temperature" | "0"   | "Celsius"           | "Fahrenheit"        | "32"        |
      | "Area"        | "1"   | "Square Centimeter" | "Square Centimeter" | "1"         |
      | "Volume"      | "2"   | "Liter"             | "Milliliter"        | "2000"      |
      | "Weight"      | "3"   | "Pound"             | "Ounce"             | "48"        |
      | "Time"        | "4"   | "Minute"            | "Second"            | "240"       |

