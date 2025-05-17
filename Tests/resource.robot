*** Variables ***
${browser}      Chrome
${URL}        https://rahulshettyacademy.com/loginpagePractise/
*** Settings ***
Documentation    Login Testcase
Library    SeleniumLibrary

*** Keywords ***
Fill login
    [Arguments]    ${username}
    input text    id:username   yassir
    input password    id:password   test
    click button    signInBtn
Open url
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    &{prefs}=    Create Dictionary    credentials_enable_service=False    profile.password_manager_enabled=False
    Call Method    ${options}    add_experimental_option    prefs    ${prefs}
    Call Method    ${options}    add_argument    --disable-notifications
    Call Method    ${options}    add_argument    --disable-popup-blocking
    Call Method    ${options}    add_argument    --incognito
    Create WebDriver    Chrome    options=${options}
    Go To    ${URL}