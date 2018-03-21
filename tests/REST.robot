*** Settings ***
Documentation   Example RESTinstance project testing on a https://jsonplaceholder.typicode.com you can also test on a JSON-server set up locally, just change the URL in variables.py (also make sure you have the resources in your database.json)
Resource        ../resources/suite_settings.robot
Resource        ../resources/Outputs.robot
Resource        ../resources/Validate.robot
Resource        ../resources/Requests.robot
Test Setup      Validate.Set expectations
Suite Teardown  suite_settings.Output rest instance spec

*** Test Cases ***
Save the first post in a JSON file
    [Tags]  Smoke  Get  Validate
        Requests.Get Resource number                     /posts    /1
        Validate.Response status                         200
        Outputs.body                                     first_post

Save all available users in a JSON file
    [Tags]  Smoke  Get  Validate
        Requests.Get Resource                            /users
        Validate.response status                         200
        Outputs.body                                     All_users

Validate user one and save
    [Tags]  Smoke  Get  Validate
        Requests.Get Resource number                     /users    /1
        Validate.response status                         200
        Outputs.body                                     user_one

Get two users from the database
    [Tags]  Smoke  Get  Validate
        Requests.Query Resource with request parameters  /users    ?_limit=2
        Validate.response status                         200
        Outputs.body                                     two_users

Check to see if TODO six is completed
    [Tags]  boolean  Get  Validate
        Requests.Get Resource                            /todos/6
        Validate.Boolean field                           completed  false

Add a new post
    [Tags]  post  Validate
        Requests.Post to Resource                        /posts/    {"id": "","title": "A Title", "author": "Somesone"}
        Validate.Response status                         201

Update /posts/2 data
    [Tags]  put  Validate
        Requests.Replace Resource                        /posts/2    {"name":"bob"}
        Validate.response status                         200

Modify user one
    [Tags]  patch  String  Validate
        Requests.Modify resource                         /users/3  {"username":"Samantha"}
        Validate.response status                         200
        Validate.String field                            username  Samantha


Remove user one and some posts
    [Tags]  delete  String  Validate
        #Check if such user exists
        Requests.Get Resource number                     /users    1
        Validate.Integer field                           id        1
        Validate.String field                            name      Leanne Graham
        Response Status                                  200


