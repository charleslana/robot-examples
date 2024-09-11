*** Settings ***
Documentation       Arquivo de keywords de comuns

Resource            ../playwright.resource
Resource            ../utils/utils.resource
Variables           ../locators/common_locator.yml


*** Keywords ***
Visualizar alerta
    [Arguments]    ${message}
    Wait For Element    ${common.alert_message}
    ${alert_text}=    RPA.Browser.Playwright.Get Text    ${common.alert_message}
    Should Contain    ${alert_text}    ${message}

Navegar para a lista de compras
    Clicar    ${common_lista_compras_action}

Navegar para funcionalidade
    [Arguments]    ${url}

    ${base_url}=    Get Base URL
    Navegar para    ${base_url}${url}
