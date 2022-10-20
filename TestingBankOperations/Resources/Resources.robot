# This file contains the necessary user-defined keywords
# that will be used by our test case
*** Settings ***
Library    SeleniumLibrary
Variables   ../Locators/Locators.py

*** Keywords ***
open bank site
    [Arguments]    ${bankSite}  ${browser}
    open browser    ${bankSite}  ${browser}

go to home
    click button    ${Home_btn}

login as bank manager
    click button    ${BM_login_btn}

add Cx as bank manager
    [Arguments]    ${fName}     ${lName}    ${pincode}
    click button    ${BM_addCx_tab}
    input text    ${BM_addCx_tab_fName}     ${fName}
    input text    ${BM_addCx_tab_lName}   ${lName}
    input text    ${BM_addCx_tab_postCode}   ${pincode}
    click button    ${BM_addCx_tab_btn}
    handle alert    ACCEPT

check alert for empty fields in add customer tab
    [Arguments]    ${fName}     ${lName}    ${pincode}
    click button    ${BM_addCx_tab}
    input text    ${BM_addCx_tab_fName}     ${fName}
    input text    ${BM_addCx_tab_lName}   ${lName}
    input text    ${BM_addCx_tab_postCode}   ${pincode}
    click button    ${BM_addCx_tab_btn}

    capture page screenshot     ../Results_negativeScenarios/${TEST NAME}.png



open account for new Cx as bank manager
    [Arguments]    ${fName}     ${lName}    ${currency}
    click button    ${BM_openAcc_tab}

    ${fullName}  catenate  ${fName}  ${lName}
    log to console    ${fullName}

    select from list by label  ${BM_openAcc_tab_CxDropDownName}   ${fullName}
    select from list by value    ${BM_openAcc_tab_currencyListName}    ${currency}
    click button    ${BM_openAcc_tab_process_Btn}
    handle alert    ACCEPT

check alert for empty fields in open account tab
    [Arguments]    ${fName}     ${lName}    ${currency}
    click button    ${BM_openAcc_tab}

    select from list by label  ${BM_openAcc_tab_CxDropDownName}   ---Customer Name---
    select from list by label    ${BM_openAcc_tab_currencyListName}    ---Currency---
    click button    ${BM_openAcc_tab_process_Btn}

    capture page screenshot     ../Results_negativeScenarios/emptyAccountFields.png

check customer details in DB
    [Arguments]    ${fName}     ${lName}
    click button    ${BM_CxList_tab}
    ${CustomerCount}=   get element count    ${BM_CXList_CxCount}
    log to console   ${CustomerCount}

    table row should contain    ${BM_CxList_tab_CxTable}    ${CustomerCount}    ${fName}

    # Scrolling till bottom
    scroll element into view    //table[@class='table table-bordered table-striped']/tbody/tr/td[text()="${fName}"]

    click button    ${Home_btn}

check if table does not contain incorrect entries
    [Arguments]    ${fName}     ${lName}
    click button    ${BM_CxList_tab}

    ${fullName}  catenate  ${fName}  ${lName}

    input text    ${BM_CxList_tab_searchBox}    ${fullName}

    table row should contain    ${BM_CxList_tab_CxTable}    1   ${EMPTY}


close browser session
    close all browsers





















