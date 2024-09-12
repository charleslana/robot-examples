*** Settings ***
Documentation       Read excel

Library             RPA.Browser.Playwright
Library             RPA.Excel.Files
Library             RPA.HTTP
Library             Collections


*** Tasks ***
Mostrar todas as linhas do excel
    Show all in excel

Mostrar a terceira linha da coluna da tabela
    ${result}=    Get Third Row From Excel
    Log To Console    ${result}
    Should Be Equal    Albert    ${result}[0]


*** Keywords ***
Show all in excel
    ${people}=    Get the list of people from the Excel file
    FOR    ${person}    IN    @{people}
        Log To Console    ${person}
        Show person in table    ${person}
    END

Get the list of people from the Excel file
    Open Workbook    challenge.xlsx
    ${table}=    Read Worksheet As Table    header=True
    Close Workbook
    RETURN    ${table}

Show person in table
    [Arguments]    ${person}

    Log To Console    ${person}[First Name]
    Log To Console    ${person}[First Name]
    Log To Console    ${person}[Company Name]
    Log To Console    ${person}[Role in Company]
    Log To Console    ${person}[Address]
    Log To Console    ${person}[Email]
    Log To Console    ${person}[Phone Number]

Get Third Row From Excel
    Open Workbook    challenge.xlsx
    ${data}=    Read Worksheet As Table    header=True
    ${third_row}=    Get From List    ${data}    2    # Pega a terceira linha (indexado a partir de 0)
    Close Workbook
    RETURN    ${third_row}
