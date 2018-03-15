*** Settings ***
Variables  variables.py
Library  REST  ${URL}

*** Keywords ***
Get Users
    [Documentation]  Returns all available users
    GET                         /user
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
    GET                         /post/${number}