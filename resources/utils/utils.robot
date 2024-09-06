*** Settings ***
Library     String


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
