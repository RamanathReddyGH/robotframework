*** Settings ***
Test Teardown
Library           SeleniumLibrary
Library           ExcelLibrary
Resource          CommonKeywords.txt
Resource          ExcelDataFetch.txt

*** Test Cases ***
TC_01_LoginScreen_Objects_on_page
    Loginandnavigatetourl
    Changetoiframe
    Objectsonthewebpage
    [Teardown]    Close Browser

TC02_Loginscreen_defaultforusernameandpassword
    Loginandnavigatetourl
    Changetoiframe
    Defaultvalueusernamepassword
    [Teardown]    Close Browser

TC_03_User_doesnot enter email
    Set Selenium Speed    0.5
    Loginandnavigatetourl
    Changetoiframe
    Emptyusername

TC_04_userdoesnotenterpassword
    Loginandnavigatetourl
    Changetoiframe
    Emptypassword

TC_05_userdoesnotenteremailandpassword
    Loginandnavigatetourl
    Changetoiframe
    Emptyusernameandpassword

TC_06_usersentersinvalidemailformats
    Loginandnavigatetourl
    Changetoiframe
    Invalidemailformats

TC07
    Load Excel Data    Sheet1    TC07    Username

TC_07_userlogsinwithvalidusernameandpassword
    Loginandnavigatetourl
    Changetoiframe
    Login
    Changetoiframe1
    Objectsontheloginpage
    validationonmanagebooking
    Validatefromcity
    Logout
