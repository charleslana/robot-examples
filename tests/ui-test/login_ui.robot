*** Settings ***
Documentation       Suite de testes de login de usuário

Resource            ../../resources/base.resource

Test Setup          Start Browser
Test Teardown       Finish Browser


*** Test Cases ***
Cenário: 01 - Fazer login como usuário comum
    [Documentation]    teste para logar usuário perfil comum
    [Tags]    user_login

    Given O usuário preenche o formulário de login
    Then O usuário deve visualizar o botão de logout
    Sleep    5s

Cenário: 02 - Fazer login automático
    [Documentation]    teste para logar com usuário automaticamente
    [Tags]    user_login_auto    smoke
    Skip

    ${user}    Get JSON    user
    Given O usuário preenche o formulário de login com email e senha    ${user}[user][email]    ${user}[user][password]
    Then O usuário deve visualizar o botão de logout

Cenário: 03 - Fazer login com bearer token em local storage
    [Documentation]    teste para logar com usuário usando o bearer token
    [Tags]    user_login_token    smoke    regression

    Given Logar com bearer token
    When O usuário navegue para a página home
    Then O usuário deve visualizar o botão de logout
