*** Settings ***
Variables       ../resources/variables.py
Library         REST
...             ${URL}

*** Keywords ***
Output rest instance spec
    Rest instances    ${OUTPUTDIR}/json/spec.json
    Clear Expectations      #Resets