*** Settings ***
Library          SeleniumLibrary
Suite Teardown   Close Browser

*** Variables ***
${URL}             http://localhost:3000/dashboard
${MENSAGEM_LOGIN}  id=login-message

*** Test Cases ***
CT26 - Validar Redirecionamento Automatico Ao Expirar Token
    Open Browser     ${URL}    chrome
    Maximize Browser Window
    Sleep            6s
    Reload Page
    Wait Until Location Contains    /login    timeout=5s
    Page Should Contain             Sua sessão expirou. Faça login novamente.
    