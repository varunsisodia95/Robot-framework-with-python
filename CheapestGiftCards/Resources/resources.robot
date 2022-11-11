"""
This file contains the various utility functions required for
performing the various operations in assignment-4
"""
*** Settings ***
Library     SeleniumLibrary
Library     String
Variables    ../Locators/locators.py

*** Keywords ***
open browser to specific page
    [Arguments]    ${url}   ${browser}
    open browser    ${url}  ${browser}

select city
    [Documentation]    Hover mouse over cities dropdown and select Noida from it.
    mouse over    ${CityPopup}
    wait until element is visible    ${subCities_dropdown}  30s

    ${subCityListCount}=     get element count    ${subCities_dropdown}
    log    Number of sub-cities: ${subCities_dropdown}

    log to console    List of sub-cities in Delhi:
    FOR    ${index}    IN RANGE    1    ${subCityListCount}+1
        ${subCityName}=     get text    (${subCities_dropdown})[${index}]
        log    ${subCityName}
        log to console      ${subCityName}${\n}
    END

    comment    Select 'Greater Noida' from list of cities
    mouse over    ${subCitySelected}
    mouse down    ${subCitySelected}
    mouse up    ${subCitySelected}

select gift card option
    [Documentation]    Clicking on gift card link on the webapge and select combos option.
    click link    ${giftCardLink}
    wait until element is visible    ${comboLink}   15s
    click element    ${comboLink}

count available combos and find cards within range
    [Documentation]    Counting number of available combos and find gift card with lowest price
    [Arguments]    ${expectedPrice_startRange}    ${expectedPrice_endRange}

    comment    Calculate total number of available gift cards under shopping category.
    ${ShoppingCardsCount}=  get element count    ${availableCombos}
    log    Total number of shopping gift cards: ${availableCombos}

    FOR    ${index}    IN RANGE     1    ${ShoppingCardsCount}+1
        comment    Hover mouse over a gift card
        wait until element is visible    ${availableCombos}    15s
        mouse over    (${availableCombos})[${index}]

        comment    Retrieve gift card price
        scroll element into view    //ul[@class='sc-1m2izr0-3 bWagRM']/li[${index}]/div/div[2]/descendant::span[2]
        ${giftCardPrice}=   get text    //ul[@class='sc-1m2izr0-3 bWagRM']/li[${index}]/div/div[2]/descendant::span[2]
        ${giftCardPrice}=   convert to integer  ${giftCardPrice[1:]}
        log    Gift card price: ${giftCardPrice}


        IF  ${giftCardPrice} >= ${expectedPrice_startRange} and ${giftCardPrice} <= ${expectedPrice_endRange}
            comment    Get gift card name
            ${giftCardName}=    get text    //ul[@class='sc-1m2izr0-3 bWagRM']/li[${index}]/div/div[2]/descendant::span[1]
            log    Gift Card name within range: ${giftCardName}
            log to console    ${giftCardName}
        END

    END



close all open browsers
    close all browsers




















