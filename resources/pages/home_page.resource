*** Settings ***
Documentation       Arquivo de keywords da tela de home

Resource            common_page.resource
Variables           ../locators/home_locator.yml


*** Keywords ***
O usuário navegue para a página home
    Navegar para funcionalidade    ${home_url}
