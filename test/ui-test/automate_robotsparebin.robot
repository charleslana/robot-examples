*** Settings ***
Library     RPA.Browser.Playwright
Library     Collections
Library     String


*** Variables ***
${BROWSER}          chromium
${HEADLESS}         false
&{credentials} =    username=maria    password=thoushallnotpass
${logout} =         \#logout


*** Keywords ***
Console Log
    [Arguments]    ${log}
    Log To Console    ${log}

Opens browser at target
    [Arguments]    ${target}
    Open Browser    url=${target}

Open new browser
    [Arguments]    ${url}
    New Browser    browser=${BROWSER}    headless=${HEADLESS}
    New Context    locale=pt-BR
    New Page    ${url}

Login
    Set Viewport Size    600    900
    ${username}=    Get From Dictionary    ${credentials}    username
    ${password}=    Get From Dictionary    ${credentials}    password
    Fill Text    \#username    ${username}
    Type Secret    \#password    $password
    Click    .btn
    Wait For Elements State    ${logout}    timeout=5s
    ${is_visible}=    Run Keyword And Return Status    Wait For Elements State    ${logout}    timeout=5s
    IF    ${is_visible}
        Console Log    O logout está visível
    ELSE
        Console Log    O logout não está visível após o login
    END
    RETURN    ${is_visible}

Generate Random
    [Arguments]    ${length}
    ${random_string}=    Generate Random String    ${length}
    RETURN    ${random_string}

Generate Random Digits
    [Arguments]    ${count}
    ${random_digits}=    Evaluate    ''.join([str(random.randint(0, 9)) for _ in range(${count})])    modules=random
    RETURN    ${random_digits}

Fill Form
    ${random_string}=    Generate Random    10
    ${random_digits}=    Generate Random Digits    10
    Fill Text    \#firstname    ${random_string}
    Fill Text    \#salesresult    ${random_digits}
    Sleep    5s

End Test
    Close Context
    Close Browser
