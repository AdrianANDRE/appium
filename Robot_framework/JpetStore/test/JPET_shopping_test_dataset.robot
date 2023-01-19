*** Settings ***
Documentation    Shopping cart test on JPETSTORE with dataset in Squash, Browser in dataset in Squash
Library    Browser
Library    squash_tf.TFParamService
Resource	JPET_shopping_resources_dataset .robot

*** Keywords ***
Test Setup
    Set Test Variable    ${url_home}    https://petstore.octoperf.com/actions/Order.action?newOrderForm=
    ${__TEST_SETUP}	Get Variable Value	${TEST SETUP}
    Run Keyword If	$__TEST_SETUP is not None	${__TEST_SETUP}

Test Teardown
    ${__TEST_TEARDOWN}	Get Variable Value	${TEST TEARDOWN}
    Run Keyword If	$__TEST_TEARDOWN is not None	${__TEST_TEARDOWN}

*** Test Cases ***
Shopping Cart Test
    Load Squash Test Parameter Username        DS_username
    Load Squash Test Parameter Password        DS_password
    [Setup]    Test Setup        
    I Can Successfully Sign-in With Username ${PARAM1} Password ${PARAM2} And Submit
    I Can Choose A Product In The Fish List
    I Can Add To Cart Large Angelfish
    I Can Logout
    [Teardown]	Test Teardown
