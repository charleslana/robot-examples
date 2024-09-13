*** Settings ***
Documentation       Arquivo de keywords de user api

Library             RequestsLibrary
Library             Collections
Resource            api_common.resource


*** Keywords ***
Get all users
    [Arguments]    ${token}

    ${header}=    Create Dictionary    Authorization=Bearer ${token}
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
