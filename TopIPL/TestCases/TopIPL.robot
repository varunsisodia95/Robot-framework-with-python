*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/resources.robot
Variables    ../Locators/locators.py
Suite Setup     Open browser to specific page   ${url}  ${browser}
Suite Teardown    Close all open browsers

*** Variables ***
${url}  https://www.cricbuzz.com/
${browser}  headlesschrome
${matchesWon}    2    # Change this value as needed

*** Test Cases ***
TC1
    [Documentation]    Open the given website and list down names of teams based on points
    [Tags]    Assignment-1.1
    # set selenium speed    1.2 seconds
    maximize browser window
    Select series from list
    View points table
    View data from table    ${matchesWon}

TC2
    [Documentation]    Go to homepage, check if links are broken or not
    [Tags]    Assignment-1.2
    ${ListOfBrokenLinks}=    Check website for broken links  ${url}
    log to console  ${ListOfBrokenLinks}

*** Keywords ***























