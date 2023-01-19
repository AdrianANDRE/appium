*** Settings ***
Library    Browser

*** Variables ***
#locators
${home_h1_title}    //*[contains(text(), "Automation Practice Website")]
${home_signin_button}    //a[@class="login"]
${Women_tab}    //a[@title="Women"]

*** Keywords ***
I Am On The Home Page
    Wait For Elements State    //h1    visible    5
    Get Text    //h1    ==   Automation Practice Website
I Go To The Women Navigation Page
    Click    ${Women_tab}        