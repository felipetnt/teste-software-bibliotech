*** Settings ***
Library          SeleniumLibrary
Suite Teardown   Close Browser

*** Variables ***
${URL}             http://localhost:3000/login
${BTN_SUBMIT}      id=btnLogin

*** Test Cases ***
CT24 - Simular Disparos De Cliques Para Forçar Estouro De Limite
    Open Browser     ${URL}    chrome
    FOR    ${i}    IN RANGE    1    102
        Click Button    ${BTN_SUBMIT}
    END
    Page Should Contain    Muitas requisições. Tente novamente mais tarde.