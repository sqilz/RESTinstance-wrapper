*** Settings ***
Variables  variables.py
Library  REST  ${URL}

*** Keywords ***
Response status
    [Arguments]         ${number}
    [Documentation]     Checks if the server response status is ${number}
    Integer             response status       ${number}