*** Settings ***
Variables  variables.py
Library  REST  ${URL}

*** Keywords ***
Response status
    [Arguments]         ${number}
    Integer             response status       ${number}