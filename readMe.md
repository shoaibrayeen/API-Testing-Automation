## API Testing Automation using Karate
Karate is an API automation tool for Java. Karate is the only open-source tool to combine API test-automation, mocks, performance-testing and even UI automation into a single, unified framework. The BDD syntax popularized by Cucumber is language-neutral, and easy for even non-programmers. Powerful JSON & XML assertions are built-in, and you can run tests in parallel for speed.
Test execution and report generation feels like any standard Java project. But there's also a stand-alone executable for teams not comfortable with Java. You don't have to compile code. Just write tests in a simple, readable syntax - carefully designed for HTTP, JSON, GraphQL and XML. And you can mix API and UI test-automation within the same test script.

### Getting Started with Project
Prerequisite
- Java 7+
- Spring boot 2.2.1+

Clone the repository
```sh
  > git clone https://github.com/shoaibrayeen/API-Testing-Automation
  > cd API-Testing-Automation
```

Install required dependencies
```sh
  > mvn clean install
```

Test Your APIs
```sh
  > mvn test
  > Check the report in Report Directory
```

Run Using IDE
- Import into IDE
- Install Required Dependencies
- To Run All Test Cases - Go to ApiTestingApplicationTests
    - Execute testAllFeatureFiles and it'd execute all test cases and generate two different reports. Check the report in report directory.
    - Execute testApis and it'd execute given feature files and generate the default report. Check it in the target directory.
- To Run a single feature file, go to the relative class file of the feature file.
    - Execute the method in the class and it'd generate the default report in the target directory.
    - For Example, Go to TypiCode directory and run method inside the TypiCode Java Class.



### License
[![Apache License](https://img.shields.io/badge/license-Apache-brightgreen.svg)](http://www.apache.org/licenses/)

**Copyright (c) 2020-2021 Mohd Shoaib Rayeen**

This project is licensed under the Apache License - see the LICENSE file for details
