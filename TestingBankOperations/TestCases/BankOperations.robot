# This file contains the actual test case to
# verify bank operations.
*** Settings ***
Library    SeleniumLibrary
Library    DataDriver   ../TestData/CustomerList.xlsx
Resource    ../Resources/Resources.robot
Suite Setup    open bank site   ${SiteUrl}  ${browser}
Suite Teardown    close browser session
Test Template    Bank manager operations

*** Variables ***
${SiteUrl}  https://www.globalsqa.com/angularJs-protractor/BankingProject/#/login
${browser}  Chrome

*** Test Cases ***
TC1_BankManager_workflow    ${FNAME}    ${LNAME}    ${PINCODE}     ${CURRENCY}
    [Tags]    Bank_manager_workflow
    maximize browser window


*** Keywords ***
Bank manager operations
    [Arguments]    ${FNAME}    ${LNAME}    ${PINCODE}     ${CURRENCY}
    set selenium implicit wait    2 seconds
    set selenium speed    0.5 seconds
    login as bank manager
    add Cx as bank manager    ${FNAME}   ${LNAME}    ${PINCODE}
    open account for new Cx as bank manager  ${FNAME}   ${LNAME}  ${CURRENCY}
    check customer details in DB    ${FNAME}   ${LNAME}


















