*** Settings ***
Documentation     Validate login and checkout cards
Resource          ../PO/resource.robot
Resource        ../PO/LandingPage.robot
Resource        ../PO/Shoppage.robot
Resource        ../PO/Checkoutpage.robot
Resource        ../PO/Confirmationpage.robot
Library           SeleniumLibrary
Variables         C:/Users/AIFA USER 77/PycharmProjects/PythonProject1/customLibraries/Shop.py
Library           Collections
Library    XML
Test Setup        open the browser url
Test Teardown     Close browser sessions


*** Variables ***
# Variables like ${user_name}, ${valid}, ${invalid}, ${error_message},
# ${shopping_message} are assumed to be defined in resource.robot
@{listofitems}   Blackberry
${country_name}=    India


*** Test Cases ***


Validate unsuccessful login
   [Tags]   Smoke   Regression
   LandingPage.Fill the form    ${user_name}    ${invalid}
   LandingPage.wait until Element is located in the page
   LandingPage.Verify error message is correct

Validate cards display in checkout page
   [Tags]   Regression
   Set Selenium Speed    2seconds 
   Landingpage.Fill the form    ${user_name}    ${valid}
   #Shoppage.wait until Element is located in the page
   Shoppage.Verify Cards Titles In Shop Page

  #Shop.add items to cart and checkout        @{listofitems}
  Select the card     Blackberry
  Checkoutpage.Verify items in the checkout page and procced
  Confirmationpage.Enter the country    ${country_name}
  Confirmationpage.Purchase the product and verify message
   

Fill the login details
   Set Selenium Speed    2Seconds
   LandingPage.Fill the login details and select the user option


*** Keywords ***
Select the card
    [Arguments]     ${cardname}
     ${elements}=    Get WebElements    css:.card-title
     ${index}=  Set Variable    1
     FOR    ${element}    IN    @{elements}
         Exit For Loop If  '${cardname}'== '${element.text}'
                ${index}=  Evaluate   ${index}+1


      END
    Click Button    xpath:(//button[@class='btn btn-info'][normalize-space()='Add'])[${index}]
    Click Element    css:li.active a











