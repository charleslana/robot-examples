*** Settings ***
Documentation       Arquivos de variáveis globais página home

Resource            ../base.resource


*** Variables ***
${HOME_URL}     ${BASE_URL}/home


*** Keywords ***
Go home
    ${url}=    Get Base URL
    Go To    ${url}/home
