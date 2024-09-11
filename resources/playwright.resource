*** Settings ***
Documentation       Arquivo de keywords do playwright

Library             RPA.Browser.Playwright


*** Keywords ***
Wait For Element
    [Arguments]    ${locator}

    Wait For Elements State    ${locator}

Clicar
    [Arguments]    ${locator}

    Click    ${locator}

Navegar para
    [Arguments]    ${url}

    Go To    ${url}

Preencher texto
    [Arguments]    ${locator}    ${text}

    Fill Text    ${locator}    ${text}

Preencher secretamente
    [Arguments]    ${locator}    ${text}

    Fill Secret    ${locator}    ${text}
