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
