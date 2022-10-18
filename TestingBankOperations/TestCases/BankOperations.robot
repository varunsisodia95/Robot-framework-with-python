# This file contains the actual test case to
# verify bank operations.
*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/Resources.robot

*** Variables ***
${SiteUrl}  https://www.globalsqa.com/angularJs-protractor/BankingProject/#/login
${browser}  Chrome

*** Test Cases ***
TC1_BankManager_workflow
    [Tags]    Bank_manager_workflow
    set selenium timeout    5 seconds
    set selenium speed    0.5 seconds
    open bank site    ${SiteUrl}    ${browser}
    login as bank manager
    add Cx as bank manager  Roger   Moore   400123
    open account for new Cx as bank manager  Roger   Moore  Rupee
    check customer details in DB    Roger   Moore


*** Keywords ***

















