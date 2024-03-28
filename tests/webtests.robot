*** Settings ***
Library  SeleniumLibrary
Library  RequestsLibrary
Resource  ../resources/mainpage.resource
Resource  ../resources/resultpage.resource
Test Setup     Start our test
#Test Teardown  Close Browser
Test Timeout  60s

*** Keywords ***
Start our test
    #Open Browser  ${URL}    browser=${BROWSER}
    #Maximize Browser Window
    Create Session  alias=eshop  url=https://automationexercise.com/api  

*** Variables *** 
${URL} =  https://automationexercise.com/products
${BROWSER} =  chrome

*** Test Cases ***
Web test
    [Documentation]  lorem ipsum
    [Tags]   smoke  gui  search
    Product search  top
    Check results  top
    
Api test
    [Documentation]   dfdfdf
    [Tags]  api
    ${headers}=  Create Dictionary  Content-type=Application/JSON
    #api/productsList
    ${resp}=  GET On Session  eshop  /productsList  headers=${headers}
    Status Should Be                 200  ${resp}  msg=Status code should be 200    
    log  ${resp.json()}
    ${respjson}=  Set Variable  ${resp.json()}
    log  ${respjson}[products][0][name]

    ${resp2}=  POST On Session  eshop  /searchProduct  headers=${headers}
 


