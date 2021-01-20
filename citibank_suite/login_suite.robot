*** Settings ***
Library     DateTime
Library     SeleniumLibrary    
Library    OperatingSystem        



*** Test Cases ***
TC1_validcredential
    Log To Console    ${OUTPUT_DIR}${/}driver    # or \\ 
    Append To Environment Variable    path      ${OUTPUT_DIR}${/}driver
    Open Browser    url=https://online.citibank.co.in/    browser=googlechrome
    Maximize Browser Window
    Set Selenium Implicit Wait    30s
    Click Element    xpath=//a[text()='APPLY FOR CREDIT CARDS']
    sleep    5s
    ${title}    Get Title
    Log To Console    ${title} 
     #Switch to new tab with titles
    Switch Window    Online Credit Card Application Form | Citi India 
    
    ${text}    Get Text    id=creditapplication
    Log To Console    ${text}
    log    ${text}
    
    Click Element    //a[@title="Travel"]
    Click Element    //a[@title="Down"]    
    Input Text    name=email-email-1598329727016    sankettambe19988@gmail.com 
    Input Text    name=mobile-text-1598329731917    8655118612
    Input Text    name=firstName-text-1598329735386    sanket subhash tambe      
    Select Radio Button    radioButton-radio-group-1598330658729    No
         
    Close Window    
  
      
    
    