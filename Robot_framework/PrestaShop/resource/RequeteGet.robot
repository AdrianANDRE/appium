*** Settings ***
Library    REST
Documentation    test

*** Variables ***
${MAIN_ENDPOINT}        http://sut-recette01.squashcloud.io/api
${API_KEY}    4FXXK7ET631125FJQGF5ICKURVZ6FD12 

*** Keywords ***
Get An Existing Customer
    GET         ${MAIN_ENDPOINT}/customers/1/?ws_key=${API_KEY}&output_format=JSON
    Output    response body
    Integer    response status    200
    Integer	response body customer id 	1
    String    response body customer lastname    Anonymous                                  

Get An Existing Product
    GET         ${MAIN_ENDPOINT}/products/1/?ws_key=${API_KEY}&output_format=JSON
    Output    response body
    Integer    response status    200
    Integer	response body product id 	1
    String    response body product name    T-shirt imprimé colibri

Get An Existing Employee
    GET         ${MAIN_ENDPOINT}/employees/1/?ws_key=${API_KEY}&output_format=JSON
    Output    response body
    Integer    response status    200
    Integer	response body employee id 	1
    String    response body employee firstname    Bitnami
    String    response body employee lastname    User
    
