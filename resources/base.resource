*** Settings ***
Documentation       Arquivo principal do projeto

# Hooks
Resource            hooks/_index.resource
# Variables
Resource            variables/_index.resource
Variables           locators/home_locator.yml
Variables           locators/lista_compras_locator.yml
# Utils
Resource            utils/_index.resource
# Page Resource
Resource            pages/_index.resource
