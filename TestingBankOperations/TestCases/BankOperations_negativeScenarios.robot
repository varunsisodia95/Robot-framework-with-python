# This file contains the actual test case to
# verify bank operations.
*** Settings ***
Library    SeleniumLibrary
Library    DataDriver   ../TestData/CustomerList.xlsx   sheet_name=NegativeEntries
Resource    ../Resources/Resources.robot
Suite Setup    open bank site   ${SiteUrl}  ${browser}
Suite Teardown    close browser session
Test Template    Bank manager operations

*** Variables ***
${SiteUrl}  https://www.globalsqa.com/angularJs-protractor/BankingProject/#/login
${browser}  Chrome

*** Test Cases ***
TC1_BankManager_workflow_negative    ${FNAME}    ${LNAME}    ${PINCODE}     ${CURRENCY}
    [Tags]    Bank_manager_negative_workflow

*** Keywords ***
Bank manager operations
    [Arguments]    ${FNAME}    ${LNAME}    ${PINCODE}     ${CURRENCY}
    maximize browser window
    set selenium implicit wait    3 seconds
    set selenium speed    0.5 seconds
    set selenium timeout    5 seconds
    go to home
    login as bank manager
    check alert for empty fields in add customer tab    ${FNAME}    ${LNAME}    ${PINCODE}
    check alert for empty fields in open account tab    ${FNAME}    ${LNAME}    ${CURRENCY}
    check if table does not contain incorrect entries   ${FNAME}    ${LNAME}



















