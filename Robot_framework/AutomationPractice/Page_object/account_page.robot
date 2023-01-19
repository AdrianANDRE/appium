** Settings ***
Library    Browser
Library    Collections


*** Variables ***
#locators
${customer_account_button}    //span[contains(text(),"Jules grisel")]
${acc_signout_button}    //a[@class="logout"]
${DRESSES_ITEM}    css=#block_top_menu > ul > li:nth-child(2) > a
${SUMMER_DRESSES_ITEM}    css=#block_top_menu > ul > li:nth-child(2) > ul > li:nth-child(3) > a

*** Keywords ***
I Am On The Account Page
    Wait For Elements State    ${acc_signout_button}    visible    2
    Get Title    ==    My account - My Store
I Am Connected As Jules Grisel
    Get Text    ${customer_account_button}    ==    Jules grisel
    