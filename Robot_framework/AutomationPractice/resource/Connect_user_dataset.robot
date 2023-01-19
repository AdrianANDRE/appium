*** Settings ***
Library    Browser
Library    String
Library    squash_tf.TFParamService
Resource    ../Page_object/home_page.robot    
Resource    ../Page_object/authentification_page.robot

*** Keywords ***
#test steps :
Load Squash Test Parameter Mail
    [Arguments]             ${PARAM_NAME}
    ${PARAM1}=               Get Test Param              ${PARAM_NAME}
    Set Test Variable       ${PARAM1} 
Load Squash Test Parameter Password
    [Arguments]             ${PARAM_NAME} 
    ${PARAM2}=               Get Test Param              ${PARAM_NAME}
    Set Test Variable       ${PARAM2} 
I go To The SignIn Page
    Wait For Elements State    ${home_signin_button}    visible    30
    Wait For Elements State    ${home_signin_button}    enabled    30
    Focus    ${home_signin_button}
    Click    ${home_signin_button}
    
I Can Successfully Sign-in With Email ${PARAM1} Password ${PARAM2} And Submit
    Wait For Elements State    ${log_signin_email_field}    visible    30
    Wait For Elements State    ${log_signin_email_field}    enabled    30   
    Type Text    ${log_signin_email_field}    ${PARAM1}
    Wait For Elements State    ${log_signin_password_field}    visible    30
    Wait For Elements State    ${log_signin_password_field}    enabled    30 
    Type Text    ${log_signin_password_field}    ${PARAM2}
    Click    ${log_signin_button}


    
