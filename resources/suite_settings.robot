*** Settings ***
Variables       ../resources/variables.py
Resource        variables.py
Library         REST                  ${URL}

*** Keywords ***
Output rest instance spec
    Rest instances    ${OUTPUTDIR}/json/spec.json
