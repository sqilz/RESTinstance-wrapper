*** Settings ***
Variables  variables.py
Library  REST  ${URL}

*** Keywords ***
Get Users
    [Documentation]  Returns all available users
    GET                         /user
Get Users with request parameters
    [Documentation]  Returns the
    [Arguments]  ${request_parameters}  #e.g.  ?_limit=3   ->  /user?_limit=3
    GET                         /user${request_parameters}
Get User
    [Documentation]  Get user with number
    [Arguments]  ${number}
    GET                         /user/${number}
Get Posts
    [Documentation]  Returns all available posts
    GET                         /posts
Get Post
    [Documentation]  Get post with number
    [Arguments]  ${number}
    GET                         /posts/${number}