
# Web testing using Robot Framework and SeleniumLibrary

Robot Framework is a generic open source test automation framework and SeleniumLibrary is one of the many test libraries that can be used with it. In addition to showing how they can be used together for web testing, this project demonstrates testing the registration and login workflow of a 
new customer on a demo banking website. 

## Demo application used for testing

I have used the following [demo website](https://www.globalsqa.com/angularJs-protractor/BankingProject/#/login) for a dummy bank for the purpose of testing.

![App Screenshot](TestingBankOperations\DemoWebsite.png)


## Tech Stack

**Language:** Python

**Framework:** Robot framework

**Design pattern used:** Page Object Model (POM)


## Test cases and Utilities

### [BankOperations_positiveScenarios.robot](https://www.google.com)

This file contains two test cases, one where we check the registration workflow of a new customer 
and second where we test the login to logout workflow for the same user.
Note that, the test data for this is provided via an excel sheet uploaded under **Resources folder**.


### [Locators.py](https://www.google.com)

This file contains all the necessary locators needed for testing the various elements on the demo website.


### [Resources.robot](https://www.google.com)

This file contains helper functions to perform various activities like button click, navigate to specific webpage etc.

## Generated results

- [log.html]()
- [output.xml]()
- [report.html]()



## Running test cases
### Preconditions
Install Robot Framework and SeleniumLibrary along with its dependencies using pip package manager. Once you have pip installed, 
all you need to do is running the following command:

```bash
pip install -r requirements.txt
```
Note: The requirements.txt file is attached in the project directory itself.

### Running tests
The test cases are located in the **TestCases** directory. 
They can be executed using the robot command:

```bash
robot --outputdir Results .\TestCases\BankOperations_positiveScenarios.robot 
```


