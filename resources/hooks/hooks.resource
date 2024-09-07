*** Settings ***
Library     RPA.Browser.Playwright
Resource    ../utils/utils.robot


*** Keywords ***
Start Browser
    ${browser}=    Get Base JSON    browser
    ${is_headless}=    Get Base JSON    is_headless
    New Browser    browser=${browser}    headless=${is_headless}
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
