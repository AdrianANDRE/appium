*** Settings ***
Documentation    User login test on automationpractice with variables in test, Browser in dataset in Squash
Library    Browser
Resource	connect_user_resources.robot
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
	[Setup]    Test Setup         
    I Am On The Home Page
    I Go To The SignIn Page
    I Am On The Authentification Page
    I Can Successfully Sign-in With Email ${mail} Password ${password} And Submit
    I Am On The Account Page
    I Am Connected As Jules Grisel
	[Teardown]	Test Teardown
