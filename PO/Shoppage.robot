*** Settings ***
Documentation   All the page objects and keywords of landing page
Library     SeleniumLibrary
Resource    ../PO/resource.robot


*** Variables ***
${shopping_message}=     css:.nav-link.btn.btn-primary

*** Keywords ***
wait until Element is located in the page
    Wait Until element passed is located on Page   ${shopping_message}

Verify Cards Titles In Shop Page

    @{expectedlist}=    Create List    iphone X    Samsung Note 8    Nokia Edge    Blackberry

    ${elements}=    Get WebElements    css:.card-title

    @{actual_list}=    Create List
    FOR    ${element}    IN    @{elements}
        Log    ${element.text}
        Append To List    ${actual_list}    ${element.text}

    END