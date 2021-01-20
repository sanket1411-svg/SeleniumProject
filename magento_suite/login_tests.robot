*** Settings ***
Library     DateTime
Library     SeleniumLibrary    
Library    OperatingSystem        

*** Test Cases ***
TC1_ValidCredential
    Log To Console    sanket 
    log     sankettambe   
    ${date}    Get Current Date   
    Log To Console    ${date}     
    
TC2_InvalidCredentials
    Log To Console    sanket 
    log     sankettambe   
    ${date}    Get Current Date   
    Log To Console    ${date} 
    
TC3_ValidCredential
    Append To Environment Variable    path      C:\\robotic_framework\\robot_workspace
    Open Browser    url=https://magento.com/    browser=ff
    
TC4_validCredential
    Log To Console    ${OUTPUT_DIR}${/}driver    # or \\ 
    Append To Environment Variable    path      ${OUTPUT_DIR}${/}driver
    Open Browser    url=https://magento.com/    browser=ff
    Maximize Browser Window
    Click Element    link=My Account
    Input Text    id=email    balaji0017@gmail.com    
    Input Password    id=pass    welcome@12345    
    Click Element    id=send2   
    Title Should Be    My Account        
    Click Link    link=Log Out    
    Close Browser
    
TC5_forloop
    FOR    ${i}    IN RANGE    1    11
        Exit For Loop If    ${i}==5
    END    
    Log To Console    ${i}    
    
    

TC6_SignupTest
    Log To Console    ${OUTPUT_DIR}${/}driver    # or \\ 
    Append To Environment Variable    path      ${OUTPUT_DIR}${/}driver
    Open Browser    url=https://www.google.com/    browser=googlechrome
    Maximize Browser Window
    ${link_count}    Get Element Count    //a
    Log To Console     ${link_count}
    
    ${text}    Get Text    xpath=//a3 
    Log To Console    ${text}    
    

    ${href}    Get Element Attribute    //a    href
    Log To Console    ${href}    
      
