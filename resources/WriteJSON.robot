*** Settings ***
Variables               variables.py
Library                 REST
...                     ${URL}

*** Keywords ***
Body
    [Arguments]         ${filename}
    [Documentation]     Outputs the body of a request,
    ...                 takes one argument that will be
    ...                 the name of the output file.json

        Output          response body         ${OUTPUTDIR}/json/${filename}.json
Header
    [Arguments]         ${filename}
    [Documentation]     Outputs a header, takes one argument
     ...                that will be the name of the output file.json

        Output          response headers      ${OUTPUTDIR}/json/${filename}.json

Custom
    [Documentation]     Allows outputting a custom field
    [Arguments]         ${custom_field}    ${filename}
        Output          ${custom_field}    ${OUTPUTdIR}/json/${filename}.json