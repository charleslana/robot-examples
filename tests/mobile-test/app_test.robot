*** Settings ***
Resource    ../../resources/base.resource


*** Test Cases ***
Check password
    ${is_failed} =    Set Variable    False
    ${password} =    Set Variable If    ${is_failed}    InvalidPassword    ${APP_USER_LOGIN}[password]
    Console Log    ${password}

Concatenar strings
    ${str1} =    Catenate    Hello    world
    Console Log    ${str1}
    ${str2} =    Catenate    SEPARATOR=---    Hello    world
    Console Log    ${str2}
    ${str3} =    Catenate    SEPARATOR=    Hello    world
    Console Log    ${str3}
    ${str4} =    Catenate    SEPARATOR=/    Hello    world    here
    Console Log    ${str4}
    ${str5} =    Catenate    SEPARATOR=/    Hello/hello    world    here
    Console Log    ${str5}
