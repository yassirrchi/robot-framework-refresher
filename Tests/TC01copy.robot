*** Variables ***
${wrr_selector}     css:.alert-danger
${browser}      Chrome
*** Settings ***
Documentation    Login Testcase
Library    SeleniumLibrary
Suite Setup    Log    grat
Resource        resource.robot

*** Test Cases ***
doing this test case
    Validate login functionality
    Fill login
    Waiting for error box
    Verify error
*** Keywords ***
Validate login functionality
    create webdriver    ${Browser}
    go to    https://rahulshettyacademy.com/loginpagePractise/
Waiting for error box
    wait until element is visible   ${wrr_selector}
Verify error
    ${Result}=  get text    ${wrr_selector}
    should be equal as strings    ${Result}  Incorrect username/password.
