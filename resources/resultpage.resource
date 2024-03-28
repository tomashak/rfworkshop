*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${h2_title}=  //h2[contains(@class,"title")]

*** Keywords ***
Check results
    [Documentation]  lorem ipsum
    [Arguments]  ${what}
    Wait Until Element Contains  locator=${h2_title}  text=SEARCHED PRODUCTS
    ${curUrl}=  Get Location
    Location Should Contain  expected=${what}  message=Check URL for search param, expected topx, actual: ${curUrl}