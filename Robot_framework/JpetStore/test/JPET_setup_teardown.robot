*** Settings ***
Library    Browser
Library    squash_tf.TFParamService

*** Variables ***
#global :
${TEST SETUP}    Open Application
${TEST TEARDOWN}    Close Application
${url_home}    https://petstore.octoperf.com/actions/Order.action?newOrderForm=

*** Keywords ***
#set up
Open Application
    ${browser} =	Get Test Param	DS_browser
    New Browser    browser=${browser}
    New Page    url=${url_home} 

#tear down :
Test Has Failed
    Take Screenshot    selector=text=Login

Close Application    
    Run Keyword If Test Failed    Test Has Failed
    Close Browser
