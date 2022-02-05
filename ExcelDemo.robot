*** Settings ***
Library           ExcelLibrary
Library           SeleniumLibrary
Resource          Commonusedkeywords.txt

*** Variables ***
@{Count1}
${Count}          ${EMPTY}
${Var1}           ${EMPTY}

*** Test Cases ***
ExcelTC_01
    Set Selenium Speed    1
    Open Browser    https://ngendigital.com/demo-application    chrome
    Maximize Browser Window
    Sleep    2
    Select Frame    id:iframe-05
    Wait Until Keyword Succeeds    1 min    5 s    Loginintoflightwithdatadriven
    Sleep    2
    [Teardown]    Close Browser

ReadExcelDemo
    ExcelLibrary.Open Excel    C:/Robot_projects/FirstRobot/DemoE.xls
    Check Cell Type    Sheet1    2    1
    ${Count}    Get Column Count    Sheet1
    @{Count1}    Get Column Values    Sheet1    2
    FOR    ${Var1}    IN    @{Count1}
        LOG    ${Var1}
    END
    ${Count}    Get Sheet Names
    ${Var1}    Read Cell Data By Coordinates    Sheet1    1    1
    ${Count}    Read Cell Data By Name    Sheet1    E2
    ${Count}    Get Row Count    Sheet1

Loginwithlibrary
    usernamelogin
