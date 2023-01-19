*** Settings ***
Documentation   Test SQUASH API- requête GET POST PATCH DELETE for a test case
Library         REST
Resource    ../resource/RequetePostSquash.robot           
   

*** Test Cases ***
Requête POST_DELETE
    Create A Test-case
    Verify The Test-case Created
    Modify The Test-case Created
    Verify The Test-case Modified
    Delete The Test-case Modified
    
    