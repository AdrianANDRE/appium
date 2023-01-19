*** Settings ***
Documentation   Test Prestashop API- requête GET
Library         REST
Resource    ../resource/RequeteGet.robot           
   

*** Test Cases ***
Requête Get
    Get An Existing Customer
    Get An Existing Product
    Get An Existing Employee