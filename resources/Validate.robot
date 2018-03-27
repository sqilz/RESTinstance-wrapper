*** Settings ***
Variables                variables.py
Library                  REST
...                      ${URL}

*** Keywords ***
Set expectations
    [Documentation]      Expects JSON response status from
    ...                  the REST API with the codes specified,
    ...                  tests with a status code not included
    ...                  in the below json string will fail
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
    [Documentation]      Validate the string field, pass then
    ...                  name of a field to validate as well
    ...                  as the expected result.
    [Arguments]          ${field_name}    ${text}
        String           response body ${field_name}    ${text}

Boolean Field
    [Documentation]      Validate whether a field is true or false.
    [Arguments]          ${field_name}    ${value}
        Boolean          response body ${field_name}    ${value}

Is Null Field
    [Documentation]      Checks if a field is null.
    ...                  jsonplaceholder.typicode.com doesn't have
    ...                  any null fields in its database so it will
    ...                  not be used in the SUITE
    [Arguments]          ${field_name}
        Null             ${field_name}

Missing Field
    [Documentation]      Check if a field is missing
    [Arguments]          ${field_name}
        MISSING          response body ${field_name}

Object field
    [Documentation]      Checks for JSON object, can check if an
    ...                  object has fields. When passing ${required_fields}
    ...                  make sure your fields are surrounded by
    ...                  Quotation marks " and separate them using commas ,
    [Arguments]          ${field_name}    ${required_fields}=
        # required_fields is optional
        Object           response ${field_name}    required=[${required_fields}]

JSON array custom
    [Documentation]      Checks if a field/resource is an Array, request query
    [Arguments]          ${request}     ${value}
        Array            ${request}     ["${value}"]

JSON array file
    [Documentation]      Checks if a resource is an Array. Pass in a path to the JSON file
    [Arguments]          ${path}
        Array            response body  ${path}

Number field
    # a test case example of this keyword cannot be made using jsonplaceholder.typicode.com
    # as none of the test data have a number/decimal/float field
    # (there are strings that contain a decimal, but they are strings...)
    [Documentation]      Allows validation of decimal number fields such as 0.00
    [Arguments]          ${field_name}    ${value}
        Number           response ${field_name}    ${value}