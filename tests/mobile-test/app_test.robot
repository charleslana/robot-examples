*** Settings ***
Resource    ../../resources/base.resource


*** Test Cases ***
Check password
    ${is_failed}=    Set Variable    False
    ${password}=    Set Variable If    ${is_failed}    InvalidPassword    ${APP_USER_LOGIN}[password]
    Console Log    ${password}
