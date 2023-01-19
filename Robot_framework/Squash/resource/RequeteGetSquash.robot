*** Settings ***
Library    REST
Library    Browser
Library    Collections
#"Accept": "application/json, */*","Content-Type": "application/json"

*** Variables ***
${MAIN_ENDPOINT}        http://admin:admin@172.18.0.5:8080/squash/api/rest/latest 
${login_field}    //input[@formcontrolname="login"]
${pass_field}    Authorization    "Basic" : "admin":"admin"
${headers}    {"content-type": "application/json"}        

*** Keywords ***
Get An Existing Test Case   
    GET         ${MAIN_ENDPOINT}/test-cases/303
    Output    response body
    Integer	response body id 	303
    String    response body name    Connect User-dataset
    Integer    response status    200

