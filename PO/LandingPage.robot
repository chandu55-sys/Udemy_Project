*** Settings ***
Documentation   All the page objects and keywords of landing page
Library     SeleniumLibrary
Resource    ../PO/resource.robot

*** Variables ***
${Error_Message_Login}=   css:.alert-danger.col-md-12
*** Keywords ***

Fill the form
    [Arguments]    ${username}    ${password}
    Input Text     id:username    ${username}
    Input Text     id:password    ${password}
    Click Button   signInBtn
wait until Element is located in the page
    Wait Until element passed is located on Page    ${Error_Message_Login}


Verify error message is correct
    ${result}=    Get Text    ${error_message}
    Should Be Equal As Strings    ${result}    Incorrect username/password.
    Element Text Should Be       ${error_message}    Incorrect username/password.

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
