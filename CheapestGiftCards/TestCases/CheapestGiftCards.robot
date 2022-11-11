*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/resources.robot
Variables    ../Locators/locators.py
Test Setup    open browser to specific page     ${url}  ${browser}
Test Teardown    close all open browsers


*** Variables ***
${url}  https://in.bookmyshow.com/
${browser}  headlesschrome
${expectedPrice_startRange}    100
${expectedPrice_endRange}   1200

*** Test Cases ***
Check gift cards on BookMyShow site
    [Documentation]    We select a sub-city from list of cities, navigate to gift card sections
    ...                find list of gift cards under 'movies and shopping' and return the lowest price
    ...                gift card
    maximize browser window
    set selenium speed    0.3 seconds

    select city
    select gift card option
    count available combos and find cards within range  ${expectedPrice_startRange}    ${expectedPrice_endRange}


*** Keywords ***
