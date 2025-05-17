*** Variables ***
${browser}      Chrome
*** Settings ***
Documentation    Login Testcase
Library    SeleniumLibrary

*** Keywords ***
Fill login
    [Arguments]    ${username}
    input text    id:username   yassir
    input password    id:password   test
    click button    signInBtn
