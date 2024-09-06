*** Settings ***
Documentation       Arquivo de keywords da tela de criação de conta

Resource            ../base.resource


*** Keywords ***
O usuário clica em Cadastre-se
    Click    ${ACTION_REGISTER}

O usuário preenche o formulário de cadastro
    ${random_name}=    Generate Random Strings
    Fill Text    ${INPUT_NOME}    ${random_name}
    ${random_email}=    Generate Random Email
    Fill Text    ${INPUT_EMAIL}    ${random_email}
    ${random_password}=    Generate Random Strings
    Fill Secret    ${INPUT_PASSWORD}    $random_password
