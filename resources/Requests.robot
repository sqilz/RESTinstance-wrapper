*** Settings ***
Variables  variables.py
Library  REST  ${URL}

*** Keywords ***
Get Resource
    [Documentation]  Returns the contents of a resource
    [Arguments]  ${resource}
    GET                         /${resource}

Query Resource with request parameters
    [Documentation]  Returns the resource with the request parameters
    [Arguments]  ${resource}  ${request_parameters}  #e.g.  ?_limit=3   ->  /user?_limit=3
    GET                         /${resource}${request_parameters}

Get Resource number
    [Documentation]  Get user with number
    [Arguments]  ${resource}  ${number}
    GET                         /${resource}/${number}

Post To Resource
    [Documentation]  Posts JSON to resource
    [Arguments]  ${resource}  ${JSON}
    POST                        /${resource}  ${JSON}
