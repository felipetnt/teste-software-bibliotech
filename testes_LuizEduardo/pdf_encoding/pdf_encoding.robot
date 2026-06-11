*** Settings ***
Documentation     Suíte de automação para checar renderização de caracteres acentuados no PDF.
Library           SeleniumLibrary

*** Variables ***
${URL}            [https://felipetnt.github.io/teste-software-bibliotech/relatorios](https://felipetnt.github.io/teste-software-bibliotech/relatorios)
${BROWSER}        chrome
${INPUT_TITULO}   id=report-title-field
${BOTAO_EXPORT}   id=btn-export-pdf
${SUCESSO_Aviso}  xpath=//div[@class='download-toast']

*** Test Cases ***
CT-019.1 - Submeter Dados com Acentuacao Extrema e Validar Geracao PDF
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Text      ${INPUT_TITULO}    Coleção de Obras de Ação e Gênero Crítico R$ 150,00
    Click Element   ${BOTAO_EXPORT}
    Wait Until Element Is Visible    ${SUCESSO_Aviso}    timeout=5s
    Page Should Not Contain    Encoding Error
    [Teardown]      Close Browser