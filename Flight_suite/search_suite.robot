*** Settings ***
Library     DateTime
Library     SeleniumLibrary    
Library    OperatingSystem        


*** Test Cases ***

TC6_SignupTest
    Log To Console    ${OUTPUT_DIR}${/}driver    # or \\ 
    Append To Environment Variable    path      ${OUTPUT_DIR}${/}driver
    Open Browser    browser=ff
    Maximize Browser Window
     Set Selenium Implicit Wait    
    Go To    url=https://www.phptravels.net/
    sleep    5s
    
    #Click Element    id=dropdownCurrency  
    #Click Element    //a[contains(text(),'INR')]    #(//*[contains(text(),"USD")])[1]/following::*[contains(text(),"INR")]    
    ${ele}    Get WebElement    //a[contains(text(),'INR')]
    Execute Javascript    arguments[0].click();    ARGUMENTS    ${ele}    
    
    
    sleep    2s  
    Click Element    //a[contains(text(),'Flights')]    
    Click Element    (//a[@class="chosen-single"])[1]
    Click Element    //li[contains(text(),'Business')]        
    Click Element    id=s2id_location_from        
    Press Keys    None    new york    
    sleep    2s
    Click Element    //div[contains(text(),'EWR')]    #//div[contains(text(),'New York (')]    
    Click Element    id=s2id_location_to    
    Press Keys    None    sindal
    sleep    2s
    Click Element    //span[contains(text(),'Sindal')]    
    
    #Click Element    id=FlightsDateStart    
    #Click Element    (//div[contains(text(),'30')])[18]
    Execute Javascript    document.getElementById('FlightsDateStart').value="2021-01-30"
    
    FOR    ${i}    IN RANGE    1    4
        Click Element    (//button[contains(text(),'+')])[3]
        #Exit For Loop If    ${i}==4
    END    
    
    FOR    ${i}    IN RANGE    0    2
        Click Element    (//button[contains(text(),'+')])[5]     
        #Exit For Loop If    ${i}==2
    END      
    Click Element    (//button[contains(text(),'Search')])[2]     
    Click Element    (//button[contains(text(),'Book Now')])[1]           
    ${text}    Get Text    (//h5[@class="float-none"])[2]
    Log To Console    ${text}
    
   # ${list}    Get List Items    
    #Log To Console    ${list}
    
