*** Settings ***
Documentation       Arquivo principal do projeto

# Hooks
Resource            hooks/_index.resource
# Variables
Resource            variables/_index.resource
# Utils
Resource            utils/_index.resource
# Page Resource
Resource            pages/_index.resource
# Playwright Resource
Resource            playwright.resource
# Selenium Resource
Resource            selenium.resource
# Api Resource
Resource            api/_index.resource
