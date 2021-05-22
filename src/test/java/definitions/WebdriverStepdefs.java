package definitions;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import org.openqa.selenium.By;

import static org.assertj.core.api.Assertions.assertThat;
import static support.TestContext.getDriver;

public class WebdriverStepdefs {
    @Given("I navigate to {string}")
    public void iNavigateTo(String url) {
//        if (url.equals("google")) {
//            getDriver().get("https://www.google.com/");
//        } else if (url.equals("yahoo")) {
//            getDriver().get("https://www.yahoo.com/");
//        } else if (url.equals("quote")){
//            getDriver().get("http://skryabin.com/market/quote.html");
//        } else {
//            System.out.println("This website " + url +" is not supported");
//        }
//    }
        switch (url) {
            case "google":
                getDriver().get("https://www.google.com/");
                break;
            case "yahoo":
                getDriver().get("https://www.yahoo.com/");
                break;
            case "quote":
                getDriver().get("http://skryabin.com/market/quote.html");
                break;
            case "converter":
                getDriver().get("https://www.unitconverters.net/");
                break;
            default:
                System.out.println("This website " + url + " is not supported");
        }
    }

    @Then("I get browser details")
    public void iGetBrowserDetais() {
        System.out.println(getDriver().getTitle());
        System.out.println(getDriver().getCurrentUrl());
        System.out.println(getDriver().getWindowHandle());
    }

    @When("I go back, forward and refresh")
    public void iGoBackForwardAndRefresh() {
        getDriver().navigate().back();
        getDriver().navigate().forward();
        getDriver().navigate().refresh();
    }

    @Then("I verify current page as {string}")
    public void iVerifyCurrentPageAs(String page) {
        String curUrl = getDriver().getCurrentUrl();
        assertThat(curUrl.contains(page)).isTrue();
    }

    @When("I type {string} into email field")
    public void iTypeIntoEmailField(String email) {
        getDriver().findElement(By.name("email")).sendKeys(email);

    }

    @And("I submit the form")
    public void iSubmitTheForm() {
        getDriver().findElement(By.id("formSubmit")).click();
    }

    @Then("error message {string} should be displayed")
    public void errorMessageShouldBeDisplayed(String expectedError) {
        String actualError = getDriver().findElement(By.id("email-error")).getText();
        assertThat(actualError.equals(expectedError)).isTrue();
    }
}
