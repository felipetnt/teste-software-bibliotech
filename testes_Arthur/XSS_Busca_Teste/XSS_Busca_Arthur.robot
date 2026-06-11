*** Settings ***
Library    SeleniumLibrary
Suite Setup    Open Browser    http://localhost:3000/busca    chrome
Suite Teardown    Close Browser

*** Variables ***
${INPUT_BUSCA}    id=barra-pesquisa
${BTN_BUSCAR}     id=btn-buscar
${PAYLOAD_XSS}    <script>alert('Ataque XSS')</script>

*** Test Cases ***
CT01 - Tentativa de injeção XSS no campo de busca
    Input Text    ${INPUT_BUSCA}    ${PAYLOAD_XSS}
    Click Button  ${BTN_BUSCAR}
    
    # Valida se o script não foi embutido no DOM de forma executável
    Page Should Not Contain Element    xpath=//script[contains(text(),'Ataque XSS')]
    
    # Valida se o sistema sanitizou e transformou o script em texto puro na tela
    Page Should Contain    Resultados para: <script>alert('Ataque XSS')</script>