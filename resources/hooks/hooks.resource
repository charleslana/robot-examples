*** Settings ***
Library     RPA.Browser.Playwright


*** Variables ***
${BASE_URL}         https://front.serverest.dev
${BROWSER}          chromium
${IS_HEADLESS}      False

${API_URL}          https://serverest.dev
&{HEADERS}          Content-Type=application/json


*** Keywords ***
Start Browser
    New Browser    browser=${BROWSER}    headless=${IS_HEADLESS}
    New Context    locale=pt-BR
    New Page    ${BASE_URL}

Finish Browser
    Capture Screenshot
    Close Context
    Close Browser

Capture Screenshot
    # Take Screenshot    %{ROBOT_ARTIFACTS}${/}result.png    fullPage=true
    Run Keyword If Test Failed    Take Screenshot    fullPage=true
