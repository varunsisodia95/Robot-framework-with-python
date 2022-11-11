*** Settings ***
Library     SeleniumLibrary
Library  OperatingSystem
Library  String
Resource    ../Resources/Project3_resources.robot
Resource    ../Resources/Project1_resources.robot
Test Setup    Create file    ${EXECDIR}/searchResults.txt
Test Teardown    Assignment3_resources.close all open browsers

*** Variables ***
${url}  https://www.google.com/
${browser}  headlesschrome
${noOfResultsToStore}   10
@{searchItems}  create list  Putin    Modi    Trump    Merkel    Trudeau
${searchKeyword}    Hacon

*** Test Cases ***
Search something and store contents in a file
    [Documentation]    Search keywords in google, store top 10 results into file and display contents
             ...       of file on the console.

    [Tags]    Assignment-3.1
    open webpage    ${url}  ${browser}
    set selenium speed    0.5 seconds

    FOR    ${item}     IN    @{searchItems}
        search keyword  ${item}
        retrieve and store search results     ${noOfResultsToStore}     ${EXECDIR}/searchResults.txt
    END
    display contents of file    ${EXECDIR}/searchResults.txt


Check links and display number of occurances on webpage
    [Documentation]    Check if all links on the webpage are working fine
    ...                Also, find number of occurances of given keyword
    ...                on the webpage
    [Tags]    Assignment-3.2
    open webpage    ${url}  ${browser}
    set selenium speed    0.5 seconds

    search keyword  ${searchKeyword}

    ${count}=   get count of occurances     ${searchKeyword}
    log    Number of occurances on webpage: ${count}

    ${brokenLinks}=    Check website for broken links  ${url}

    ${isEmpty}  run keyword and return status    should be empty    ${brokenLinks}
    IF    ${isEmpty} == 1
        log    There are no broken links on the webpage
    ELSE
        log    The following are the broken links on the webpage:
        log list    ${brokenLinks}
    END







*** Keywords ***
























