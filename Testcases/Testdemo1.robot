*** Settings ***
Documentation   validate login
Library    SeleniumLibrary
Test Teardown    Close Browser


*** Variables ***
${error_message}=   css:.alert-danger.col-md-12



*** Test Cases ***
validate unsuccesful Login
    open the browser with the mortgage payment url
    Fill the form
    wait until it checks error message
    verify error message is correct


*** Keywords ***
open the browser with the mortgage payment url
    Open Browser    https://rahulshettyacademy.com/loginpagePractise/    chrome
Fill the form
    Input Text    id:username   rahulshettyacademy
    Input Text    id:password    12345
    Click Button    signInBtn

wait until it checks error message
    Wait Until Element Is Visible    ${error_message}

verify error message is correct
    ${result}=  Get Text    ${error_message}
    Should Be Equal As Strings    ${result}    Incorrect username/password.
    Element Text Should Be    ${error_message}    Incorrect username/password.



