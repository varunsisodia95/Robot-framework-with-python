
# Web testing using Robot Framework and SeleniumLibrary

Robot Framework is a generic open source test automation framework and SeleniumLibrary is one of the many test libraries that can be used with it. The following projects are done with the intent of cementing my understanding of the same.


## Tech Stack

**Language:** Python

**Framework:** Robot framework

**Design pattern used:** Page Object Model (POM)

## Projects:

1) [Finding the top IPL teams in a league.](https://github.com/varunsisodia95/Robot-framework-with-python/tree/main/TopIPL)
2) [Operations with Google search](https://github.com/varunsisodia95/Robot-framework-with-python/tree/main/TopGoogleResults)
3) [Cheapest giftcard finder](https://github.com/varunsisodia95/Robot-framework-with-python/tree/main/CheapestGiftCards)
4) [Testing banking operations](https://github.com/varunsisodia95/Robot-framework-with-python/tree/main/TestingBankOperations)


## Test cases and Utilities

### Test cases

- Test cases for all projects are located under the <b> /TestCases </b> directory of the respective project.

### Locators.py

- This file contains all the necessary locators needed for testing the various elements on the demo website.


### Resources.robot

- This file contains helper functions to perform various activities like button click, navigate to specific webpage etc.

## Generated results

- log.html
- output.xml
- report.html


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
robot --outputdir Results .\TestCases\<TEST_CASE_NAME>.robot 
```


