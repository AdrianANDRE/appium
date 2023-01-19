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
${Fish_category}    //img[@src="../images/fish_icon.gif"]
${Angelfish_category}    //a[@href="/actions/Catalog.action?viewProduct=&productId=FI-SW-01"]
${Large_Angelfish_category}    //a[@href="/actions/Cart.action?addItemToCart=&workingItemId=EST-1"]
${Quantity_field}    //input[@size="3"]    

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
        Click    ${logout_button}
        
I Can Successfully Sign-in With Username ${PARAM1} Password ${PARAM2} And Submit
    ${console_login}    Get Attribute    ${login_button}    name
    Log To Console    +${console_login}
    Type Text    ${username_field}    ${PARAM1}
    Clear Text    ${password_field}
    Type Text    ${password_field}    ${PARAM2}
    Click    ${login_button}
    ${logout_checked}    Get Text    ${logout_button}
    Should Be Equal    ${logout_checked}    Sign Out

I Can Successfully Sign-in With Username j2ee Password j2ee And Submit
    ${console_login}    Get Attribute    ${login_button}    name
    Log To Console    +${console_login}
    Type Text    ${username_field}    j2ee
    Clear Text    ${password_field}
    Type Text    ${password_field}    j2ee
    Click    ${login_button}
    ${logout_checked}    Get Text    ${logout_button}
    Should Be Equal    ${logout_checked}    Sign Out  

I Can Choose A Product In The Fish List
    Click    ${Fish_category}
    ${Page_Fish_verif}    Get Text    //h2
    Should Be Equal    ${Page_Fish_verif}    Fish
    Click    ${Angelfish_category} 
    ${Page_AngelFish_verif}    Get Text    //h2
    Should Be Equal    ${Page_AngelFish_verif}    Angelfish

I Can Add To Cart Large Angelfish
    Click    ${Large_Angelfish_category}
    ${Page_Cart_verif}    Get Text    //h2
    Should Be Equal    ${Page_Cart_verif}     Shopping Cart
    ${Article_verif}    Get Attribute    ${Quantity_field}    name
    ${Number_verif}    Get Attribute    ${Quantity_field}    value
    Should Be Equal    ${Article_verif}    EST-1
    Should Be Equal    ${Number_verif}    1
    

    
