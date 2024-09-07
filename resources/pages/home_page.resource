*** Settings ***
Documentation       Arquivo de keywords da tela de login de conta

Resource            ../base.resource


*** Keywords ***
O usuário navegue para a página home
    # Go To    ${HOME_URL}
    Go home
