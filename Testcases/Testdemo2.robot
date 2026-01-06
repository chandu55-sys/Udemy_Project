*** Settings ***
Documentation     Validate login and checkout cards
Resource          ../PO/resource.robot
Library           SeleniumLibrary
Library           Collections
Library    XML
Test Setup        Open the browser with the mortgage payment url
#Test Teardown     Close browser sessions


*** Variables ***
# Variables like ${user_name}, ${valid}, ${invalid}, ${error_message},
# ${shopping_message} are assumed to be defined in resource.robot


*** Test Cases ***

#Validate unsuccessful login
   # Fill the form    ${user_name}    ${invalid}
   # Wait until message is appear in message    ${error_message}
   # Verify error message is correct

#Validate cards display in checkout page
  ##  Fill the form    ${user_name}    ${valid}
   # Wait until message is appear in message    ${shopping_message}
   # Verify Cards Titles In Shop Page
   # Select the card     Blackberry

Fill the login details
    Set Selenium Speed    2Seconds
    Fill the login details and select the user option


*** Keywords ***

Fill the form
    [Arguments]    ${username}    ${password}
    Input Text     id:username    ${username}
    Input Text     id:password    ${password}
    Click Button   signInBtn

Wait until it checks error message
    Wait Until Element Is Visible    ${error_message}

Wait until message is appear in message
    [Arguments]    ${element}
    Wait Until Element Is Visible    ${element}

Verify error message is correct
    ${result}=    Get Text    ${error_message}
    Should Be Equal As Strings    ${result}    Incorrect username/password.
    Element Text Should Be       ${error_message}    Incorrect username/password.

Verify Cards Titles In Shop Page

    @{expectedlist}=    Create List    iphone X    Samsung Note 8    Nokia Edge    Blackberry

    ${elements}=    Get WebElements    css:.card-title

    @{actual_list}=    Create List
    FOR    ${element}    IN    @{elements}
        Log    ${element.text}
        Append To List    ${actual_list}    ${element.text}

    END
Select the card
    [Arguments]     ${cardname}
     ${elements}=    Get WebElements    css:.card-title
     ${index}=  Set Variable    1
     FOR    ${element}    IN    @{elements}
         Exit For Loop If  '${cardname}'== '${element.text}'
                ${index}=  Evaluate   ${index}+1


      END
    Click Button    xpath:(//button[@class='btn btn-info'][normalize-space()='Add'])[${index}]

Fill the login details and select the user option
    Input Text     id:username  rahulshettyacademy
    Input Text     id:password   learning
    Wait Until Element Is Visible    xpath:(//label[@class='customradio'])[2]
    Click Element    xpath:(//label[@class='customradio'])[2]

    Wait Until Element Is Visible    css:.modal-body
    Click Element    id:okayBtn
    Wait Until Element Is Not Visible   css:.modal-body
    Select From List By Value       css:select.form-control       teach
    Select Checkbox      xpath:(//input[@id='terms'])[1]
    Checkbox Should Be Selected     terms
   # Click Button   signInBtn



