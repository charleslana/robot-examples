*** Settings ***
Library     String
Library     RPA.JSON
Library     RPA.Browser.Playwright


*** Keywords ***
Generate Random Strings
    [Arguments]    ${length}=10
    ${random_string}=    Generate Random String    ${length}
    RETURN    ${random_string}

Generate Random Digits
    [Arguments]    ${count}=10
    ${random_digits}=    Evaluate    ''.join([str(random.randint(0, 9)) for _ in range(${count})])    modules=random
    RETURN    ${random_digits}

Generate Random Email
    ${length}=    Set Variable    10
    ${random_email}=    Generate Random Strings    ${length}
    ${complete_email}=    Set Variable    ${random_email}@email.com
    Log    ${complete_email}
    Console Log    ${complete_email}
    RETURN    ${complete_email}

Console Log
    [Arguments]    ${log}
    Log To Console    ${log}

Get JSON
    [Arguments]    ${json_path}

    ${json}=    Load JSON from file
    ...    ${EXECDIR}/resources/json/${json_path}.json
    ...    encoding=UTF-8

    RETURN    ${json}

Set LocalStorage
    [Arguments]    ${key}    ${value}
    LocalStorage Set Item
    ...    ${key}
    ...    ${value}

Get Base URL
    ${base}=    Get JSON    base
    ${base_url}=    Set Variable    ${base}[base][base_url]
    RETURN    ${base_url}
