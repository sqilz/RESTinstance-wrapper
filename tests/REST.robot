*** Settings ***
Documentation   Example RESTinstance project testing on
...             https://jsonplaceholder.typicode.com you
...             can also test on a JSON-server set up locally,
...             just change the URL in variables.py (also make
...             sure you have the resources in your database.json)

Resource        ../resources/suite_settings.robot
Resource        ../resources/WriteJSON.robot
Resource        ../resources/Validate.robot
Resource        ../resources/Requests.robot
Test Setup      Validate.Set expectations
Suite Teardown  suite_settings.Output rest instance spec

*** Test Cases ***
Save the first post in a JSON file
    [Tags]  Smoke  Get  Validate
        Requests.Get Resource number                     /posts                 /1
        Validate.Response status                         200
        WriteJSON.body                                   first_post

Save all available users in a JSON file
    [Tags]  Smoke  Get  Validate
        Requests.Get Resource                            /users
        Validate.response status                         200
        WriteJSON.body                                   All_users

Validate user one and save
    [Tags]  Smoke  Get  Validate
        Requests.Get Resource number                     /users                 /1
        Validate.response status                         200
        Validate.Object Field                            body                   "id", "name"
        Validate.Object Field                            body address geo       "lat", "lng"
        Validate.Object Field                            body                   #second argument is optional
        WriteJSON.body                                   user_one
        WriteJSON.custom                                 response body address geo lat   string_number

Get two users from the database
    [Tags]  Smoke  Get  Validate  array
        Requests.Query Resource with request parameters  /users                 ?_limit=2
        Validate.response status                         200
        WriteJSON.body                                   two_users

Check to see if TODO six is completed
    [Tags]  boolean  Get  Validate
        Requests.Get Resource                            /todos/6
        Validate.Response status                         200
        Validate.Boolean field                           completed              false

Add a new post
    [Tags]  post  Validate
        Requests.Post to Resource                        /posts/                {"id": "","title": "A Title", "author": "Somesone"}
        Validate.Response status                         201

Update /posts/2 data
    [Tags]  put  Validate
        Requests.Replace Resource                        /posts/2               {"name":"bob"}
        Validate.response status                         200

Modify user one
    [Tags]  patch  String  Validate
        Requests.Modify resource                         /users/3               {"username":"Samantha"}
        Validate.response status                         200
        Validate.String field                            username               Samantha
        Validate.Missing field                           user

Remove user one and some posts
    [Tags]  delete  String  Validate
        #Check if such user exists
        Requests.Get Resource number                     /users                 1
        Validate.Integer field                           id                     1
        Validate.String field                            name                   Leanne Graham
        Response Status                                  200
        Requests.Remove Resource                         /users/1
        Validate.Response status                         200

Check server HEAD and OPTIONS
    [Tags]  head  options
        # / is for the URL specified in the variables.py
        # jsonplaceholder.typicode.com (url from the variables.py) doesn't specify the server options
        # and is returning a 200 response status code
        Requests.Return Head                            /
        Requests.Return Options                         /
        Validate.Response status                        200
        Requests.Return Head                            /posts/6
        Requests.Return Options                         /posts/6
        Validate.Response status                        200
        # checking an URL
        Requests.Return Head                            http://google.com/
        # Google doesn't allow the OPTIONS Http method and is returning a 405 status code
        Requests.Return Options                         http://google.com/

Array Validation
    [Tags]  Array  Validate
    Requests.Get Resource                               /users?_limit=10
    Validate.JSON array custom                          request query _limit  10
    #for the below array validation to work you need to have a json file with the data to validate
    WriteJSON.body  test
    Validate.JSON array file                            ${OUTPUTDIR}/JSON/test.json
