*** Settings ***
Documentation       Suite de testes de login de usuário

Resource            ../../resources/base.resource

Test Setup          Start Browser
Test Teardown       Finish Browser


*** Test Cases ***
Cenário: 01 - Clicar no menu lista de compras
    [Documentation]    Set Start Browser    [Load for interactive console]

    # Start Browser
    Given Logar com bearer token
    When O usuário navegue para a página home
    And Navegar para a lista de compras
    Then Esperar Lista de compras
