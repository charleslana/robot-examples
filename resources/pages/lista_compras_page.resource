*** Settings ***
Documentation       Arquivo de keywords da tela de lista de compras

Resource            ../base.resource


*** Keywords ***
Esperar Lista de compras
    Wait For Elements State    ${lista_compras.titulo}
