*** Settings ***
Documentation       Arquivo de keywords da tela de criação de conta

Resource            ../base.resource


*** Keywords ***
Quando O usuário clica em Cadastre-se
    Click    ${ACTION_REGISTER}

Quando o usuário preenche o formulário de cadastro
    Fill Text    ${INPUT_NOME}    txt