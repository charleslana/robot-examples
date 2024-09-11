*** Settings ***
Documentation       Arquivo de keywords da tela de criação de conta

Resource            ../playwright.resource
Resource            ../utils/utils.resource
Resource            common_page.resource
Variables           ../locators/common_locator.yml
Variables           ../locators/register_locator.yml


*** Keywords ***
O usuário clica em Cadastre-se
    Clicar    ${common_register_button}

O usuário preenche o formulário de cadastro
    ${random_name}=    Generate Random Strings
    Preencher texto    ${input_nome}    ${random_name}
    ${random_email}=    Generate Random Email
    Set Global Variable    ${GLOBAL_USER_EMAIL}    ${random_email}
    Preencher texto    ${common_input_email}    ${random_email}
    ${random_password}=    Generate Random Strings
    Set Global Variable    ${GLOBAL_USER_PASSWORD}    ${random_password}
    Preencher secretamente    ${common_input_password}    ${random_password}
    Clicar    ${common_register_button}

O usuário deve visualizar a mensagem de cadastro com sucesso
    Visualizar alerta    Cadastro realizado com sucesso

Cadastrar usuário comum
    O usuário clica em Cadastre-se
    O usuário preenche o formulário de cadastro
    O usuário deve visualizar a mensagem de cadastro com sucesso
