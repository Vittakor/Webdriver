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
        Thread.sleep(time * 1000L);
    }

    @When("I click on the search button")
    public void iClickOnTheSearchButton() {
        getDriver().findElement(By.name("submit_search")).click();
    }

    @Then("The error message {string} should appears")
    public void theErrorMessageShouldAppears(String message) {
        getDriver().findElement(By.xpath("//*[contains(text(),'" + message + "')]")).isDisplayed();
    }

    @Then("The search results counter should displayed {int} results")
    public void theSearchResultsCounterShouldDisplayedResults(int counter) {
        if (counter == 1) {
            assertThat(getDriver().findElement(By.xpath("//span[@class='heading-counter']")).getText()).contains("" + counter + " result has been found.");
        } else if (counter >= 2) {
            assertThat(getDriver().findElement(By.xpath("//span[@class='heading-counter']")).getText()).contains("" + counter + " results have been found.");
        } else if (counter == 0) {
            assertThat(getDriver().findElement(By.xpath("//span[@class='heading-counter']")).getText()).contains("" + counter + " results have been found.");
        }
    }

    @Then("The message Showing ... of {int} items appears")
    public void theMessageShowingOfItemsAppears(int results) {
        if (results == 1) {
            assertThat(getDriver().findElement(By.xpath("//*[@class='product-count']")).getText()).contains("of " + results + " item");
        } else if (results > 1) {
            assertThat(getDriver().findElement(By.xpath("//*[@class='product-count']")).getText()).contains("of " + results + " items");
        }
    }

    @When("I wait until the page fully load")
    public void iWaitUntilThePageFullyLoad() {
        assertThat(getDriver().findElement(By.xpath("//div[@id='columns']")).isDisplayed()).isTrue();
    }

    @When("I click Sign in button")
    public void iClickSignInButton() {
        getDriver().findElement(By.xpath("//*[@class='login']")).click();
    }

    @When("I type {string} in the email field")
    public void iTypeInTheEmailField(String email) {
        getDriver().findElement(By.id("email_create")).sendKeys(email);
    }

    @When("I try to create an account")
    public void iTryToCreateAnAccount() {
        getDriver().findElement(By.id("SubmitCreate")).click();
    }

    @Then("I get {string} error message")
    public void iGetErrorMessage(String message) {
        assertThat(getDriver().findElement(By.xpath("//div[@id='create_account_error']//*[contains(text(),'" + message + "')]")).getText()).contains(message);
    }

    @When("I try to submit the form")
    public void iTryToSubmitTheForm() {
        getDriver().findElement(By.id("submitAccount")).click();
    }

    @When("I fill out password field as {string}")
    public void iFillOutPasswordFieldAs(String password) {
        getDriver().findElement(By.id("passwd")).sendKeys(password);
    }

    @Then("I assert actual error message with {string}")
    public void iAssertActualErrorMessageWith(String errorMs) {
        String actualRes = getDriver().findElement(By.xpath("//*[@class='alert alert-danger']//*[contains(text(),'passwd')]/..")).getText();
        assertThat(actualRes).containsIgnoringCase(errorMs);
    }

    @Then("no password errors appear")
    public void noPasswordErrorsAppear() {
        String result = getDriver().findElement(By.xpath("//*[@class='alert alert-danger']")).getText();
        assertThat(result).doesNotContain("passwd");
    }

    @When("I clear the form")
    public void iClearTheForm() {
        getDriver().findElement(By.id("email")).clear();
        getDriver().findElement(By.id("alias")).clear();
        getDriver().findElement(By.id("id_country")).click();
        getDriver().findElement(By.xpath("//select[@id='id_country']/option[1]")).click();
    }

    @When("I provide valid input {string} to field {string}")
    public void iProvideValidInputToField(String input, String field) {
        getDriver().findElement(By.id(field)).sendKeys(input);
    }

    @Then("Error message {string} should not be displayed")
    public void errorMessageShouldNotBeDisplayed(String message) {
        String result = getDriver().findElement(By.xpath("//*[@class='alert alert-danger']")).getText();
        assertThat(result).doesNotContain(message);
    }

    @Then("required fields trigger error messages")
    public void requiredFieldsTriggerErrorMessages() {
        String result = getDriver().findElement(By.xpath("//*[@class='alert alert-danger']")).getText();
        assertThat(result).containsIgnoringCase("You must register at least one phone number.");
        assertThat(result).containsIgnoringCase("lastname is required.");
        assertThat(result).containsIgnoringCase("firstname is required.");
        assertThat(result).containsIgnoringCase("passwd is required.");
        assertThat(result).containsIgnoringCase("email is required.");
        assertThat(result).containsIgnoringCase("alias is required.");
        assertThat(result).containsIgnoringCase("address1 is required.");
        assertThat(result).containsIgnoringCase("city is required.");
        assertThat(result).containsIgnoringCase("Country cannot be loaded with address->id_country");
        assertThat(result).containsIgnoringCase("Country is invalid");
    }

    @When("I fill out country")
    public void iFillOutCountry() {
        getDriver().findElement(By.id("id_country")).click();
        getDriver().findElement(By.xpath("//select[@id='id_country']/option[2]")).click();
    }

    @When("I select a state")
    public void iSelectAState() {
        getDriver().findElement(By.id("id_state")).click();
        getDriver().findElement(By.xpath("//select[@id='id_state']//option[1]")).click();
    }

    @Then("The country and zip related messages appears")
    public void theCountryAndZipRelatedMessagesAppears() {
        String result = getDriver().findElement(By.xpath("//*[@class='alert alert-danger']")).getText();
        assertThat(result).containsIgnoringCase("This country requires you to choose a State.");
        assertThat(result).containsIgnoringCase("It must follow this format: 00000");
    }

    @When("I fill out the form with valid info")
    public void iFillOutTheFormWithValidInfo() {
        getDriver().findElement(By.id("customer_firstname")).sendKeys("First");
        getDriver().findElement(By.id("customer_lastname")).sendKeys("Last");
        getDriver().findElement(By.id("passwd")).sendKeys("12345");
        getDriver().findElement(By.id("address1")).sendKeys("123 Main ave.");
        getDriver().findElement(By.id("city")).sendKeys("Austin");
        getDriver().findElement(By.id("phone_mobile")).sendKeys("87654321234");
        getDriver().findElement(By.id("postcode")).sendKeys("54321");
        getDriver().findElement(By.id("id_state")).click();
        getDriver().findElement(By.xpath("//select[@id='id_state']//option[2]")).click();
    }

    @When("I click on `My address` button")
    public void iClickOnMyAddressButton() {
        getDriver().findElement(By.xpath("//*[@title='Addresses']")).click();
    }

    @Then("I verify info in `My address` tab")
    public void iVerifyInfoInMyAddressTab() {
        String address = getDriver().findElement(By.xpath("//*[@class='last_item item box']")).getText();
        assertThat(address).containsIgnoringCase("My address");
        assertThat(address).containsIgnoringCase("First");
        assertThat(address).containsIgnoringCase("Last");
        assertThat(address).containsIgnoringCase("54321");
        assertThat(address).containsIgnoringCase("Austin");
        assertThat(address).containsIgnoringCase("87654321234");
        assertThat(address).containsIgnoringCase("United States");
        assertThat(address).containsIgnoringCase("123 Main ave.");
        assertThat(address).containsIgnoringCase("Alabama");
    }

    @When("I go back to my account")
    public void iGoBackToMyAccount() {
        getDriver().navigate().back();
    }

    @When("I click on `My personal info` button")
    public void iClickOnMyPersonalInfoButton() {
        getDriver().findElement(By.xpath("//*[@title='Information']")).click();
    }

    @Then("I verify info inside `My personal info` tab")
    public void iVerifyInfoInsideMyPersonalInfoTab() {
        assertThat(getDriver().findElement(By.id("firstname")).getAttribute("value")).containsIgnoringCase("First");
        assertThat(getDriver().findElement(By.id("lastname")).getAttribute("value")).containsIgnoringCase("Last");
        assertThat(getDriver().findElement(By.id("email")).getAttribute("value")).containsIgnoringCase("mail.ru");
    }
}
