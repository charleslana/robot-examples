*** Settings ***
Documentation       Arquivo de keywords da tela de criação de conta do app

Resource            ../base.resource


*** Variables ***
${APP_LEVEL_SELECT}     id=com.qaxperience.yodapp:id/spinnerJob
${APP_LEVEL_LIST}       class=android.widget.ListView
${APP_NAME_INPUT}       id=com.qaxperience.yodapp:id/etUsername
&{APP_USER_DETAILS}     email=email@email.com    password=123456


*** Keywords ***
Select Level
    [Arguments]    ${level}

    Click Element    ${APP_LEVEL_SELECT}
    Wait Until Element Is Visible    ${APP_LEVEL_LIST}
    Click Text    ${level}

Abrir Item Cadastro
    Click Card Item    Cadastro    Cadastro

Preencher Formulário de Cadastro
    Wait Until Page Contains Element    ${APP_NAME_INPUT}
    Input Text    ${APP_NAME_INPUT}    Nome
    Input Text    ${APP_EMAIL_INPUT}    ${APP_USER_DETAILS}[email]
    Input Text    ${APP_PASSWORD_INPUT}    ${APP_USER_DETAILS}[password]
    Select Level    Padawan
    Click Element    ${APP_SUBMIT_BUTTON}

Mensagem de cadastro com sucesso
    Wait For Tooltip    Tudo certo, boas vindas ao Yodapp!
