*** Settings ***
Library  REST  https://jsonplaceholder.typicode.com
Suite Teardown  Rest instances                  ${OUTPUTDIR}/spec.json
Test Setup      Set expectations
*** Test Cases ***
Testing if it works
    GET         /posts/1
    Output  response body  ${OUTPUTDIR}/a.json

*** Keywords ***
Set expectations
    Expect response         { "status": { "enum": [200,404] } }
