*** Settings ***
Library    Browser
Library    String
Library    squash_tf.TFParamService

*** Variables ***
#locators
${username_field}    //input[@name="username"]
${password_field}    //input[@name="password"]
${login_button}    //input[@name="signon"]
${logout_button}    //a[contains(text(),"Sign Out")]
${Account_button}    //a[@href="/actions/Account.action?editAccountForm="]
${language_select}    //select[@name="account.languagePreference"]
${account_title}    //*[@id="Catalog"]/form/h3[2]
${checkbox_enable_list}   //input[@name="account.listOption"]
${save_pref_button}    //input[@name="editAccount"]

*** Keywords ***
#test steps :
Load Squash Test Parameter Username
    [Arguments]             ${PARAM_NAME}
    ${PARAM1}=               Get Test Param              ${PARAM_NAME}
    Set Test Variable       ${PARAM1}
    Log To Console    ${PARAM1}
Load Squash Test Parameter Password
    [Arguments]             ${PARAM_NAME}
    ${PARAM2}=               Get Test Param              ${PARAM_NAME}
    Set Test Variable       ${PARAM2} 
    Log To Console    ${PARAM2}
I Can Logout
    ${logout_is_visible}    Get Element States    ${logout_button}    then    value & (visible | hidden)
    IF    ${logout_is_visible} == visible
        Click    ${logout_button}
    END
I Can Successfully Sign-in With Username ${PARAM1} Password ${PARAM2} And Submit
    ${console_login}    Get Attribute    ${login_button}    name
    Log To Console    +${console_login}
    Type Text    ${username_field}    ${PARAM1}
    Clear Text    ${password_field}
    Type Text    ${password_field}    ${PARAM2}
    Click    ${login_button}
    Get Text    ${logout_button}    validate    value == "Sign Out"

I Can Change My Account Settings
    Click    ${Account_button}
    Get Text    ${account_title}     validate    value == "Account Information"
    Select Options By    ${language_select}    value    japanese
    ${checkbox_enable_list_checked}     Get Checkbox State    ${checkbox_enable_list}     ==    checked
    IF    ${checkbox_enable_list_checked} == True
        UnCheck Checkbox    ${checkbox_enable_list}    
    END
    Click    ${save_pref_button}



    
