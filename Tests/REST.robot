*** Settings ***
Library  REST  http://localhost:3000
Resource  ../resources/Outputs.robot
Suite Teardown  Rest instances        ${OUTPUTDIR}/json/spec.json
Test Setup      Set expectations

*** Test Cases ***
Get the first post
    [Tags]  Smoke
    GET         /posts/1
    Outputs.Output body  first_post
Get all available users
    [Tags]  Smoke
    GET         /user
    Outputs.Output body  All_users

Validate user
    [Tags]  Smoke  test3
    OPTIONS     /user
    Outputs.Output header  head
    GET         /user
    #validating
    Integer     response status       200
    Outputs.Output body  user_one

Test 4
    [Tags]  Smoke
    GET         /user?_limit=3       timeout=1.5
    Integer     response status       200
    GET         /user                { "_limit": 3 }
    #Array       response body         ${CURDIR}/limit_3.json
Test POST localhost:3000
    POST        http://localhost:3000/posts     {"id": "","title": "A Title", "author": "Someone"}



*** Keywords ***
Set expectations
    Expect response                   { "status": { "enum": [200, 201, 204, 400,404] } }
