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
