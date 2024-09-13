*** Settings ***
Documentation       Arquivo de keywords de componentes apps comuns

Resource            ../selenium.resource
Variables           ../locators/app_common_locator.yml


*** Variables ***
${ANDROID_PATH}         ${EXECDIR}/apk
${MENU_FORMULARIOS}     Formulários
${APP_JSON}             app


*** Keywords ***
Open App
    ${app}    Get JSON    ${APP_JSON}
    ${full_app_path}    Catenate    SEPARATOR=/    ${ANDROID_PATH}    ${app}[app][android_apk]

    Abrir aplicativo
    ...    ${app}[app][remote_url]
    ...    ${app}[app][android_automation_name]
    ...    ${app}[app][android_platform_name]
    ...    ${app}[app][android_platform_version]
    ...    ${app}[app][android_device_name]
    ...    ${full_app_path}
    ...    ${app}[app][android_app_package]
    ...    ${app}[app][android_app_activity]

Close App
    Fechar aplicativo

Abrir Funcionalidades App
    Aguarde Até Elemento Conter    ${qax_title1}    60
    Aguarde Até Elemento Conter    ${qax_title2}
    Aguarde Até Elemento Conter    ${qax_title3}
    Aguarde Até Elemento Conter    ${qax_title4}

    Aguarde Até Elemento Conter    ${qax_button1}
    Aguarde Até Elemento Conter    ${qax_button2}
    Aguarde Até Elemento Conter    ${qax_button3}
    Clicar Elemento    ${qax_button1}

Navegar Menu
    [Arguments]    ${menu_item}

    Aguarde Até Elemento Conter    ${app_menu_drawer_icon}
    Clicar Elemento    ${app_menu_drawer_icon}

    ${menu_locator}    Replace String    ${app_menu_form}    %s    ${menu_item}
    Aguarde Até Elemento Conter    ${menu_locator}
    Clicar Elemento    ${menu_locator}

Abrir Menu Formulário
    Navegar Menu    ${MENU_FORMULARIOS}

Wait For Tooltip
    [Arguments]    ${message}

    Wait For Text    ${message}

Click Card Item
    [Arguments]    ${item_name}    ${page_name}

    ${item_locator}    Replace String    ${app_item_card}    %s    ${item_name}
    Aguarde Até Elemento Conter    ${item_locator}
    Clicar Elemento    ${item_locator}

    ${title_locator}    Replace String    ${app_title_app}    %s    ${page_name}
    Aguarde Até Elemento Conter    ${title_locator}
