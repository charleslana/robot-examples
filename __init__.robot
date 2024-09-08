*** Settings ***
Resource        resources/base.resource

Suite Setup     First log


*** Keywords ***
First log
    Console Log    'É iniciado primeiro aqui'
