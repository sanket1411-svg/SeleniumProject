*** Settings ***
Library     DateTime
Library     SeleniumLibrary    
Library    OperatingSystem        



*** Test Cases ***
TC1_validcredential
    Log To Console    ${OUTPUT_DIR}${/}driver    # or \\ 
    Append To Environment Variable    path      ${OUTPUT_DIR}${/}driver
    Open Browser    url=https://netbanking.hdfcbank.com/netbanking/   browser=ff
    Maximize Browser Window
    Set Selenium Implicit Wait    30s
    Select Frame    name=login_page            #in some cases if input not accessiblr 
    Input Text    name=fldLoginUserId    test123
    Click Element    xpath=//img[@src="/gif/continue_new1.gif?v=1"]    
    Input Password    name=fldPassword    pass    
    Unselect Frame                             #always required to come out of frame
    Close Browser