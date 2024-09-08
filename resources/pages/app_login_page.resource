*** Settings ***
Documentation       Arquivo de keywords da tela de login do app

Resource            ../base.resource


*** Variables ***
&{APP_USER_LOGIN}       email=yoda@qax.com    password=jedi


*** Keywords ***
Abrir Item Login
    Click Card Item    Login    Login

Preencher Formulário de Login
    [Arguments]    ${is_failed}=False

    Wait Until Page Contains Element    ${APP_EMAIL_INPUT}
    Input Text    ${APP_EMAIL_INPUT}    ${APP_USER_LOGIN}[email]
    ${password}=    Set Variable If    ${is_failed}    InvalidPassword    ${APP_USER_LOGIN}[password]
    Input Text    ${APP_PASSWORD_INPUT}    ${password}
    Click Element    ${APP_SUBMIT_BUTTON}

Mensagem de login com sucesso
    Wait For Tooltip    Boas vindas, logado você está.

Mensagem de login com falha
    Wait For Tooltip    Oops! Credenciais incorretas.
