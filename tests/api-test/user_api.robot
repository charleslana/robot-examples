*** Settings ***
Documentation       Suite de testes de usuário

Library             RequestsLibrary
Library             Collections
Library             String
Resource            ../../resources/base.resource

Suite Setup         Cadastrar usuario e realizar login


*** Test Cases ***
Criar usuário (API)
    [Documentation]    teste api de cadastro de usuário
    [Tags]    user_register_api

    Do register

Fazer login (API)
    [Documentation]    teste api de login de usuário
    [Tags]    user_login_api

    Do register
    Do login    ${GLOBAL_USER_EMAIL}    ${GLOBAL_USER_PASSWORD}

Buscar toos usuários (API)
    [Documentation]    teste api de buscar todos usuários
    [Tags]    user_get_all_api

    Get all users    ${USER_TOKEN}

Obter variaveis
    Console Log    ${response_json}
    Console Log    ${GLOBAL_USER_EMAIL}


*** Keywords ***
Cadastrar usuario e realizar login
    Do register
    Do login    ${GLOBAL_USER_EMAIL}    ${GLOBAL_USER_PASSWORD}
    Console Log    Chamou 1 vez
