*** Settings ***
Documentation       Arquivo de keywords da tela de login de conta

Resource            common_page.resource
Resource            register_page.resource
Resource            ../hooks/hooks.resource
Variables           ../locators/login_locator.yml
Variables           ../locators/common_locator.yml


*** Keywords ***
O usuário preenche o formulário de login
    Navegar para funcionalidade    ${login_url}
    Preencher texto    ${input_email}    ${GLOBAL_USER_EMAIL}
    Preencher secretamente    ${input_password}    $GLOBAL_USER_PASSWORD
    Clicar    ${login_button}

O usuário deve visualizar o botão de logout
    Wait For Elements State    ${logout_button}

O usuário preenche o formulário de login com email e senha
    [Arguments]    ${email}    ${senha}
    Preencher texto    ${input_email}    ${email}
    Preencher secretamente    ${input_password}    $senha
    Clicar    ${login_button}

Logar com bearer token
    ${user}    Get JSON    user
    ${key}    Set Variable    ${user}[token][key]
    ${value}    Set Variable    ${user}[token][value]
    Set LocalStorage    ${key}    ${value}
