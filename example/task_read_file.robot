*** Settings ***
Documentation       Read file

Library             RPA.Browser.Playwright
Library             RPA.Excel.Files
Library             RPA.HTTP
Library             Collections
Library             RPA.Tables
Library             RPA.PDF
Library             String


*** Tasks ***
Mostrar todas as linhas do excel
    Show all in excel

Mostrar a terceira linha da coluna da tabela
    ${result}=    Get Third Row From Excel
    Log To Console    ${result}
    Should Be Equal    Albert    ${result}[0]

Mostrar todas as linhas do XLS
    Show all in XLS

Mostra leitura de CSV
    Read CSV File

Mostra dados do PDF
    ${sample_date}=    Extract Sample String From PDF
    Log To Console    ${sample_date}

Buscar dado contendo no PDF
    Extract texto do PDF


*** Keywords ***
Show all in excel
    ${people}=    Get the list of people from the Excel file
    FOR    ${person}    IN    @{people}
        Log To Console    ${person}
        Show person in table    ${person}
    END

Get the list of people from the Excel file
    Open Workbook    sample/example.xlsx
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
    Open Workbook    sample/example.xlsx
    ${data}=    Read Worksheet As Table    header=True
    ${third_row}=    Get From List    ${data}    2    # Pega a terceira linha (indexado a partir de 0)
    Close Workbook
    RETURN    ${third_row}

Show all in XLS
    ${people}=    Get the list from the XLS
    FOR    ${person}    IN    @{people}
        Log To Console    ${person}
    END

Get the list from the XLS
    Open Workbook    sample/file_example_XLS_10.xls
    ${table}=    Read Worksheet As Table    header=True
    Close Workbook
    RETURN    ${table}

Read CSV File
    ${csv_data}=    Read table from CSV    sample/username.csv
    FOR    ${csv_row}    IN    @{csv_data}
        Log To Console    ${csv_row}
    END

Extract Sample String From PDF
    ${text}=    Get Text From PDF    sample/c4611_sample_explain.pdf
    # Log To Console    ${text}
    ${lines}=    Get Lines Matching Regexp
    ...    ${text}[${1}]
    ...    specification in the bookmark file\s*(.*)
    ...    partial_match=True
    # Log To Console    ${lines}
    ${sample_date}=    Get Value From Lines    ${lines}
    RETURN    ${sample_date}

Get Value From Lines
    [Arguments]    ${lines}
    ${values}=    Create List    ${lines}
    ${first_value}=    Get From List    ${values}    0
    ${sample_date}=    Strip String    ${first_value}
    RETURN    ${sample_date}

Strip String
    [Arguments]    ${text}
    ${stripped}=    Evaluate    "${text}".strip()
    RETURN    ${stripped}

Extract texto do PDF
    ${dict}=    Get Text From PDF    sample/c4611_sample_explain.pdf
    Log To Console    ${dict}
    ${text}=    Convert To String    ${dict}
    Should Contain    ${text}    To run this sample
