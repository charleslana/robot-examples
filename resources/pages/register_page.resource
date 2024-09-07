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
    Visualizar alerta    Cadastro realizado com sucesso

Cadastrar usuário comum
    O usuário clica em Cadastre-se
    O usuário preenche o formulário de cadastro
    O usuário deve visualizar a mensagem de cadastro com sucesso
