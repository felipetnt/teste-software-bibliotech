*** Settings ***
Library          SeleniumLibrary
Suite Teardown   Close Browser

*** Variables ***
${URL}             http://localhost:3000/relatorios
${DATE_START}      id=dataInicio
${DATE_END}        id=dataFim
${BTN_SUBMIT}      id=btnGerar
${TOAST_SUCCESS}   id=toast-sucesso

*** Test Cases ***
CT25 - Permitir Emissao De Relatorio Com Intervalo De Um Dia
    Open Browser     ${URL}    chrome
    Maximize Browser Window
    Input Text       ${DATE_START}    2026-06-01
    Input Text       ${DATE_END}      2026-06-01
    Click Button     ${BTN_SUBMIT}
    Wait Until Element Is Visible    ${TOAST_SUCCESS}    timeout=4s
    Page Should Not Contain          Erro de período inválido
    