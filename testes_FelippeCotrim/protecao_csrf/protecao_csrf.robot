***    Settings  ***
Documentation     Suíte de automação para simular submissão sem tokens contra CSRF.
Library           SeleniumLibrary

*** Variables ***
${URL_PERFIL}     [https://felipetnt.github.io/teste-software-bibliotech/perfil](https://felipetnt.github.io/teste-software-bibliotech/perfil)
${BROWSER}        chrome
${BOTAO_SALVAR}   id=btn-salvar-perfil
${ALERTA_CSRF}    xpath=//div[@class='security-alert']

*** Test Cases ***
CT-048.1 - Submeter Formulario Sem Token CSRF e Validar Bloqueio
    [Documentation]    Simula um ataque removendo o elemento oculto do token da árvore DOM antes do clique.
    Open Browser    ${URL_PERFIL}    ${BROWSER}
    Maximize Browser Window
    Execute Javascript    var element = document.getElementById('csrf_token'); if(element) { element.remove(); }
    Click Element   ${BOTAO_SALVAR}
    Wait Until Element Is Visible    ${ALERTA_CSRF}    timeout=5s
    Element Should Contain    ${ALERTA_CSRF}    Acesso Negado: Requisição Inválida ou Forjada.
    [Teardown]      Close Browser