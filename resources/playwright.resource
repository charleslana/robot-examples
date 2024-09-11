*** Settings ***
Documentation       Arquivo de keywords do playwright

Library             RPA.Browser.Playwright
Resource            utils/utils.resource


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

    Console Log    ${text}

    Fill Secret    ${locator}    $text
