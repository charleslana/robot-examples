*** Settings ***
Documentation       Arquivo de keywords da tela de login do app

Resource            app_common_page.resource


*** Variables ***
# Dictionary
&{APP_USER_LOGIN}       email=yoda@qax.com    password=jedi
${LOGIN_CARD}           Login
${LOGIN_TITLE}          Login
${TOOLTIP_SUCCESS}      Boas vindas, logado você está.
${TOOLTIP_ERROR}        Oops! Credenciais incorretas.
${BAD_PASSWORD}         InvalidPassword


*** Keywords ***
Abrir Item Login
    Click Card Item    ${LOGIN_CARD}    ${LOGIN_TITLE}

Preencher Formulário de Login
    [Arguments]    ${is_failed}=False

    Aguarde Até Elemento Conter    ${app_email_input}
    Digitar Texto Elemento    ${app_email_input}    ${APP_USER_LOGIN}[email]
    ${password}=    Set Variable If    ${is_failed}    ${BAD_PASSWORD}    ${APP_USER_LOGIN}[password]
    Digitar Texto Elemento    ${app_password_input}    ${password}
    Clicar Elemento    ${app_submit_button}

Mensagem de login com sucesso
    Wait For Tooltip    ${TOOLTIP_SUCCESS}

Mensagem de login com falha
    Wait For Tooltip    ${TOOLTIP_ERROR}
