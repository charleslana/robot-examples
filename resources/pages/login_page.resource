*** Settings ***
Documentation       Arquivo de keywords da tela de login de conta

Resource            ../base.resource


*** Keywords ***
O usuário preenche o formulário de login
    Fill Text    ${INPUT_EMAIL}    ${GLOBAL_USER_EMAIL}
    Fill Secret    ${INPUT_PASSWORD}    $GLOBAL_USER_PASSWORD
    Click    ${LOGIN_BUTTON}

O usuário deve visualizar o botão de logout
    Wait For Elements State    ${LOGOUT_BUTTON}

O usuário preenche o formulário de login com email e senha
    [Arguments]    ${email}    ${senha}
    Fill Text    ${INPUT_EMAIL}    ${email}
    Fill Secret    ${INPUT_PASSWORD}    $senha
    Click    ${LOGIN_BUTTON}

Logar com bearer token
    ${user}    Get JSON    user
    ${key}    Set Variable    ${user}[token][key]
    ${value}    Set Variable    ${user}[token][value]
    Set LocalStorage    ${key}    ${value}
