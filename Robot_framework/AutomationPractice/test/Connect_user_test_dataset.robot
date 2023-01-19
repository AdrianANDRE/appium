*** Settings ***
Documentation    User login test on automationpractice with dataset in Squash, Browser in dataset in Squash
Library    Browser
Library    squash_tf.TFParamService
Resource	connect_user_resources_dataset.robot
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
Standard Account Connection
    Load Squash Test Parameter Mail        DS_mail
    Load Squash Test Parameter Password       DS_password
	[Setup]    Test Setup              
    I Am On The Home Page
    I Go To The SignIn Page
    I Am On The Authentification Page
    I Can Successfully Sign-in With Email ${PARAM1} Password ${PARAM2} And Submit
    I Am On The Account Page
    I Am Connected As Jules Grisel
	[Teardown]	Test Teardown
