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
