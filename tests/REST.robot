*** Settings ***
Documentation   Example RESTinstance project testing on a local JSON-SERVER
Variables       ../resources/variables.py
Library         REST                  ${URL}
Resource        ../resources/Outputs.robot
Resource        ../resources/Validate.robot
Resource        ../resources/Requests.robot
Suite Teardown  Rest instances    ${OUTPUTDIR}/json/spec.json
Test Setup      Validate.Set expectations

*** Test Cases ***
Save the first post in a JSON file
    [Tags]  Smoke  test1
    Requests.Get Resource number    /posts    /1
    Validate.Response status        200
    Outputs.body                    first_post

Save all available users in a JSON file
    [Tags]  Smoke
    Requests.Get Resource              /users
    Outputs.body                       All_users

Validate user one and save
    [Tags]  Smoke  test3
    Requests.Get Resource number       /users    /1
    Validate.response status           200
    Outputs.body                       user_one

Get two users from the database
    [Tags]  Smoke  test4
    Requests.Query Resource with request parameters  /users    ?_limit=2
    Validate.response status                         200
    Outputs.body                                     two_users

Add a new post
    [Tags]  post
    Requests.Post to Resource   /posts/    {"id": "","title": "A Title", "author": "Somesone"}
    Validate.Response status    201

Update /posts/2 data
    [Tags]  put
    Requests.Replace Resource   /posts/2    {"name":"bob"}
    Validate.response status    200

Modify user one
    [Tags]  patch
    Requests.Modify resource   /users/3  {"name":"bob"}
    Validate.response status   200