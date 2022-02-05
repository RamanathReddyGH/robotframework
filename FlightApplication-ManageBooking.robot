*** Settings ***
Library           SeleniumLibrary
Library           ExcelLibrary
Resource          CommonKeywords.txt
Resource          ExcelDataFetch.txt

*** Test Cases ***
TC01_Book a flight-RoundtripbetweentoandfromDestinations_verify'From'cities
    Loginandnavigatetourl
    Changetoiframe
    Login
    Changetoiframe1
    Objectsontheloginpage
    validationonmanagebooking
    Validatefromcity
    Logout

TC02_Book a flight-RoundtripbetweentoandfromDestinations_verify'to'cities
    Loginandnavigatetourl
    Changetoiframe
    Objectsonthewebpage
    Login
    Changetoiframe1
    Objectsontheloginpage
    validationonmanagebooking
    Validatetocity
    Logout
    Close Browser

TC03_Book a flight-RoundtripbetweentoandfromDestinations_verify 'class'
    Loginandnavigatetourl
    Changetoiframe
    Objectsonthewebpage
    Login
    Changetoiframe1
    Objectsontheloginpage
    validationonmanagebooking
    validateclass
    Logout

TC_04_BookaFlight-VerifyRadioButtonShouldNotBeSelectByDefault
    Loginandnavigatetourl
    Changetoiframe
    Objectsonthewebpage
    Login
    Changetoiframe1
    Objectsontheloginpage
    validationonmanagebooking
    RadiobuttonValidation
    Logout

TC_05_BOOKaFlight-OneWayTripBetweenToAndFromDestinations_FromTorontoToParisEconomy
    Loginandnavigatetourl
    Changetoiframe
    Objectsonthewebpage
    Login
    Changetoiframe1
    Objectsontheloginpage
    validationonmanagebooking
    BookEconomyFlight
    changetoframe2
    Logout

TC_06_NewyorkToMumbai
    Loginandnavigatetourl
    Changetoiframe
    Objectsonthewebpage
    Login
    Changetoiframe1
    Objectsontheloginpage
    validationonmanagebooking
    BookEconomy
    changetoframe2
    Logout

TC_08-SelectEitherFlight/Hotel
    Loginandnavigatetourl
    Changetoiframe
    Objectsonthewebpage
    Login
    Changetoiframe1
    Objectsontheloginpage
    validationonmanagebooking
    Click Button    xpath://button[contains(text(),'Get Fare')]
    Page Should Contain    Please choose one of Flight or Flight + Hotel!
    Changetoiframe1
    Sleep    2
    Logout
