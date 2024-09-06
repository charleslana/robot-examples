*** Settings ***
Documentation       Testes paralelos

Resource            resources/base.resource


*** Test Cases ***
Cenário: 01 - Testar geração de email
    [Documentation]    Gerar e-mail aleatório
    [Tags]    random_email
    Generate Random Email
