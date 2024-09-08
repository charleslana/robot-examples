*** Settings ***
Documentation       Arquivo de keywords de componentes apps comuns

Resource            ../base.resource
Library             AppiumLibrary


*** Variables ***
${REMOTE_URL}                   http://localhost:4723/wd/hub
${ANDROID_AUTOMATION_NAME}      UIAutomator2
${ANDROID_APP}                  ${EXECDIR}/apk/yodapp-beta.apk
${ANDROID_PLATFORM_NAME}        Android
${ANDROID_PLATFORM_VERSION}     %{ANDROID_PLATFORM_VERSION=11}
${ANDROID_DEVICE_NAME}          emulator-5554
${ANDROID_APP_PACKAGE}          com.qaxperience.yodapp
${ANDROID_APP_ACTIVITY}         com.qaxperience.yodapp.components.base.SplashActivity
${QAX_TITLE1}                   id=com.qaxperience.yodapp:id/mi_title
${QAX_TITLE2}                   //android.widget.TextView[contains(@resource-id, "mi_title")]
${QAX_TITLE3}                   //android.widget.TextView[@resource-id="com.qaxperience.yodapp:id/mi_title"]
${QAX_TITLE4}                   //android.widget.TextView[@resource-id="com.qaxperience.yodapp:id/mi_title" and @text="Yodapp"]
${QAX_BUTTON1}                  //android.widget.Button[@text="QAX"]
${QAX_BUTTON2}                  //android.widget.Button[contains(@text, "QAX")]
${QAX_BUTTON3}                  //android.widget.LinearLayout//android.widget.Button[@text="QAX"]
${APP_MENU_DRAWER_ICON}         //android.widget.ImageButton[@content-desc="Open navigation drawer"]
${APP_MENU_FORM}                //android.widget.TextView[@resource-id="com.qaxperience.yodapp:id/tvItemTitle" and @text='%s']
${APP_ITEM_CARD}                //android.widget.TextView[@resource-id="com.qaxperience.yodapp:id/tvItemTitle" and @text='%s']
${APP_TITLE_APP}                //android.widget.TextView[@resource-id="com.qaxperience.yodapp:id/toolbarTitle" and @text='%s']
${APP_EMAIL_INPUT}              id=com.qaxperience.yodapp:id/etEmail
${APP_PASSWORD_INPUT}           id=com.qaxperience.yodapp:id/etPassword
${APP_SUBMIT_BUTTON}            id=com.qaxperience.yodapp:id/btnSubmit


*** Keywords ***
Open App
    Open Application    ${REMOTE_URL}
    ...    automationName=${ANDROID_AUTOMATION_NAME}
    ...    platformName=${ANDROID_PLATFORM_NAME}
    ...    platformVersion=${ANDROID_PLATFORM_VERSION}
    ...    deviceName=${ANDROID_DEVICE_NAME}
    ...    app=${ANDROID_APP}
    ...    appPackage=${ANDROID_APP_PACKAGE}
    ...    appActivity=${ANDROID_APP_ACTIVITY}

Close App
    Close Application

Wait For Text
    [Arguments]    ${text}
    Wait Until Page Contains    ${text}

Abrir Funcionalidades App
    Wait Until Page Contains Element    ${QAX_TITLE1}    10
    Wait Until Page Contains Element    ${QAX_TITLE2}
    Wait Until Page Contains Element    ${QAX_TITLE3}
    Wait Until Page Contains Element    ${QAX_TITLE4}

    Wait Until Page Contains Element    ${QAX_BUTTON1}
    Wait Until Page Contains Element    ${QAX_BUTTON2}
    Wait Until Page Contains Element    ${QAX_BUTTON3}
    Click Element    ${QAX_BUTTON1}

Navegar Menu
    [Arguments]    ${menu_item}
    Wait Until Page Contains Element    ${APP_MENU_DRAWER_ICON}
    Click Element    ${APP_MENU_DRAWER_ICON}

    ${menu_locator}    Replace String    ${APP_MENU_FORM}    %s    ${menu_item}
    Wait Until Page Contains Element    ${menu_locator}
    Click Element    ${menu_locator}

Abrir Menu Formulário
    Navegar Menu    Formulários

Wait For Tooltip
    [Arguments]    ${message}
    Wait For Text    ${message}

Click Card Item
    [Arguments]    ${item_name}    ${page_name}
    ${item_locator}    Replace String    ${APP_ITEM_CARD}    %s    ${item_name}
    Wait Until Page Contains Element    ${item_locator}
    Click Element    ${item_locator}

    ${title_locator}    Replace String    ${APP_TITLE_APP}    %s    ${page_name}
    Wait Until Page Contains Element    ${title_locator}
