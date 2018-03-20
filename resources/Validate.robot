*** Settings ***
Variables               variables.py
Library                 REST    ${URL}

*** Keywords ***
Response status
    [Arguments]          ${number}
    [Documentation]      Checks if the server response status is ${number}
        Integer          response status    ${number}

String Field
    [Documentation]      Validate the string field, pass then name of a field to validate as well as the expected result.
    [Arguments]          ${field_name}    ${text}
        String           response body ${field_name}    ${text}

Boolean Field
    [Documentation]     Validate whether a field is true or false.
    [Arguments]          ${field_name}  ${value}
        Boolean          response body ${field_name}    ${value}

Is Null Field
    [Documentation]      Checks if a field is null. jsonplaceholder.typicode.com doesn't have any null fields in its database so it will not be used in the SUITE
    [Arguments]          ${field_name}
        Null             ${field_name}
Set expectations
    [Documentation]      Expects JSON response status from the REST API with the codes specified, tests with a status code not included in the below json string will fail
        Expect response  {"status": { "enum": [200, 201, 204, 400, 404] } }

