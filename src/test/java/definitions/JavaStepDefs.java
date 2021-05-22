package definitions;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import org.apache.logging.log4j.core.util.JsonUtils;

import java.sql.SQLOutput;

public class JavaStepDefs {
    @Given("I print Hello World")
    public void iPrintHelloWorld() {
        System.out.println("Hello World!");
    }

    @And("I print {string}")
    public void iPrint(String greeting) {
        System.out.println(greeting);
        System.out.println(greeting.toLowerCase());
        System.out.println(greeting.toUpperCase());
        System.out.println("The length of string =" + greeting.length() + " characters");
//        System.out.println("The first letter is " + greeting.charAt(0));
//        System.out.println(greeting.charAt(greeting.length() - 1));
//        System.out.println(greeting.charAt(greeting.length() - 1));
//
//        System.out.println(greeting.equals("Selenium"));
//        System.out.println(greeting.toLowerCase().equals("selenium"));
//        System.out.println(greeting.equalsIgnoreCase("selenium"));


    }

    @Given("I operate on data")
    public void iOperateOnData() {
        //primitive
        int a = 3;
        double d = 3.0;
        boolean b = true;
        boolean x = (a == 3);  //if yes =true
        char c = 'a'; //with single quotes

        //non primitives

        String str = "Cucumber";
        int[] numbers = {1, 5, 8, 45, 43}; //spaces is requirement

    }


    @Given("I lean comparison operators")
    public void iLeanComparisonOperators() {

        //== is equal to  // for numerical value  //for strings equals

        // != not equal to
        // > grather than
        // < less than
        // >= grather than or equal
        // <= less than or equal
        // || or
        // && and

        int a = 3;
        int b = 5;

        if (a == 3) {
            System.out.println("They arer equal");
        }
        if (a != 5) {
            System.out.println("not equal");
        }

        if (b > a) {
            System.out.println("b is grather than a");
        }

        if (a < b) {
            System.out.println("a is less then b");

        }
        if (a == 3 || b >= 5) {
            System.out.println("a is 3 or b is 5");
        }
        if (a > 0 && a <= 3) {
            System.out.println("a is grather 0 a is less 3");
        }


    }


    @Given("I got {int} percent on my test")
    public void iGotPercentOnMyTest(int percent) {
        if (percent >= 90 && percent <= 100) {
            System.out.println("You passed with grade A");
        } else if (percent >= 80 && percent <= 89) {
            System.out.println("You passed with grade B");
        } else if (percent >= 70 && percent <= 79) {
            System.out.println("You passed with grade C");
        } else if (percent >= 60 && percent <= 69) {
            System.out.println("You passed with grade D");
        } else if (percent <= 59) {
            System.out.println("You passed with grade F");
        } else {
            System.out.println("This is out of range");
        }

    }


    @Given("I operate arrays")
    public void iOperateArrays() {
        String[] animals = {"Monkey", "Dog", "Cat", "Lion", "Tiger", "Bear"}; //we cannot change number of elements but can change value
        System.out.println(animals[3]);
        animals[3] = "Snake";
        System.out.println(animals[3]);
        //System.out.println(animals);
        for (String item : animals) {
            System.out.print(item + " ");
        }

    }


    @Given("I convert {int} kilogram to gram")
    public void iConvertKilogramToGram(int kilo) {
        System.out.println(kilo + " kilo = " + kilo * 1000 + " gram");
    }

    @And("I convert {int} hour to seconds")
    public void iConvertHourToSeconds(int hour) {
        System.out.println(hour + " hour = " + hour * 60 * 60 + " seconds");
    }

    @And("I convert {int} Celsius to Fahrenheit")
    public void iConvertCelsiusToFahrenheit(int celsius) {
        int fah = (celsius * 9 / 5) + 32;
        System.out.println(celsius + " in Celsius = " + fah + " in Fahrenheit");
    }

    @And("I print if number “{int}” is positive")
    public void iPrintIfNumberIsPositive(int number) {
        if (number > 0) {
            System.out.println("Number " + number + " is positive");
        }
        if (number == 0) {
            System.out.println("Number " + number + " is zero");
        }
        if (number < 0) {
            System.out.println("Number " + number + " is negative");
        }
    }

    @And("I print elements out of the array")
    public void iPrintElementsOutOfTheArray() {
        String[] week = {"Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"};
        System.out.println(week[1]);
        for (String increment : week) {
            System.out.println(increment);
        }
        System.out.println();
        for (String increment : week) {
            System.out.print(increment + " ");
        }
        System.out.println();
        System.out.println();

        for (int counter = 0; counter < week.length; counter++) {
            System.out.print(week[counter] + " ");
        }
    }
}
