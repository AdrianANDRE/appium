*** Settings ***
Library    Browser
Library    String
Library    squash_tf.TFParamService
Resource    ../Page_object/home_page.robot    
Resource    ../Page_object/authentification_page.robot
Resource    ../Page_object/account_page.robot
Resource    ../Page_object/women_page.robot
Resource    ../Page_object/alert_checkout_page.robot
Resource    ../Page_object/shopping_cart_summary_page.robot

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
I Go To The SignIn Page
    Wait For Elements State    ${home_signin_button}    visible    30
    Wait For Elements State    ${home_signin_button}    enabled    30
    Scroll To Element    ${home_signin_button}
    Click    ${home_signin_button}
    
I Can Successfully Sign-in With Email ${PARAM1} Password ${PARAM2} And Submit
    Wait For Elements State    ${log_signin_email_field}    visible    30
    Wait For Elements State    ${log_signin_email_field}    enabled    30   
    Type Text    ${log_signin_email_field}    ${PARAM1}
    Wait For Elements State    ${log_signin_password_field}    visible    30
    Wait For Elements State    ${log_signin_password_field}    enabled    30 
    Type Text    ${log_signin_password_field}    ${PARAM2}
    Click    ${log_signin_button}
I Can Successfully Sign-in With Email grisel.jules@gmail.com Password jules And Submit
    Wait For Elements State    ${log_signin_email_field}    visible    30
    Wait For Elements State    ${log_signin_email_field}    enabled    30   
    Type Text    ${log_signin_email_field}    grisel.jules@gmail.com
    Wait For Elements State    ${log_signin_password_field}    visible    30
    Wait For Elements State    ${log_signin_password_field}    enabled    30 
    Type Text    ${log_signin_password_field}    jules
    Click    ${log_signin_button}

I Go To Summer Dresses Page
    Focus    ${DRESSES_ITEM}
    Click    ${SUMMER_DRESSES_ITEM}

I Apply The Filter Size "S" On The Articles 
    ${size_S_ischecked}    Get Checkbox State    ${women_checkbox_size_S}    ==    unchecked
    IF    ${size_S_ischecked} == False
        Check Checkbox    ${women_checkbox_size_S}
    END 
I Sort The Dresses Items By Ascending Price
    Select Options By    ${women_sort_by_select}    value    price:asc
    Sleep    4
    ${verif_nb_produit}    Browser.Get Text    ${Number_product}
    Should Be Equal    ${verif_nb_produit}    There are 3 products.

I Select "print summer dress" Article
    Focus    ${Print_summer_dress_article}
    Mouse Move Relative To    ${Print_summer_dress_article}
    Click    ${ADD_to_cart_button_dress}
I Verify The Number Of Product ${number_product}
    Wait For Elements State    ${text_number_product}    visible    20
    ${verif_number_checkout}    Get Text    ${text_number_product}
    Should Be Equal    ${verif_number_checkout}    There is ${number_product} item in your cart.
    ${verif_chechout}    Get Text    ${Product_success_add_alert}
    Should Be Equal    ${verif_chechout}    Product successfully added to your shopping cart

I Proceed To Checkout
    Click    ${proceed_checkout_button}

I Verify The Shopping Cart
    ${verif_page_cart}    Get Text    ${title_shopping_cart_page}
    Should Be Equal    ${verif_page_cart}    Your shopping cart
I Add The Same Product In The Cart
    Wait For Elements State    ${add_product_button}    visible
    Click    ${add_product_button}
    Sleep    2
    ${verif_cart_number_product}    Get Text   ${cart_number_product}
    Should Be Equal    ${verif_cart_number_product}    2 Products

        
    


    


    
