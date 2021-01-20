*** Settings ***
Library     DateTime
Library     SeleniumLibrary    
Library    OperatingSystem        


*** Test Cases ***

TC6_SignupTest
    Log To Console    ${OUTPUT_DIR}${/}driver    # or \\ 
    Append To Environment Variable    path      ${OUTPUT_DIR}${/}driver
    Open Browser    url=https://www.google.com/    browser=chrome
    Maximize Browser Window
    ${link_count}    Get Element Count    //a
    Log To Console     ${link_count}
    
    ${text}    Get Text    xpath=//a
    Log To Console    ${text}    
    

    ${href}    Get Element Attribute    //a    href
    Log To Console    ${href}    
    
    ${text_2}    Get WebElements    xpath=//a
    Log To Console    ${text_2} 
    Click Element    ${text_2}
    
    ${list _of_elements}    Get WebElements    //a
    
     FOR    ${i}    IN RANGE    0      ${link_count}
        ${text}    Get Text    ${list _of_elements}[${i}]
        Log To Console    ${text}   
        
        ${href}    Get Element Attribute     ${list _of_elements}[${i}]    href
        Log To Console    ${href} 
        
    END
  
TC7_test
    Log To Console    ${OUTPUT_DIR}${/}driver    # or \\ 
    Append To Environment Variable    path      ${OUTPUT_DIR}${/}driver
    Open Browser    url=https://www.google.com/    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    30s
    
    ${link_count}    Get Element Count    //a
    Log To Console     ${link_count}
    
    ${list _of_elements}    Get WebElements    //a
     
    FOR    ${i}    IN RANGE    0    ${link_count}
        
        ${text}    Get Text    ${list _of_elements}[${i}]
        Log To Console    ${text}
        #${text}==image --> perform click
        Run Keyword If    '${text}'=='Images'    Click Element    ${list _of_elements}[${i}]    
        Exit For Loop If    '${text}'=='Images'    
               
    END
        
    
TC8_GetWebElementsTest
    Log To Console    ${OUTPUT_DIR}${/}driver    # or \\ 
    Append To Environment Variable    path      ${OUTPUT_DIR}${/}driver
    Open Browser    url=https://www.google.com/    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    30s
    
    ${list _of_elements}    Get WebElement    //a
    
    FOR    ${ele}     IN     ${list _of_elements}
        ${text}    Get Text    ${ele}
        Log To Console    ${text}
    END  
        
TC9_tables
     Log To Console    ${OUTPUT_DIR}${/}driver    # or \\ 
    Append To Environment Variable    path      ${OUTPUT_DIR}${/}driver
    Open Browser    browser=chrome
    Maximize Browser Window
    Go To    url=https://datatables.net/extensions/select/examples/initialisation/checkbox.html
    Set Selenium Implicit Wait    30s
    
    Table Should Contain    //table[@id="example"]    Brielle Williamson
    
    ${cell}    Get Table Cell    //table[@id="example"]    1    2
    Log To Console    ${cell}
        
    Table Cell Should Contain    //table[@id="example"]    1    2    Position    
    Table Row Should Contain    //table[@id="example"]    1    Age    
    
TC10_tables_2
     Log To Console    ${OUTPUT_DIR}${/}driver    # or \\ 
    Append To Environment Variable    path      ${OUTPUT_DIR}${/}driver
    Open Browser    browser=chrome
    Maximize Browser Window
    Go To    url=https://editor.datatables.net/
    Set Selenium Implicit Wait    30s
    
    Input Text    //input[@type="search"]    Brielle Williamson
    Click Element    //td[contains(text(),"Brielle Williamson")]    
    Click Element    (//div[@class="dt-buttons"]/*)[2]       
    Click Element    (//div[@class="DTE_Field_InputControl"])[3]/*    
    Input Text    (//div[@class="DTE_Field_InputControl"])[3]/*    QA Engineer
    Click Element    //div[@class="DTE_Form_Buttons"]/*        
    
    #${name1}    Get Text    //table[@id="example"]/tbody/tr[1]/td[1]
    #log to console    ${name1}     
   
#To print all the names 
   # FOR    ${i}    IN RANGE    1    11
    #    ${name1}    Get Text    //table[@id="example"]/tbody/tr[${i}]/td[2]
     #   log to console    ${name1}
      #  Run Keyword If    '${name1}'=='Brielle Williamson'    Click Element    //table[@id="example"]/tbody/tr[6]/td[1]            
    #END
    
    