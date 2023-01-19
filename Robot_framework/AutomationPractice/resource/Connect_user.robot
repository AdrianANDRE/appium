*** Settings ***
Library    Browser
Library    String
Resource    ../Page_object/home_page.robot    
Resource    ../Page_object/authentification_page.robot

*** Variables ***
${mail}    abc+89@gmail.com
${password}    jules

*** Keywords ***
#test steps :
I Go To The SignIn Page
    Wait For Elements State    ${home_signin_button}    visible    10
    Click    ${home_signin_button}
    Wait For Elements State    ${log_signin_button}    visible    10
I Can Successfully Sign-in With Email ${mail} Password ${password} And Submit
    Type Text    ${log_signin_email_field}    ${mail}
    Type Text    ${log_signin_password_field}    ${password}
    Click    ${log_signin_button}    force=True
