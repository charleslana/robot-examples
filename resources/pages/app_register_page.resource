*** Settings ***
Documentation       Arquivo de keywords da tela de criação de conta do app

Resource            app_common_page.resource
Variables           ../locators/app_register_locator.yml


*** Variables ***
&{APP_USER_DETAILS}     email=email@email.com    password=123456
${REGISTER_CARD}        Cadastro
${REGISTER_TITLE}       Cadastro
${NOME}                 Nome
${NIVEL}                Padawan
${TOOLTIP_MESSAGE}      Tudo certo, boas vindas ao Yodapp!


*** Keywords ***
Select Level
    [Arguments]    ${level}

    Clicar Elemento    ${app_level_select}
    Esperar Elemento Vísivel    ${app_level_list}
    Clicar Texto    ${level}

Abrir Item Cadastro
    Click Card Item    ${REGISTER_CARD}    ${REGISTER_TITLE}

Preencher Formulário de Cadastro
    Aguarde Até Elemento Conter    ${app_name_input}
    Digitar Texto Elemento    ${app_name_input}    ${NOME}
    Digitar Texto Elemento    ${app_email_input}    ${APP_USER_DETAILS}[email]
    Digitar Texto Elemento    ${app_password_input}    ${APP_USER_DETAILS}[password]
    Select Level    ${NIVEL}
    Clicar Elemento    ${app_submit_button}

Mensagem de cadastro com sucesso
    Wait For Tooltip    ${TOOLTIP_MESSAGE}
