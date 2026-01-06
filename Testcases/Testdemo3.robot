*** Settings ***
Documentation     Validate login and checkout cards
Resource          ../PO/resource.robot
Library           SeleniumLibrary
Library           Collections
Library    XML
Library    String
Test Setup        Open the browser with the mortgage payment url
#Test Teardown     Close browser sessions


*** Variables ***
# Variables like ${user_name}, ${valid}, ${invalid}, ${error_message},
# ${shopping_message} are assumed to be defined in resource.robot


*** Test Cases ***


Validate the child window functionality
    Select the link on child window
    Verify the user to switch child window
    Grab the text in child window
    Get email id and retrun main window





*** Keywords ***

Select the link on child window
    Click Element    css:.blinkingText
    Sleep    2

Verify the user to switch child window
    Switch Window    NEW
    SeleniumLibrary.Element Text Should Be    css:h2    DOCUMENTS REQUEST
Grab the text in child window
    ${rtext}=       Get Text    css:.im-para.red
    @{words}=    Split String    ${rtext}    at
    ${text_split}=    Get From List    ${words}    1
    Log    ${text_split}
    @{words_2}=    Split String    ${text_split}
    ${email}=    Get From List    ${words_2}    0
    Log    ${email}
    Set Global Variable    ${email}

Get email id and retrun main window
    Switch Window   MAIN
    Title Should Be    LoginPage Practise | Rahul Shetty Academy
    Input Text    id:username    ${email}


