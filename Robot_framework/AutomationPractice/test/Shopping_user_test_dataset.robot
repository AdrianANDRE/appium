*** Settings ***
Documentation    User login and shopping cart test on automationpractice with variables in test, Browser in dataset in Squash
Library    Browser
Library    squash_tf.TFParamService
Resource	Shopping_user_test_dataset_ressources.robot
Resource    ../Page_object/account_page.robot


*** Keywords ***
Test Setup
    Set Test Variable    ${url_home}    http://automationpractice.com/index.php

	${__TEST_SETUP}	Get Variable Value	${TEST SETUP}
    Run Keyword If	$__TEST_SETUP is not None	${__TEST_SETUP}

Test Teardown
	${__TEST_TEARDOWN}	Get Variable Value	${TEST TEARDOWN}
    Run Keyword If	$__TEST_TEARDOWN is not None	${__TEST_TEARDOWN}

*** Test Cases ***
Shopping User Test
    Load Squash Test Parameter Mail        DS_mail
    Load Squash Test Parameter Password        DS_password
	[Setup]    Test Setup              
    I Am On The Home Page
    I Go To The SignIn Page
    I Am On The Authentification Page
    I Can Successfully Sign-in With Email ${PARAM1} Password ${PARAM2} And Submit
    I Am On The Account Page
    I Am Connected As Jules Grisel
    I Go To Summer Dresses Page
    I Apply The Filter Size "S" On The Articles
    I Sort The Dresses Items By Ascending Price
    I Select "print summer dress" Article
    I Verify The Number Of Product 1
    I Proceed To Checkout
    I Verify The Shopping Cart
    I Add The Same Product In The Cart
	[Teardown]	Test Teardown
