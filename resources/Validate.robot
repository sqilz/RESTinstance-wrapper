*** Settings ***
Variables                variables.py
Library                  REST    ${URL}

*** Keywords ***
Set expectations
    [Documentation]      Expects JSON response status from the REST API with the codes specified, tests with a status code not included in the below json string will fail
        Expect response  {"status": { "enum": [200, 201, 204, 400, 404, 405] } }

Response status
    [Arguments]          ${number}
    [Documentation]      Checks if the server response status is ${number}
        Integer          response status    ${number}
Integer Field
    [Arguments]          ${field_name}    ${number}
    [Documentation]      Checks if a field contains an integer
        Integer          response body ${field_name}    ${number}
String Field
    [Documentation]      Validate the string field, pass then name of a field to validate as well as the expected result.
    [Arguments]          ${field_name}    ${text}
        String           response body ${field_name}    ${text}

Boolean Field
    [Documentation]      Validate whether a field is true or false.
    [Arguments]          ${field_name}    ${value}
        Boolean          response body ${field_name}    ${value}

Is Null Field
    [Documentation]      Checks if a field is null. jsonplaceholder.typicode.com doesn't have any null fields in its database so it will not be used in the SUITE
    [Arguments]          ${field_name}
        Null             ${field_name}

Missing Field
    [Documentation]      Check if a field is missing
    [Arguments]          ${field_name}
        MISSING          response body ${field_name}
Object field
    [Documentation]      Checks for JSON object, can check if an object has fields. When passing ${required_fields} make sure your fields are surrounded by Quotation marks " and separate them using commas ,
    [Arguments]          ${field_name}    ${required_fields}=
    Object               response ${field_name}    required=[${required_fields}]  #required_fields is optional
