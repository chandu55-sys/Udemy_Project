*** Settings ***
Documentation   validate login
Library    SeleniumLibrary

*** Variables ***
${error_message}=   css:.alert-danger.col-md-12
${shopping_message}=     css:.nav-link.btn.btn-primary
${user_name}=    rahulshettyacademy
${invalid}=     12345
${valid}=   learning
${url}=     https://rahulshettyacademy.com/loginpagePractise/
${browser_name}=    chrome
*** Keywords ***
open the browser url
    Open Browser    ${url}   ${browser_name}
open the browser with the mortgage payment url
    Open Browser    https://rahulshettyacademy.com/loginpagePractise/    chrome

close browser sessions
    Close Browser

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
Wait Until element passed is located on Page
    [arguments]         ${page_locator}
    Wait Until Element Is Visible        ${page_locator}        timeout=10
