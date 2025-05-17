*** Variables ***
${wrr_selector}     css:.alert-danger
${browser}      Chrome
${URL}        https://rahulshettyacademy.com/loginpagePractise/

*** Settings ***
Documentation    Login Testcase
Library    SeleniumLibrary
Library    Collections
Suite Setup    Log    grat
Resource    resource.robot
Library     Collections
Test Setup    Open url
Library    BuiltIn

*** Test Cases ***
Validate cart page in shopping
    visit the other
    verify that user has switched to the new window
    Grab email test

*** Keywords ***
visit the other
    click element    css:.blinkingText
    log to console    tesssssssssssssssss
    Sleep       5
verify that user has switched to the new window
    SWITCH WINDOW    NEW
    element text should be    css:h1    DOCUMENTS REQUEST
Grab email test
    log to console    hereeee
    ${text}=    get text    css:.red
    @{textiwant}=    Split String    some text to split    delimiter

    log to console    ${text}
