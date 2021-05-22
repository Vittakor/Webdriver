package definitions;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import org.openqa.selenium.By;

import static org.assertj.core.api.Assertions.assertThat;
import static support.TestContext.getDriver;

public class StoreStepdefs {
    @Given("I go to store web site")
    public void iGoToStoreWebSite() {
        getDriver().navigate().to("http://automationpractice.com/index.php");
    }

    @Then("I verify page title as {string}")
    public void iVerifyPageTitleAs(String title) {
        assertThat(getDriver().getTitle()).isEqualTo(title);
    }

    @When("I type {string} in the search field")
    public void iTypeInTheSearchField(String request) {
        getDriver().findElement(By.id("search_query_top")).sendKeys(request);
    }

    @When("I decide to wait for {int} seconds")
    public void iDecideToWaitForSeconds(int time) throws Exception {
        Thread.sleep(time * 1000);
    }

    @When("I click on the search button")
    public void iClickOnTheSearchButton() {
        getDriver().findElement(By.name("submit_search")).click();
    }

    @When("I wait for element {string} to be displayed")
    public void iWaitForElementToBeDisplayed(String xpath) {
        getDriver().findElement(By.xpath(xpath)).isDisplayed();
    }

    @Then("The error message {string} should appears")
    public void theErrorMessageShouldAppears(String message) {
        getDriver().findElement(By.xpath("//*[contains(text(),'"+ message +"')]")).isDisplayed();
    }

    @Then("The search results counter should displayed {string} results")
    public void theSearchResultsCounterShouldDisplayedResults(String counter) {
        assertThat(getDriver().findElement(By.xpath("//span[@class='heading-counter']")).getText()).contains(""+counter+" results have been found.");
    }


}


