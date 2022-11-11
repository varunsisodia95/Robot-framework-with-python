"""
This file contains the various utility
method required for assignment-3
"""
*** Settings ***
Library    SeleniumLibrary
Library  OperatingSystem
Library    Collections
Library  String
Variables    ../Locators/locators.py

*** Keywords ***
open webpage
    [Arguments]    ${url}   ${browser}
    open browser    ${url}  ${browser}

search keyword
    [Arguments]    ${searchKeyword}
    input text    ${SearchBox}  ${searchKeyword}
    press keys    ${SearchBox}    RETURN

retrieve and store search results
    [Arguments]    ${resultsCount}  ${filename}

    ${totalResultsCount}=   get element count    ${SearchResultList}

    append to file    ${filename}   ---------------------------------${\n}
    FOR    ${index}     IN RANGE    1   ${resultsCount}+1
        ${linkText}=    get text    (${SearchResultList})[${index}]
        ${index}=   convert to string    ${index}
        append to file    ${filename}   ${index}.)
        append to file    ${filename}   ${linkText}${\n}
    END
    append to file    ${filename}   ---------------------------------

display contents of file
    [Arguments]    ${file}
    ${fileName}=    get file    ${file}
    @{list}=    split to lines    ${fileName}

    FOR    ${line}  IN    @{list}:
        log   ${line}
    END

get count of occurances
    [Arguments]    ${keyword}

    ${MatchCount}=  get element count    //*[contains(., "${keyword}")]

    [Return]    ${MatchCount}

close all open browsers
    close all browsers




















