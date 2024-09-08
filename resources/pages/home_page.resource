*** Settings ***
Documentation       Arquivo de keywords da tela de home

Resource            ../base.resource


*** Keywords ***
O usuário navegue para a página home
    # Go To    ${HOME_URL}
    Go home

Go home
    ${url}=    Get Base URL
    Go To    ${url}${HOME_URL}

Navegar para a lista de compras
    Click    ${home.lista_compras_action}
