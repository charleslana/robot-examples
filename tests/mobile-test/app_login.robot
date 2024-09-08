*** Settings ***
Documentation       Suite de testes de login de usuário do app

Library             AppiumLibrary
Resource            ../../resources/base.resource

Test Setup          Open App
Test Teardown       Close App


*** Test Cases ***
Login user app
    [Tags]    mobile

    Given Abrir Funcionalidades App
    When Abrir Menu Formulário
    When Abrir Item Login
    And Preencher Formulário de Login
    Then Mensagem de login com sucesso

Login failed user app
    [Tags]    mobile

    Given Abrir Funcionalidades App
    When Abrir Menu Formulário
    When Abrir Item Login
    And Preencher Formulário de Login    ${True}
    Then Mensagem de login com falha
