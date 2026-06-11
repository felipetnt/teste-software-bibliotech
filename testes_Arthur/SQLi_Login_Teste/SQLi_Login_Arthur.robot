*** Settings ***
Library    SeleniumLibrary
Suite Setup    Open Browser    http://localhost:3000/login    chrome
Suite Teardown    Close Browser

*** Variables ***
${INPUT_EMAIL}    id=email
${INPUT_SENHA}    id=senha
${BTN_LOGIN}      id=entrar
${MSG_ERRO}       id=erro-login

*** Test Cases ***
CT02 - Tentativa de Bypass de Autenticação com SQLi
    Input Text        ${INPUT_EMAIL}    admin@email.com' OR '1'='1
    Input Password    ${INPUT_SENHA}    senha_aleatoria
    Click Button      ${BTN_LOGIN}
    
    # Valida se o acesso foi negado
    Wait Until Element Is Visible    ${MSG_ERRO}
    Element Text Should Be           ${MSG_ERRO}    Credenciais Inválidas
    Location Should Be               http://localhost:3000/login