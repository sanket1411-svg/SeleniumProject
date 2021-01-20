*** Settings ***
Library     DateTime
Library     SeleniumLibrary    
Library    OperatingSystem        



*** Test Cases ***
TC1_validcredential
    Log To Console    ${OUTPUT_DIR}${/}driver    # or \\ 
    Append To Environment Variable    path      ${OUTPUT_DIR}${/}driver
    Open Browser    url=https://www.medibuddy.in/   browser=ff
    Maximize Browser Window
    Set Selenium Implicit Wait    30s
    Click Element    xpath=//a[text()='Signup']     
    Input Text    name=firstName    sanket
    Input Text    name=phone    6543789012      
    Input Text    name=username    sankettambe1997777@gmail.com    
    Input Password    name=password    qscgyuljfw1234    
    Click Element    xpath=//input[@ng-model="showRegisterPassword"]    
    Click Element    xpath=//button[text()='Register'] 

    