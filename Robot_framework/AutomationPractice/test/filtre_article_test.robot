*** Settings ***
Documentation    Filter article test on automationpractice, Browser in dataset in Squash
Library    Browser
Resource	../Page_object/home_page.robot
Resource	../Page_object/women_page.robot
Resource    ../Page_object/account_page.robot
Resource    setup_teardown.robot

*** Keywords ***
Test Setup
    Set Test Variable    ${url_home}    http://automationpractice.com/index.php

	${__TEST_SETUP}	Get Variable Value	${TEST SETUP}
    Run Keyword If	$__TEST_SETUP is not None	${__TEST_SETUP}

Test Teardown
	${__TEST_TEARDOWN}	Get Variable Value	${TEST TEARDOWN}
    Run Keyword If	$__TEST_TEARDOWN is not None	${__TEST_TEARDOWN}

*** Test Cases ***
Filter Articles
    [Setup]    Test Setup          
    I Am On The Home Page
    I Go To The Women Navigation Page
    I Am On The Women Page
    I Apply The Filters "Dresses" And Size "S" On The Articles
    I Sort The Items By Ascending Price
	[Teardown]	Test Teardown
