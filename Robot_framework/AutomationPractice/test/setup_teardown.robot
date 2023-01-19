*** Settings ***
Documentation    SETUP and TEARDOWN for robot test with browser in dataset in Squash
Library    Browser
Library    squash_tf.TFParamService

*** Variables ***
#global :
${TEST SETUP}    Open Application
${TEST TEARDOWN}    Close Application
${url_home}    http://automationpractice.com/index.php

*** Keywords ***
#set up
Open Application
    ${browser} =	Get Test Param	DS_browser
    New Browser    browser=${browser}   headless=True
    New Page    url=${url_home}
    Set Viewport Size    1800    1000

#tear down :
Test Has Failed
    Take Screenshot    fullPage=True   

Close Application    
    Run Keyword If Test Failed    Test Has Failed
    Close Browser
