*** Settings ***
Library     DateTime
Library     SeleniumLibrary    
Library    OperatingSystem        



*** Test Cases ***
TC1_validcredential
    Log To Console    ${OUTPUT_DIR}${/}driver    # or \\ 
    Append To Environment Variable    path      ${OUTPUT_DIR}${/}driver
    Open Browser    url=https://www.irctc.co.in/nget/train-search   browser=ff
    Maximize Browser Window
    Set Selenium Implicit Wait    30s    
    Click Element    xpath=//button[text()='OK']     
    Select From List By Label    locator    
   