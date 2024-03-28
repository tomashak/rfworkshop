*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${input_Search}=  //input[@id="search_product"]
${search_click_btn}=  submit_search
${h2_title}=  //h2[contains(@class,"title")]

*** Keywords ***
Product search
    [Documentation]  Fill term to search input \n
    ...  druhy radek
    [Arguments]  ${what}
    Wait Until Element Is Visible  locator=${input_Search}
    Element Should Contain  locator=${h2_title}  expected=ALL PRODUCTS  message=Title should be ALL Products
    Input Text  ${input_Search}  text=${what}
    Click Element  locator=${search_click_btn}