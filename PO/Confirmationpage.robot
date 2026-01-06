*** Settings ***
Documentation   All the page objects and keywords of landing page
Library     SeleniumLibrary
Resource    ../PO/resource.robot


*** Variables ***
${shopping_message}=     css:.nav-link.btn.btn-primary
${country_location}=    //a[text()='India']

*** Keywords ***
Enter the country
    [Arguments]  ${country_name}
    Input Text    country    ${country_name}
    Wait Until element passed is located on Page  //a[text()='${country_name}']
    Click Element    //a[text()='${country_name}']
    Sleep    2
    #Click Element    css.checkbox label
    Select Checkbox    xpath://label[@for='checkbox2']


Purchase the product and verify message
    Click Element    css.btn.btn-success.btn-lg
    Page Should Contain    Success!