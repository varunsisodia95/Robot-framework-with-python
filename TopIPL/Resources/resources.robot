"""
This file contains various helper functions
to user specified test cases.
"""
*** Settings ***
Library    SeleniumLibrary
Library    RequestsLibrary
Library    Collections
Variables    ../Locators/locators.py

*** Keywords ***
Open browser to specific page
    [Arguments]    ${url}   ${browserName}
    open browser    ${url}   ${browserName}

Select series from list
    click link    ${A1_seriesList_btn}
    click link    ${A1_T20Wcup_selection}

View points table
    click link    ${A1_pointsTableLink}

View data from table
    [Arguments]    ${matchesWon}
    [Documentation]    Retrieve names of teams who have number of matches won = ${matchesWon}
    ${cells}=   get element count    ${A1_T20_table_rows}   # Retrieve number of rows in the table
    FOR    ${cell}  IN RANGE    1   ${cells}
         ${elementValue}=   get text    (${A1_T20_table_matchesWon})[${cell}]
#        log to console  ${elementValue}

        ${elementValue}=    convert to integer    ${elementValue}
        IF    ${elementValue} == ${matchesWon}
#            log to console   "Match"
            ${teamName}=    get_text    (${A1_T20_table_teamName})[${cell}]
            log to console    ${teamName}
        END
    END


Check website for broken links
    [Arguments]    ${url}
    [Documentation]    Get list of broken links on the webpage based on response code.

    comment    Count the number of links on webpage.
    ${items}=   get element count    //a
    log to console    ${items}

    comment    Create list to store link texts
    @{linkItems}    create list

    comment    Loop through all links and store links value
    FOR    ${index}    IN RANGE    1    ${items}
        ${linkText}=    get element attribute   (//a)[${index}]     href

        IF  '${linkText}' != 'None'
            ${checkLinkLength}  get length    ${linkText}
            ${checkStartsWith}=     run keyword and ignore error    should start with    ${linkText}    ${url}
            log     ${checkStartsWith}

            run keyword if    ${checkLinkLength}>1 and '${checkStartsWith}[0]' == 'PASS'    append to list    ${linkItems}  ${linkText}
        END
    END

    comment    Get count of total number of links on the webpage for further iteration.
    ${linkItems_length}     get length    ${linkItems}

    comment    Create list to store all the broken links found on the webpage
    @{brokenLinks}  create list

    FOR    ${index}    IN RANGE    ${linkItems_length}
        log    ${index}
        log    ${linkItems[${index}]}
        Create session  CrickBuzzSession    ${linkItems[${index}]}  # Create session for every link in the list.
        ${response}     get on session    CrickBuzzSession     /
        run keyword if      ${response.status_code} != 200  append to list    ${brokenLinks}    ${linkItems[${index}]}
    END

    [Return]    ${brokenLinks}

Close all open browsers
    close all browsers





















