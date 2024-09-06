*** Settings ***
Documentation       Suite de testes de cadastro de usuário

Resource            resources/base.resource

Test Setup          Start Browser
Test Teardown       Finish Browser


*** Test Cases ***
Cenário: 01 - Criar conta como usuário comum
    [Documentation]    teste para cadastrar usuário perfil comum
    [Tags]    user

    Given O usuário clica em Cadastre-se
    When O usuário preenche o formulário de cadastro
    Sleep    5s
