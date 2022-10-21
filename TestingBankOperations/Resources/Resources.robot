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

login as customer
    [Arguments]    ${fName}     ${lName}    ${currency}
    click button    ${CX_Login_btn}
    ${CXname}   catenate    ${fName}    ${lName}
    select from list by label    ${CX_dropDown_name}    ${CXname}
    click button    ${CX_dropDown_login_btn}

    page should contain    Welcome  ${CXname}
    page should contain    Balance : 0
    page should contain    Currency : ${currency}

deposit money as a customer
    [Arguments]    ${depositAmount}
    click button    ${CX_depositTab}
    input text    ${CX_depositTab_inputAmount}  ${depositAmount}
    click button    ${CX_depositTab_deposit_btn}

    ${depositAmount}=   convert to integer    ${depositAmount}
    log to console    ${depositAmount}

    IF  ${depositAmount} > 0
        page should contain    Deposit Successful
        ${newBalance}   set variable    ${depositAmount}

        page should contain    Balance : ${newBalance}
    END

    log to console    ${newBalance}
    [Return]    ${newBalance}


check customer transactions table
    [Arguments]    ${lastTransactionAmt}    ${transactionType}
    click button    ${CX_transactionsTab}

    ${transactionsCount}=   get element count    ${CX_transactionsTab_tableRows}
    log to console    Number of transactions: ${transactionsCount}

    table row should contain    ${CX_transactionsTab_tableName}   ${transactionsCount}    ${lastTransactionAmt}
    table row should contain    ${CX_transactionsTab_tableName}   ${transactionsCount}    ${transactionType}

withdraw money as a customer
    [Arguments]    ${newBalanceAfterDeposit}  ${withdrawlAmount}
    click button    ${CX_back_btn}
    click button    ${CX_withdrawlTab}

    input text    ${CX_withdrawlTab_ipWithdrawl}    ${withdrawlAmount}
    ${withdrawlAmount}=     convert to integer    ${withdrawlAmount}

    IF    ${withdrawlAmount} > 0 and ${withdrawlAmount} < ${newBalanceAfterDeposit}
        click button    ${CX_withdrawlTab_withdraw_btn}
        ${newBalAfterWithdrawl}=  evaluate    ${newBalanceAfterDeposit} - ${withdrawlAmount}

        page should contain    Transaction successful
        page should contain    Balance : ${newBalAfterWithdrawl}
    END

    [Return]    ${newBalAfterWithdrawl}

click back button
    click button    ${CX_back_btn}

close browser session
    close all browsers





















