*** Settings ***
Resource          Userdefinedkeywords.txt    # This is a demo resource
Library           SeleniumLibrary
Library           ExcelLibrary
Resource          Commonusedkeywords.txt

*** Variables ***
@{Cities}
${City}           ${EMPTY}
${Textfield}      ${EMPTY}

*** Test Cases ***
TC_01
    [Tags]    Login
    Open Browser    https://www.facebook.com/    chrome
    Maximize Browser Window
    Sleep    2
    Page Should Contain Textfield    id:email    it failed    warn
    Input Text    css=#email    Selenium
    Sleep    2
    Textfield Should Contain    id:email    Selenium
    Sleep    2
    Clear Element Text    id:email
    Sleep    2
    Wait Until Element Is Visible    xpath=//*[@role='button']
    Click Link    xpath=//*[@role='button']
    Sleep    4
    [Teardown]    Close Browser

TC_02
    Open Browser    https://www.amazon.in/    chrome
    Maximize Browser Window
    Sleep    2
    Page Should Contain List    css:#searchDropdownBox
    Sleep    2
    @{Cities}    Get List Items    css:#searchDropdownBox
    FOR    ${City}    IN    @{Cities}
        LOG    ${City}
    END
    Sleep    4
    List Selection Should Be    css:#searchDropdownBox    All Categories
    Sleep    2
    Select From List By Index    css:#searchDropdownBox    3
    Sleep    2
    Select From List    css:#searchDropdownBox    Amazon Pharmacy
    Sleep    2
    [Teardown]    Close Browser

TC_03
    Open Browser    https://www.amazon.in/    chrome
    Maximize Browser Window
    Assign Id To Element    id:twotabsearchtextbox    pm
    Input Text    pm    mobile
    Element Attribute Value Should Be    xpath://*[@id="nav-logo-sprites"]    id    nav-logo-sprites
    Capture Page Screenshot
    Open Browser    https://ngendigital.com/demo-application    chrome
    Maximize Browser Window
    Select Frame    id:iframe-05
    Current Frame Should Contain    My Account

TC_04
    Open Browser    https://the-internet.herokuapp.com/iframe    Chrome
    Wait Until Element Is Visible    css:[role="menubar"]    timeout=5
    Select Frame    id:mce_0_ifr
    Click Element    id:tinymce
    Clear Element Text    id:tinymce
    Input Text    id:tinymce    Input from Robot Framework Test
    Element Text Should Be    id:tinymce    Input from Robot Framework Test
    Close Browser

FlightApplication
    Open Browser    https://ngendigital.com/demo-application    chrome
    Maximize Browser Window
    Sleep    2
    Select Frame    id:iframe-05
    Sleep    2
    Logintoflightapplication    support@ngendigital.com    abc123
    Sleep    2
    [Teardown]    Close Browser

TableExample
    [Template]
    Open Browser    https://www.techlistic.com/p/demo-selenium-practice.html    chrome
    Maximize Browser Window
    Page Should Contain Element    xpath=//*[@id="customers"]    Table not found    info
    Table Should Contain    xpath=//*[@id="customers"]    Company
    Sleep    2
    Table Cell Should Contain    xpath=//*[@id="customers"] \    5    3    UK
    Sleep    2
    Table Column Should Contain    xpath=//*[@id="customers"]    1    Meta
    Table Row Should Contain    xpath=//*[@id="customers"]    5    Helen Bennett
    ${Textfield}    Get Text    xpath://*[@id="customers"]/tbody/tr[6]/td[1]
    Log To Console    ${Textfield}
    Should Be Equal As Strings    ${Textfield}    Adobe
    Sleep    2
    [Teardown]    Close Browser
