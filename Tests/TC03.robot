*** Settings ***
Library           SeleniumLibrary
Library           DataDriver    file=Resource/data.csv
Test Template     Login With Credentials

*** Test Cases ***
Login test with ${username} and ${password}     yassir  passew

*** Keywords ***
Login With Credentials
    [Arguments]    ${username}    ${password}
    Log To Console    \nUSERNAME: ${username}
    Log To Console    PASSWORD: ${password}