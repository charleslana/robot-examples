*** Settings ***
Library     RPA.Browser.Playwright
Resource    ../utils/utils.resource


*** Variables ***
${BROWSER}          chromium
${IS_HEADLESS}      False


*** Keywords ***
Start Browser
    New Browser    browser=${BROWSER}    headless=${IS_HEADLESS}
    New Context    locale=pt-BR
    ${base_url}=    Get Base URL
    New Page    ${base_url}

Finish Browser
    Capture Screenshot
    Close Context
    Close Browser

Capture Screenshot
    # Take Screenshot    %{ROBOT_ARTIFACTS}${/}result.png    fullPage=true
    Run Keyword If Test Failed    Take Screenshot

Set LocalStorage
    [Arguments]    ${key}    ${value}
    LocalStorage Set Item
    ...    ${key}
    ...    ${value}
