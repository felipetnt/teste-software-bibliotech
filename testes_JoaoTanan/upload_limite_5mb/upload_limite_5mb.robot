*** Settings ***
Library          SeleniumLibrary
Suite Teardown   Close Browser

*** Variables ***
${URL}             http://localhost:3000/perfil
${INPUT_FILE}      id=avatar-uploader
${MSG_ERRO}        id=erro-tamanho-msg

*** Test Cases ***
CT20 - Deve Rejeitar Upload Acima Da Borda De Cinco Megabytes
    Open Browser     ${URL}    chrome
    Maximize Browser Window
    Choose File      ${INPUT_FILE}    ${CURDIR}/arquivo_5_1mb.jpg
    Wait Until Element Is Visible    ${MSG_ERRO}    timeout=3s
    Element Text Should Be           ${MSG_ERRO}    O arquivo excede o limite de 5MB.