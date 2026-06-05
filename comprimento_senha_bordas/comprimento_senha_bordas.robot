*** Settings ***
Library          SeleniumLibrary
Suite Teardown   Close Browser

*** Variables ***
${URL}             http://localhost:3000/cadastro
${INPUT_PASS}      id=senha
${BTN_SUBMIT}      id=btnCadastrar
${FEEDBACK}        id=senha-erro

*** Test Cases ***
CT15 - Validar Fronteira Minima De Caracteres Da Senha
    Open Browser     ${URL}    chrome
    Maximize Browser Window
    Input Text       ${INPUT_PASS}    Ab1!345
    Click Button     ${BTN_SUBMIT}
    Wait Until Element Is Visible    ${FEEDBACK}    timeout=2s
    Element Text Should Be           ${FEEDBACK}    A senha deve conter no mínimo 8 caracteres.