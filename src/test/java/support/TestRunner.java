package support;

import cucumber.api.CucumberOptions;
import cucumber.api.junit.Cucumber;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions(
        plugin = {"pretty", "html:target/cucumber", "json:target/cucumber/report.json"},
        features = "src/test/resources/features",
        glue = {"definitions", "support"},
        tags = {"@store, ~@converter, ~@java, ~@cucumber, ~@webdriver, ~@quote, ~@predefined"} // same as VM option  -Dcucumber.options="--tags @predefined"
              )
public class TestRunner {
    @BeforeClass
    public static void setup() { System.out.println("BeforeAll");
    }
    @AfterClass
    public static void teardown() {
        System.out.println("AfterAll");
    }
}



//working:
//tags = {"@quote"} - execute only this
//tags = {"~@quote"} becomes  tags = {"not @quote"}- execute all except this
//tags = {"@tag1,@tag2") becomes tags = {"@tag1 or @tag2"}  - execute both?


//not working:
//tags = {"@tag1","@tag2"} becomes tags = {"@tag1 and @tag2"}
//tags = {"@tag1","@tag2,@tag3"} becomes tags = {"@tag1 and (@tag2 or @tag3)"}



//    mvn test -Dcucumber.options="--tags @predefined"
//    mvn test -Dcucumber.filter.tags="@smoke and @fast"
//    mvn test -Dcucumber.filter.tags="@predefined and @quote"