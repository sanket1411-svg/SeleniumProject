*** Settings ***
Library     DateTime
Library     SeleniumLibrary    
Library    OperatingSystem        



*** Test Cases ***
TC1_validcredential
    Log To Console    ${OUTPUT_DIR}${/}driver    # or \\ 
    Append To Environment Variable    path      ${OUTPUT_DIR}${/}driver
    Open Browser    url=https://www.gotomeeting.com/en-in   browser=googlechrome
    Maximize Browser Window
    Set Selenium Implicit Wait    30s
    Run Keyword And Ignore Error    Click Element    xpath=//div[@class="conversion-modal__close"]
    Click Element    xpath=(//a[text()='Start for Free'])[2]   
    Input Text    id=first-name    sanket      
    Input Text    name=LastName    Tambe
    Input Text    name=Email    sankettambe1997@gmail.com    
    Input Text    name=PhoneNumber    8655118612        
    Select From List By Label    name=JobTitle    Engineering
    Input Password    name=Password    sanket14    
    #Click Element    xpath=//input[@value="10-99"]  # cookies popup is creating error so we are not able to select size 
    Scroll Element Into View    xpath=//img[@alt="Trust Arc"]
    #Click Element    xpath=//input[@value="10-99"]   
    Select Radio Button    companySize    10-99
    Click Element    xpath=//button[text()='Sign Up']   
        