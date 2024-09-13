*** Settings ***
Documentation       Arquivo de keywords de register api

Library             RequestsLibrary
Library             Collections
Resource            api_common.resource


*** Keywords ***
Do register
    Obter url base

    ${name}=    Set Variable    Nome
    ${random_email}=    Generate Random Email
    Set Global Variable    ${GLOBAL_USER_EMAIL}    ${random_email}
    ${random_password}=    Generate Random Strings
    Set Global Variable    ${GLOBAL_USER_PASSWORD}    ${random_password}
    ${isAdmin}=    Set Variable    false

    ${body}=    Create Dictionary
    ...    nome=${name}
    ...    email=${random_email}
    ...    password=${random_password}
    ...    administrador=${isAdmin}

    ${headers}=    Create Dictionary    Content-Type    application/json
    ${response}=    POST
    ...    url=${base_url}/usuarios
    ...    json=${body}
    ...    headers=${headers}
    ...    expected_status=201

    ${response_json}=    Set Variable    ${response.json()}
    Dictionary Should Contain Key    ${response_json}    _id
    Dictionary Should Contain Key    ${response_json}    message
    ${message}=    Get From Dictionary    ${response_json}    message
    Should Be Equal As Strings    ${message}    Cadastro realizado com sucesso
    ${_id}=    Get From Dictionary    ${response_json}    _id
    Should Be String    ${_id}
    Set Suite Variable    ${response_json}
