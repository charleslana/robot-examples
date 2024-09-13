*** Settings ***
Documentation       Arquivo de keywords de comuns da api

Resource            ../utils/utils.resource


*** Keywords ***
Obter url base
    ${base_url}=    Get Api URL
    Set Suite Variable    ${base_url}
