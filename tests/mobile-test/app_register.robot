*** Settings ***
Documentation       Suite de testes de cadastro de usuário do app

Library             AppiumLibrary
Resource            ../../resources/base.resource

Test Setup          Open App
Test Teardown       Close App


*** Test Cases ***
Open Yodapp Application (Mobile)
    [Tags]    mobile

    Given Abrir Funcionalidades App
    Then Sleep    3s

Register new user (Mobile)
    [Tags]    mobile

    Given Abrir Funcionalidades App
    When Abrir Menu Formulário
    When Abrir Item Cadastro
    And Preencher Formulário de Cadastro
    Then Mensagem de cadastro com sucesso
