*** Settings ***
Library     DateTime
Library     SeleniumLibrary    
Library    OperatingSystem        



*** Test Cases ***
TC1_validcredential
    Log To Console    ${OUTPUT_DIR}${/}driver    # or \\ 
    Append To Environment Variable    path      ${OUTPUT_DIR}${/}driver
    Open Browser    url=https://db4free.net/   browser=googlechrome
    Maximize Browser Window
    Set Selenium Implicit Wait    30s
    Click Element    xpath=//b[contains(text(),'phpMyAdmin')]
    sleep    5s
    ${title}    Get Title
    Log To Console    ${title}    
    #Switch to new tab with titles
    
    Switch Window    phpMyAdmin
    
    Input Text    id=input_username    admin
    Input Password    id=input_password    admin123
    
    Click Element    id=input_go
    #get error message and print in console
    ${err}    Get Text    xpath=(//div[@class="error"])[2]  #//div[contains(text(),'Cannot')]  
    Log To Console    ${err}    
    log    ${err}
    
    Close Window
    
  