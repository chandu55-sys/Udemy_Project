*** Settings ***
Documentation   All the page objects and keywords of landing page
Library     SeleniumLibrary
Resource    ../PO/resource.robot


*** Variables ***
${shopping_message}=     css:.nav-link.btn.btn-primary

*** Keywords ***
Verify items in the checkout page and procced
    Click Element    css:.btn.btn-success