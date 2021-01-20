*** Settings ***
Library     DateTime
Library     SeleniumLibrary    
Library    OperatingSystem        



*** Test Cases ***
TC1_validcredential
    Log To Console    ${OUTPUT_DIR}${/}driver    # or \\ 
    Append To Environment Variable    path      ${OUTPUT_DIR}${/}driver
    Open Browser    url=https://www.jcpenney.com/   browser=ff
    Maximize Browser Window
    Set Selenium Implicit Wait    30s
    Click Element    id=searchInputId
    Input Text    id=searchInputId    Acdc Mens Crew Neck Short Sleeve Graphic T-Shirt
    Click Element    xpath=//button[@data-automation-id="searchIconBlock"]    
    Click Element    xpath=//button[text()='large']         
    Select From List By Label    name=quantity    2    
    Click Element    id=GlobalOptions-AddToCart    
    Run Keyword And Ignore Error    Click Element    id=MetricalCloseArea     # try closing popup for 30s and ignore if no popup
    Click Element    xpath=//button[@data-automation-id="at-panel-checkout-button"]    
   
    
    ${actualtitle}    Get Title  # store title in variable- actualvalue    
    Log To Console    ${actualtitle}    
    log    ${actualtitle}  # store in report      
    
    ${currenturl}    Get Location  # store url in variable currenturl
    Log To Console    ${currenturl}    
    log    ${currenturl}
    
    ${var}    Get Selected List Labels    xpath=//select[@data-automation-id="at-select-quantity"]
    Log To Console    ${var}    
    log    ${var}
    Click Element    xpath=//button[@data-automation-id="at-remove-item-link"]    