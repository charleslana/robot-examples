*** Settings ***
Documentation       More in: https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#setting-section-1

Suite Setup         Configurar Ambiente
Suite Teardown      Limpar Ambiente
Test Setup          Executar a cada teste
Test Teardown       Executar após o teste


*** Test Cases ***
Caso de Teste 1
    [Documentation]    Um exemplo de caso de teste.
    Log To Console    Primeiro teste

Caso de Teste 2
    [Documentation]    Outro exemplo de caso de teste.
    Log To Console    Segundo teste


*** Keywords ***
Configurar Ambiente
    Log To Console    Configurando o ambiente da suíte de testes

Limpar Ambiente
    Log To Console    Limpando o ambiente após a suíte de testes

Executar a cada teste
    Log To Console    Executou a cada teste

Executar após o teste
    Log To Console    Executou no final do teste
