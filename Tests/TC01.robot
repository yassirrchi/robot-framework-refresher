*** Variables ***
${wrr_selector}     css:.alert-danger
${browser}      Chrome
${URL}        https://rahulshettyacademy.com/loginpagePractise/
*** Settings ***
Documentation    Login Testcase
Library    SeleniumLibrary
Library    Collections
Suite Setup    Log    grat

*** Test Cases ***
Validate cart page in shopping
    Validate login functionality
    Fill login
    Wait for element is visible     css:.nav-link
    Verify Card elements title
    Select card     iphone X

*** Keywords ***
Validate login functionality
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    &{prefs}=    Create Dictionary    credentials_enable_service=False    profile.password_manager_enabled=False
    Call Method    ${options}    add_experimental_option    prefs    ${prefs}
    Call Method    ${options}    add_argument    --disable-notifications
    Call Method    ${options}    add_argument    --disable-popup-blocking
    Call Method    ${options}    add_argument    --incognito
    Create WebDriver    Chrome    options=${options}
    Go To    ${URL}
    Maximize Browser Window
Fill login
    input text    id:username   rahulshettyacademy
    input password    id:password   learning
    click button    signInBtn
Waiting for error box
    wait until element is visible   ${wrr_selector}
Verify error
    ${Result}=  get text    ${wrr_selector}
    should be equal as strings    ${Result}  Incorrect username/password.
*** Keywords ***
Wait for element is visible
    [Arguments]    ${element}
    Wait Until Element Is Visible    ${element}
Verify Card Elements Title
    @{expectedList} =    Create List    iphone X    Samsung Note 8    Nokia Edge    Blackberry
    @{elements} =    Get WebElements    css:.card-title

    @{actualList} =    Create List
    FOR    ${element}    IN    @{elements}
        ${text}=    Get Text    ${element}
        Append To List    ${actualList}    ${text}
        log to console    ${element.text}
    END

    Lists Should Be Equal    ${expectedList}    ${actualList}
Select card
    [Arguments]     ${cardtitle}
    ${index}=    set variable    1
    log to console      ${cardtitle}
    log to console      ${index}
    @{elements} =    Get WebElements    css:.card-title

    FOR     ${element}  IN      @{elements}
        log to console    ${cardtitle}

        exit for loop if    '${element.text}'=='${cardtitle}'
        ${index}=   evaluate    ${index}+1
    END

    click button    xpath:(//button[@class='btn btn-info'][normalize-space()='Add'])[${index}]
    click button    xpath:(//a[@class='nav-link btn btn-primary'])
    Sleep    10s    # Just to demonstrate
    git commit -m "⚡️ been a while 7sudo"