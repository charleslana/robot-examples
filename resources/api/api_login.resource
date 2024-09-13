*** Settings ***
Documentation       Arquivo de keywords de login api

Library             RequestsLibrary
Library             Collections
Resource            api_common.resource


*** Keywords ***
Do login
    [Arguments]    ${email}    ${password}

    Obter url base

    ${body}=    Create Dictionary
    ...    email=${email}
    ...    password=${password}

    ${response}=    POST
    ...    url=${base_url}/login
    ...    json=${body}
    ...    expected_status=200

    ${response_json}=    Set Variable    ${response.json()}
    ${authorization}=    Get From Dictionary    ${response_json}    authorization
    Should Be String    ${authorization}
    ${parts}=    Split String    ${authorization}    Bearer
    ${token}=    Strip String    ${parts[1]}
    Set Global Variable    ${USER_TOKEN}    ${token}
