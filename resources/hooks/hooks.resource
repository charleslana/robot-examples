*** Settings ***
Library     RPA.Browser.Playwright


*** Variables ***
${BASE_URL}         https://front.serverest.dev/login
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
    Take Screenshot    fullPage=true
