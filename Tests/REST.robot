*** Settings ***
Documentation   Example RESTinstance project testing on a local JSON-SERVER
Variables       ../resources/variables.py
Library         REST                  ${URL}
Resource        ../resources/Outputs.robot
Resource        ../resources/Validate.robot
Resource        ../resources/Requests.robot
Suite Teardown  Rest instances        ${OUTPUTDIR}/json/spec.json
Test Setup      Set expectations

*** Test Cases ***
Get the first post
    [Tags]                      Smoke
    Requests.Get Post           1
    Outputs.Output body         first_post

Get all available users
    [Tags]                      Smoke
    Requests.Get Users
    Outputs.Output body         All_users

Validate user
    [Tags]                      Smoke  test3
    Requests.Get User           1
    #validating
    Validate.response status    200
    Outputs.Output body         user_one

Test 4
    [Tags]                      Smoke
    GET                         /user?_limit=3        timeout=1.5
    Validate.response status    200
    GET                         /user                 { "_limit": 3 }
    #Array                      response body         ${CURDIR}/limit_3.json

Test POST localhost:3000
    POST                    http://localhost:3000/posts     {"id": "","title": "A Title", "author": "Someone"}



*** Keywords ***
Set expectations
    Expect response         {"status": { "enum": [200, 201, 204, 400,404] } }
