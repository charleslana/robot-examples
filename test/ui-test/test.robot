*** Settings ***
Library     RPA.Browser.Playwright
Resource    automate_robotsparebin.robot


*** Tasks ***
Automate https://robotsparebinindustries.com/
    [Documentation]    Login in robotsparebinindustries
    [Tags]    login
    Open new browser    https://robotsparebinindustries.com/
    ${logged_in}=    Login
    Console Log    ${logged_in}

Fill form https://robotsparebinindustries.com/
    [Documentation]    Form in robotsparebinindustries
    [Tags]    form
    Open new browser    https://robotsparebinindustries.com/
    Login
    Fill Form

My slow task
    [Documentation]    Slow test
    [Tags]    slow
    Skip
    FOR    ${counter}    IN RANGE    1    301
        Log    ${counter}
        IF    $counter % 100 == 0    Log    Something is not Ok    level=ERROR
        IF    $counter % 10 == 0    Sleep    1.5
    END

Test Random String
    ${random_string}=    Generate Random    255
    Console Log    ${random_string}

Test Random Numbers
    ${random_digits}=    Generate Random Digits    2
    Console Log    ${random_digits}
