***  Settings   ***
Documentation     Suíte de testes automatizados de interface para validação e mitigação de XSS.
Library           SeleniumLibrary

*** Variables ***
${URL}            [https://felipetnt.github.io/teste-software-bibliotech/](https://felipetnt.github.io/teste-software-bibliotech/)
${BROWSER}        chrome
${INPUT_BUSCA}    id=search-input
${BOTAO_BUSCA}    id=search-submit
${TERMO_EXIBIDO}  xpath=//span[@class='search-term-result']

*** Test Cases ***
CT-045.1 - Injetar Payload Script no Campo de Busca e Validar Sanitizacao
    [Documentation]    Garante que as tags HTML/JavaScript inseridas são renderizadas como texto puro.
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Text      ${INPUT_BUSCA}    <script>alert('xss')</script>
    Click Element   ${BOTAO_BUSCA}
    Wait Until Element Is Visible    ${TERMO_EXIBIDO}    timeout=5s
    # Verifica se o texto foi renderizado literalmente ao invés de executado
    Element Text Should Be    ${TERMO_EXIBIDO}    <script>alert('xss')</script>
    [Teardown]      Close Browser