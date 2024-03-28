*** Settings ***
Library  SeleniumLibrary
Test Setup     Start our test
Test Teardown  Close Browser
Test Timeout  60s

*** Keywords ***
Start our test
    Open Browser  https://automationexercise.com/products  browser=chrome
    Maximize Browser Window

Product search
    [Documentation]  Fill term to search input \n
    ...  druhy radek
    [Arguments]  ${what}
    Wait Until Element Is Visible  locator=${input_Search}
    Element Should Contain  locator=${h2_title}  expected=ALL PRODUCTS  message=Title should be ALL Products
    Input Text  ${input_Search}  text=${what}
    Click Element  locator=${search_click_btn}

Check results
    [Documentation]  lorem ipsum
    [Arguments]  ${what}
    Wait Until Element Contains  locator=${h2_title}  text=SEARCHED PRODUCTS
    ${curUrl}=  Get Location
    Location Should Contain  expected=${what}  message=Check URL for search param, expected topx, actual: ${curUrl}

*** Variables ***
${input_Search}=  //input[@id="search_product"]
${h2_title}=  //h2[contains(@class,"title")]
${search_click_btn}=  submit_search


*** Test Cases ***
Web test
    Product search  top
    Check results  top
    




