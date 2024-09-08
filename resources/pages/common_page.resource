*** Settings ***
Documentation       Arquivo de keywords de componentes comuns

Resource            ../base.resource


*** Keywords ***
Visualizar alerta
    [Arguments]    ${message}
    Wait For Elements State    ${ALERT_MESSAGE}
    ${alert_text}=    RPA.Browser.Playwright.Get Text    ${ALERT_MESSAGE}
    Should Contain    ${alert_text}    ${message}
