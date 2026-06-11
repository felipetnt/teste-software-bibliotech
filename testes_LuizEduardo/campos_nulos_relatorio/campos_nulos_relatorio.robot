*** Settings ***
Documentation     Suíte para garantir que registros nulos não geram quebra ou exceções na UI.
Library           SeleniumLibrary

*** Variables ***
${URL}            [https://felipetnt.github.io/teste-software-bibliotech/acervo](https://felipetnt.github.io/teste-software-bibliotech/acervo)
${BROWSER}        headlesschrome
${TABELA_RESULT}  xpath=//table[@id='table-books']
${CELULA_NULA}    xpath=//td[@class='col-editora-missing']

*** Test Cases ***
CT-035.1 - Carregar Acervo com Livros Sem Editora e Validar Tratamento Estavel
    Open Browser    ${URL}    ${BROWSER}
    Wait Until Element Is Visible    ${TABELA_RESULT}    timeout=5s
    # Garante que o sistema substituiu o null por um caractere elegante ao invés de estourar um stack trace
    Element Text Should Be    ${CELULA_NULA}    —
    Page Should Not Contain    NullPointerException
    [Teardown]    Close Browser