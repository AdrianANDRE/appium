*** Settings ***
Documentation   Test SQUASH API- requête GET POST PATCH DELETE for a user
Library         REST
Resource    ../resource/RequetePostSquash.robot           
   

*** Test Cases ***
Requête POST_DELETE
    Create A User
    Verify The User Created
    Modify The User Created
    Verify The User Modified
    Delete The User Modified

    
    