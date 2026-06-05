*** Settings ***
Library          SeleniumLibrary
Suite Teardown   Close Browser

*** Variables ***
${URL}             http://localhost:3000/login
${INPUT_USER}      id=username
${INPUT_PASS}      id=password
${BTN_LOGIN}       id=btnLogin
${ALERT_BOX}       id=msg-alert

*** Test Cases ***
CT16 - Validar Bloqueio Exato Na Decima Tentativa Incorreta
    Open Browser     ${URL}    chrome
    FOR    ${index}    IN RANGE    1    11
        Input Text        ${INPUT_USER}    pretao.alvo@email.com
        Input Password    ${INPUT_PASS}    SenhaIncorreta
        Click Button      ${BTN_LOGIN}
    END
    Wait Until Element Is Visible    ${ALERT_BOX}    timeout=3s
    Element Text Should Be           ${ALERT_BOX}    Conta bloqueada por excesso de tentativas.