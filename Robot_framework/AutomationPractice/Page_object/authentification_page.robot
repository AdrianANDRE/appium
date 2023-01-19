*** Settings ***
Library    Browser
Library    Collections


*** Variables ***
#locators
${log_create_account_button}    //button[@id="SubmitCreate"]
${log_signin_button}    //button[@id="SubmitLogin"]
${log_signin_email_field}    //*[@id="email"]
${log_signin_password_field}    //*[@id="passwd"]

*** Keywords ***
I Am On The Authentification Page
    Get Title    ==    Login - My Store    

