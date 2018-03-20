*** Settings ***
Variables  variables.py
Library  REST  ${URL}

*** Keywords ***
Get Resource
    [Documentation]  Returns the contents of a resource
    [Arguments]  ${resource}
    GET                         ${resource}

Query Resource with request parameters
    [Documentation]  Returns the resource with the request parameters
    [Arguments]  ${resource}  ${request_parameters}  #e.g.  ?_limit=3   ->  /user?_limit=3
    GET                         ${resource}${request_parameters}

Get Resource number
    [Documentation]  Get user with number
    [Arguments]  ${resource}  ${number}
    GET                         ${resource}/${number}

Post To Resource
    [Documentation]  Posts JSON to resource
    [Arguments]  ${resource}  ${JSON}
    POST                        ${resource}  ${JSON}


# The difference between PATCH and PUT are just like the keyword name suggests
# for example, we have a user in a databse (JSON) as such
# {
#   "name": "bob",
#    "id": 1,
#    "title": "mr"
#  }
# PATCH with JSON {"name":"joe"}     would only update the name field and do nothing else
# PUT with the same above JSON       would replace the name to joe, and also remove the "title" as it replaces the user entirely
#                                    it would also remove the id if it was specified by the client not the server
Replace Resource
    [Documentation]  Replaces/updates the existing resource with new data using PUT, can specify new
    [Arguments]     ${resource_or_url}   ${json}
    PUT             ${resource_or_url}   ${json}

Modify Resource
    [Documentation]  Modifies/updates the resource using PATCH
    [Arguments]     ${resource_or_url}   ${json}
    PATCH           ${resource_or_url}   ${json}