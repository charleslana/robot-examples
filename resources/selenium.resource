*** Settings ***
Documentation       Arquivo de keywords do selenium

Resource            utils/utils.resource
Library             AppiumLibrary


*** Keywords ***
Abrir aplicativo
    [Arguments]
    ...    ${remote_url}
    ...    ${android_automation_name}
    ...    ${android_platform_name}
    ...    ${android_platform_version}
    ...    ${android_device_name}
    ...    ${app_path}
    ...    ${android_app_package}
    ...    ${android_app_activity}

    Open Application    ${remote_url}
    ...    automationName=${android_automation_name}
    ...    platformName=${android_platform_name}
    ...    platformVersion=${android_platform_version}
    ...    deviceName=${android_device_name}
    ...    app=${app_path}
    ...    appPackage=${android_app_package}
    ...    appActivity=${android_app_activity}

Fechar aplicativo
    Close Application

Wait For Text
    [Arguments]    ${text}

    Wait Until Page Contains    ${text}

Aguarde Até Elemento Conter
    [Arguments]    ${element}    ${timeout}=${None}

    Wait Until Page Contains Element    ${element}    ${timeout}

Clicar Elemento
    [Arguments]    ${element}

    Click Element    ${element}

Digitar Texto Elemento
    [Arguments]    ${element}    ${text}

    Input Text    ${element}    ${text}

Esperar Elemento Vísivel
    [Arguments]    ${element}    ${timeout}=${None}

    Wait Until Element Is Visible    ${element}    ${timeout}

Clicar Texto
    [Arguments]    ${text}

    Click Text    ${text}
