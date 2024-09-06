*** Settings ***
Library     String


*** Keywords ***
Generate Random Strings
    [Arguments]    ${length}
    ${random_string}=    Generate Random String    ${length}
    RETURN    ${random_string}

Generate Random Digits
    [Arguments]    ${count}
    ${random_digits}=    Evaluate    ''.join([str(random.randint(0, 9)) for _ in range(${count})])    modules=random
    RETURN    ${random_digits}

Generate Random Email
    ${random_email}=    Generate Random Strings    10
    ${complete_email}=    Set Variable    ${random_email}@email.com
    Log    ${complete_email}
    Console Log    ${complete_email}
    RETURN    ${complete_email}

Console Log
    [Arguments]    ${log}
    Log To Console    ${log}
