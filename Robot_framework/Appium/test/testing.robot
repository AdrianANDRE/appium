# This sample code uses the Appium robot client
# pip install robotframework-appiumlibrary
# Then you can paste this into a file and simply run with robot
#
#  more keywords on: http://serhatbolsu.github.io/robotframework-appiumlibrary/AppiumLibrary.html

*** Settings ***
Library           AppiumLibrary

*** Variables ***
${REMOTE_URL}   http://localhost:4723/wd/hub
${platformName}    Android
${platformVersion}    8.0
${deviceName}    test aan
${appPackage}    com.simplemobiletools.contacts
${appActivity}    com.simplemobiletools.contacts.activities.MainActivity

*** Test Cases ***
Test case name
    Open Application    ${REMOTE_URL}   platformName=${platformName}  platformVersion=${platformVersion}  deviceName=${deviceName}  appPackage=${appPackage}  appActivity=${appActivity}
    # id=com.android.packageinstaller:id/permission_deny_button
    Click Element    id=com.android.packageinstaller:id/permission_deny_button
    # id=com.android.packageinstaller:id/permission_deny_button
    Click Element    id=com.android.packageinstaller:id/permission_deny_button

    # id=com.simplemobiletools.contacts:id/fragment_fab
    Click Element    id=com.simplemobiletools.contacts:id/fragment_fab
    # id=com.simplemobiletools.contacts:id/contact_first_name
    Clear Text    id=com.simplemobiletools.contacts:id/contact_first_name
    Input Text    id=com.simplemobiletools.contacts:id/contact_first_name    coucou
    # id=com.simplemobiletools.contacts:id/contact_surname
    Clear Text    id=com.simplemobiletools.contacts:id/contact_surname
    Input Text    id=com.simplemobiletools.contacts:id/contact_surname    salut
    # id=com.simplemobiletools.contacts:id/contact_number
    Clear Text    id=com.simplemobiletools.contacts:id/contact_number
    Input Text    id=com.simplemobiletools.contacts:id/contact_number    0123456789
    # accessibility id=Save
    Click Element    accessibility id=Save
    # id=com.simplemobiletools.contacts:id/contact_name
    Click Element    id=com.simplemobiletools.contacts:id/contact_name
    # id=com.simplemobiletools.contacts:id/contact_first_name
    Click Element    id=com.simplemobiletools.contacts:id/contact_first_name
    # id=com.simplemobiletools.contacts:id/contact_surname
    Click Element    id=com.simplemobiletools.contacts:id/contact_surname
    # id=com.simplemobiletools.contacts:id/contact_number
    Click Element    id=com.simplemobiletools.contacts:id/contact_number
    # accessibility id=End call
    Click Element    accessibility id=End call
    # accessibility id=More options
    Click Element    accessibility id=More options
    # xpath=/hierarchy/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.ListView/android.widget.LinearLayout[2]/android.widget.RelativeLayout/android.widget.TextView
    Click Element    xpath=/hierarchy/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.ListView/android.widget.LinearLayout[2]/android.widget.RelativeLayout/android.widget.TextView
    # id=android:id/button1
    Click Element    id=android:id/button1

*** Test Teardown ***
    Quit Application

*** Suite Teardown ***
    Close Application