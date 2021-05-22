package definitions;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import org.openqa.selenium.By;

import static org.assertj.core.api.Assertions.assertThat;
import static support.TestContext.getDriver;

public class ConverterStepdefs {
    @When("I click on tab {string}")
    public void iClickOnTab(String tab) {
       getDriver().findElement(By.xpath("//a[text()='"+ tab +"']")).click();
    }

    @When("I type {string} in From input field")
    public void iTypeInFromInputField(String input) {
        getDriver().findElement(By.name("fromVal")).sendKeys(input);
    }

    @And("I select {string} in select element TO")
    public void iSelectInSelectElementTO(String toUnit) {
        getDriver().findElement(By.xpath("//select[@id='calTo']/*[contains(text(),'"+ toUnit +"')]")).click();
    }

    @Then("I verify that result is equal to {string}")
    public void iVerifyThatResultIsEqualTo(String expectedRes) {
        String actualRes = getDriver().findElement(By.xpath("//input[@name='toVal']")).getAttribute("value");
        assertThat(actualRes.equals(expectedRes)).isTrue();
    }

    @When("I select {string} in options FROM")
    public void iSelectInOptionsFROM(String fromOption) {
        getDriver().findElement(By.xpath("//select[@id='calFrom']/*[text()='" + fromOption + "']")).click();
    }
}
