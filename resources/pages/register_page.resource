*** Settings ***
Documentation       Arquivo de keywords da tela de criação de conta

Resource            ../base.resource


*** Keywords ***
O usuário clica em Cadastre-se
    Click    ${REGISTER_ACTION}

O usuário preenche o formulário de cadastro
    ${random_name}=    Generate Random Strings
    Fill Text    ${INPUT_NOME}    ${random_name}
    ${random_email}=    Generate Random Email
    Set Global Variable    ${GLOBAL_USER_EMAIL}    ${random_email}
    Fill Text    ${INPUT_EMAIL}    ${random_email}
    ${random_password}=    Generate Random Strings
    Set Global Variable    ${GLOBAL_USER_PASSWORD}    ${random_password}
    Fill Secret    ${INPUT_PASSWORD}    $random_password
    Click    ${REGISTER_BUTTON}

O usuário deve visualizar a mensagem de cadastro com sucesso
    Wait For Elements State    ${ALERT_MESSAGE}
    ${alert_text}=    Get Text    ${ALERT_MESSAGE}
    Should Contain    ${alert_text}    Cadastro realizado com sucesso
