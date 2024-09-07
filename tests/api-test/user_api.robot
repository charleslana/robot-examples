*** Settings ***
Documentation       Suite de testes de usuário

Library             RequestsLibrary
Library             Collections
Library             String
Resource            ../../resources/utils/utils.resource

Suite Setup         Obter url base


*** Test Cases ***
Criar usuário (API)
    [Documentation]    teste api de cadastro de usuário
    [Tags]    user_register_api

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

Fazer login (API)
    [Documentation]    teste api de login de usuário
    [Tags]    user_login_api

    ${body}=    Create Dictionary
    ...    email=${GLOBAL_USER_EMAIL}
    ...    password=${GLOBAL_USER_PASSWORD}

    ${response}=    POST
    ...    url=${base_url}/login
    ...    json=${body}
    ...    expected_status=200

    ${response_json}=    Set Variable    ${response.json()}
    ${authorization}=    Get From Dictionary    ${response_json}    authorization
    Should Be String    ${authorization}
    ${parts}=    Split String    ${authorization}    Bearer
    ${token}=    Strip String    ${parts[1]}
    Set Suite Variable    ${token}

Buscar toos usuários (API)
    [Documentation]    teste api de buscar todos usuários
    [Tags]    user_get_all_api

    ${header}=    Create Dictionary    Authorization=Bearer aaaa
    ${response}=    GET
    ...    url=${base_url}/usuarios
    ...    headers=${header}
    ...    expected_status=200

    ${response_json}=    Set Variable    ${response.json()}
    ${quantidade}=    Get From Dictionary    ${response_json}    quantidade
    ${check_quantidade}=    Evaluate    isinstance(${quantidade}, int)
    Should Be True    ${check_quantidade}

    ${usuarios}=    Get From Dictionary    ${response_json}    usuarios
    ${check_usuarios}=    Evaluate    isinstance(${usuarios}, list)
    Should Be True    ${check_usuarios}

    ${usuarios_length}=    Get length    ${usuarios}
    Console Log    ${usuarios_length}
    Length Should Be    ${usuarios}    ${quantidade}

    FOR    ${usuario}    IN    @{usuarios}
        ${nome}=    Get From Dictionary    ${usuario}    nome
        Should Be String    ${nome}
        ${email}=    Get From Dictionary    ${usuario}    email
        Should Be String    ${email}
        ${password}=    Get From Dictionary    ${usuario}    password
        Should Be String    ${password}
        ${administrador}=    Get From Dictionary    ${usuario}    administrador
        Should Be String    ${administrador}
        ${id}=    Get From Dictionary    ${usuario}    _id
        Should Be String    ${id}
    END

Usar variavel message
    Console Log    ${response_json}
    Console Log    ${GLOBAL_USER_EMAIL}
    Console Log    ${token}


*** Keywords ***
Obter url base
    ${base_url}=    Get Api URL
    Set Suite Variable    ${base_url}
    Set Suite Variable    ${token}    1
