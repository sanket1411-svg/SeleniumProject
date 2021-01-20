*** Settings ***
Library     DateTime
Library     SeleniumLibrary    
Library    OperatingSystem        


*** Test Cases ***
TC1_validcredential
    Log To Console    ${OUTPUT_DIR}${/}driver    # or \\ 
    Append To Environment Variable    path      ${OUTPUT_DIR}${/}driver
    Open Browser    url=https://demo.openemr.io/openemr/interface/login/login.php?site=default    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    30s
    Input Text    id=authUser    admin
    Input Password    id=clearPass    pass
    Select From List By Label    name=languageChoice    English (Indian)            
    Click Element    xpath=//button[@type='submit']
    Title Should Be    OpenEMR    
    Mouse Over    xpath=//div[text()='Patient/Client']
    Click Element    xpath=//div[text()='New/Search']    
    Select Frame    (//iframe[@data-bind="location: $data, iframeName: $data.name, "])[3]
    Input Text    name=form_fname    sanket    
    Input Text    name=form_mname    s
    Input Text    name=form_lname    tambe
    Input Text    name=form_DOB    2021-01-16    
    Select From List By Label    name=form_sex    Male
    Click Element    name=create   
    Unselect Frame
    Select Frame    //iframe[@class="w-100 h-100 modalIframe"]
    Click Element    //input[@value="Confirm Create New Patient"]     
    Unselect Frame
    sleep    5s
    ${alerttext}    Handle Alert    ACCEPT    timeout=30s            #handling 
    Log To Console    ${alerttext} 
    
    ${count}    Get Element Count    //div[@class="closeDlgIframe"]
    Run Keyword If    ${count}>0    Click Element    //div[@class="closeDlgIframe"]     
    #Run Keyword And Ignore Error     Click Element    //div[@class="closeDlgIframe"] 
        
    Select Frame    (//iframe[@data-bind="location: $data, iframeName: $data.name, "])[3]  
    ${element}    Get Text    //h2[contains(text(),'Medical Record Dashboard')]
    Log To Console    ${element}
    
    #Get Text    //h2[contains(text(),'Medical Record Dashboard')]       
    Element Should Contain     //h2[contains(text(),'Medical Record Dashboard')]     Sanket Tambe    
    Unselect Frame
    #Close Browser
    