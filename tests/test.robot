*** Settings ***
Documentation       Testes paralelos

Resource            ../resources/base.resource
Library             ../resources/lib/EnvLibrary.py


*** Test Cases ***
Cenário: 01 - Testar geração de email
    [Documentation]    Gerar e-mail aleatório
    [Tags]    random_email
    Generate Random Email

Read Environment Variable
    ${test_env}=    Set Variable    %{GH_ACTIONS_RUNNER=${None}}
    Console Log    ${test_env}
