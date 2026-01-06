*** Settings ***
Documentation     Validate unsuccessful login using DataDriver
Library           SeleniumLibrary
Library           DataDriver    file=resources/Data.csv    encoding=utf-8
Test Template     Validate Unsuccessful Login
Test Teardown     Close Browser

*** Variables ***
${error_message}=    css:.alert-danger.col-md-12

*** Test Cases ***
Invalid Login Using ${username} and ${password}

*** Keywords ***
Validate Unsuccessful Login
    [Arguments]    ${username}    ${password}
    Open Browser To Login Page
    Fill Login Form    ${username}    ${password}
    Wait Until Error Message
    Verify Error Message

Open Browser To Login Page
    Open Browser    https://rahulshettyacademy.com/loginpagePractise/    chrome
    Maximize Browser Window

Fill Login Form
    [Arguments]    ${username}    ${password}
    Input Text    id:username    ${username}
    Input Text    id:password    ${password}
    Click Button    signInBtn

Wait Until Error Message
    Wait Until Element Is Visible    ${error_message}    timeout=10s

Verify Error Message
    Element Text Should Be    ${error_message}    Incorrect username/password.
