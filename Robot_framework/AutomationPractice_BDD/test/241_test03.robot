# Automation priority: null
# Test case importance: Low
*** Settings ***
Documentation    Shopping Cart BDD test on automationpractice
Resource    squash_resources.resource
Library		squash_tf.TFParamService

*** Keywords ***
Test Setup
	${__TEST_SETUP}	Get Variable Value	${TEST SETUP}
	${__TEST_241_SETUP}	Get Variable Value	${TEST 241 SETUP}
	Run Keyword If	$__TEST_SETUP is not None	${__TEST_SETUP}
	Run Keyword If	$__TEST_241_SETUP is not None	${__TEST_241_SETUP}

Test Teardown
	${__TEST_TEARDOWN}	Get Variable Value	${TEST TEARDOWN}
	${__TEST_241_TEARDOWN}	Get Variable Value	${TEST 241 TEARDOWN}
	Run Keyword If	$__TEST_TEARDOWN is not None	${__TEST_TEARDOWN}
	Run Keyword If	$__TEST_241_TEARDOWN is not None	${__TEST_241_TEARDOWN}

*** Test Cases ***
test03
	
	[Setup]	Test Setup

	Given J'accède à l'URL : http://automationpractice.com/index.php
	When Je clique sur l'article Faded Short Sleeve T-shirts
	When Je clique sur le bouton Add to Cart
	Then L'article est bien ajouté et une popup apparait avec le message de confirmation suivant : Product successfully added to your shopping cart Les boutons Continue Shopping et Proceed to checkout sont présents

	[Teardown]	Test Teardown