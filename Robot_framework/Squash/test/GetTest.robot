*** Settings ***
Documentation   Test Squash API- requête GET
Library         REST
Resource    ../resource/RequeteGetSquash.robot                  
   

*** Test Cases ***
Requête Get
    Get An Existing Test Case