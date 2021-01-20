*** Settings ***
Library     DateTime
Library     SeleniumLibrary    
Library    OperatingSystem        


*** Test Cases ***
TC1_validcredential
    Log To Console    ${OUTPUT_DIR}${/}driver    # or \\ 
    Append To Environment Variable    path      ${OUTPUT_DIR}${/}driver
    Open Browser    url=https://www.royalcaribbean.com/    browser=ff
    Maximize Browser Window
    
    FOR    ${i}    IN RANGE    0    9999
        Run Keyword And Ignore Error      Click Element    //div[@class="email-capture__body"]/* 
        Run Keyword And Ignore Error      Click Element    //span[text()='Sign In'] 
        ${count}    Get Element Count    //a[text()='Create an account']
        Exit For Loop If    ${count}>0
    END    
    Set Selenium Implicit Wait    30s
   
    #//*[@class="email-capture__close"]  ,  //*[name()='svg'] 
    Click Element    //a[text()='Create an account']    
    Input Text    id=mat-input-3    Dennis    
    Input Text    id=mat-input-4    Rich    
    Click Element    (//span[contains(text(),'Month')])[1]    
    Click Element    //span[text()=' March '] 
    Click Element    (//span[contains(text(),'Day')])[1]     
    Click Element    //span[text()=' 3 ']    
    Input Text    id=mat-input-5    2021
    Click Element    (//span[contains(text(),'Country/Region of residence')])[1]
    Click Element    //span[contains(text(),'India')]       
    Input Text    id=mat-input-2    sankettambe1999@gmail.com          
    Input Text    id=mat-input-6    sanket14    
    Click Element    //span[text()='Select one security question']    
    Click Element    //span[text()=' Where did you take your first vacation? ']
    Input Text    id=mat-input-7    ratnagiri    
    #Scroll Element Into View    //a[contains(text(),'About Us')]
    Click Element    //div[@class="mat-checkbox-inner-container mat-checkbox-inner-container-no-side-margin"]    
    Click Element    //button[contains(text(),'Done')]    
       