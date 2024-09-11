*** Settings ***
Documentation       Arquivo de keywords da tela de lista de compras

Resource            ../playwright.resource
Variables           ../locators/lista_compras_locator.yml


*** Keywords ***
Esperar Lista de compras
    Wait For Element    ${lista_compras_titulo}
