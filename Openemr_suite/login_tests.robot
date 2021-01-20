*** Settings ***
Library     DateTime
Library     SeleniumLibrary    
Library    OperatingSystem        


*** Test Cases ***
TC1_validcredential
    Log To Console    ${OUTPUT_DIR}${/}driver    # or \\ 
    Append To Environment Variable    path      ${OUTPUT_DIR}${/}driver
    Open Browser    url=https://demo.openemr.io/b/openemr/interface/login/login.php?site=default    browser=ff
    Maximize Browser Window
    #Set Selenium Implicit Wait    30s
    Input Text    id=authUser    admin
    Input Password    id=clearPass    pass
    Select From List By Label    name=languageChoice    English (Indian)            
    Click Element    xpath=//button[@type='submit']
    Title Should Be    OpenEMR    
    Mouse Over    xpath=//span[@data-bind="text:lname"]
    Click Element    xpath=//li[text()='Logout']    
    Close Browser