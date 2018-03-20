*** Settings ***
Variables  variables.py
Library  REST  ${URL}

*** Keywords ***
Response status
    [Arguments]         ${number}
    [Documentation]     Checks if the server response status is ${number}
    Integer             response status       ${number}

Set expectations
    [Documentation]  Expects JSON response status from the REST API with the codes specified, tests with a status code not included in the below json string will fail
    Expect response         {"status": { "enum": [200, 201, 204, 400, 404] } }