*** Settings ***
Library    REST
Library    Browser
Library    Collections
#"Accept": "application/json, */*","Content-Type": "application/json"

*** Variables ***
${MAIN_ENDPOINT}        http://admin:admin@172.18.0.5:8080/squash/api/rest/latest        
#${MAIN_ENDPOINT}        http://admin:admin@localhost:8092/squash/api/rest/latest  # for local test 

*** Keywords ***
Create A Project  
    POST         ${MAIN_ENDPOINT}/projects    body={ "_type" : "project", "name" : "API_project", "label" : "no price tag", "description" : "this is my project" }    
    Output    response body
    Integer    response status    201
Verify The Project
    GET    ${MAIN_ENDPOINT}/projects?projectName=API_project
    Output    response body
    Integer    response status    200
    String    response body name    API_project

#Delete The Created Project
    #DELETE    ${MAIN_ENDPOINT}/projects?projectName=API_project
    #Output    response body

Create A Test-case
    POST         ${MAIN_ENDPOINT}/test-cases   body={ "_type" : "test-case", "name" : "API_case", "parent" : { "_type" : "project", "id" : 14 } }    
    ${id_tc}    Output    $.id
    set test Variable    ${id_tc}     
    Integer    response status    201

Verify The Test-case Created
    GET    ${MAIN_ENDPOINT}/test-cases/${id_tc}
    String    response body name    API_case
    Integer    response status    200

Modify The Test-case Created
    PATCH    ${MAIN_ENDPOINT}/test-cases/${id_tc}    body={ "_type" : "test-case", "name" : "API_case_modified" }
    Integer    response status    200

Verify The Test-case Modified
    GET    ${MAIN_ENDPOINT}/test-cases/${id_tc}
    String    response body name    API_case_modified
    Integer    response status    200

Delete The Test-case Modified
    DELETE    ${MAIN_ENDPOINT}/test-cases/${id_tc}         
    Integer    response status    200    
                                 
Get The Existing Users 
    GET    ${MAIN_ENDPOINT}/users
    Integer    response status    200

Create A User
    POST         ${MAIN_ENDPOINT}/users   body={ "_type" : "user", "first_name" : "ju", "last_name" : "gr", "login" : "USER-API", "password" : "1235678", "email": "jgr@psg.com", "group": "User" }       
    ${id_user}    Output    $.id
    set test Variable    ${id_user}     
    Integer    response status    201

Verify The User Created
    GET    ${MAIN_ENDPOINT}/users/${id_user}
    String    response body first_name    ju
    String    response body last_name    gr
    String    response body login    USER-API    
    Integer    response status    200

Modify The User Created
    PATCH    ${MAIN_ENDPOINT}/users/${id_user}    body={"_type" : "user", "first_name" : "ju_modif", "last_name" : "gr", "login" : "USER-API", "password" : "1235678", "email": "jgr@psg.com", "active" : false, "group": "User" }
    Integer    response status    200

Verify The User Modified
    GET    ${MAIN_ENDPOINT}/users/${id_user}
    String    response body first_name    ju_modif
    Integer    response status    200

Delete The User Modified
    DELETE    ${MAIN_ENDPOINT}/users/${id_user}         
    Integer    response status    204  