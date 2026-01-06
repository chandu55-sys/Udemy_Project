*** Settings ***
Documentation   validate login
Library    SeleniumLibrary
Test Template     validate unsuccesful Login
Test Teardown    Close Browser


*** Variables ***
${error_message}=   css:.alert-danger.col-md-12



*** Test Cases ***  username    password
invalid username    rahul   learning

invalid password    rahulshettyac  learning

special character   @chal   @pl

*** Keywords ***
validate unsuccesful Login
    [Tags]   Smoke
    [Arguments]  ${username}    ${password}
    open the browser with the mortgage payment url
    Fill the form   ${username}    ${password}
    wait until it checks error message
    verify error message is correct

open the browser with the mortgage payment url
    Open Browser    https://rahulshettyacademy.com/loginpagePractise/    chrome
Fill the form
    [Arguments]    ${username}    ${password}
    Input Text     id:username    ${username}
    Input Text     id:password    ${password}
    Click Button   signInBtn

wait until it checks error message
    Wait Until Element Is Visible    ${error_message}

verify error message is correct
    ${result}=  Get Text    ${error_message}
    Should Be Equal As Strings    ${result}    Incorrect username/password.
    Element Text Should Be    ${error_message}    Incorrect username/password.



