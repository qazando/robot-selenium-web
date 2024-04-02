*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${SITE_URL}  https://automationpratice.com.br/
${SITE_ERRADO}  https://automationpr
${SITE_URL_HERBERT}  https://www.google.com/
${USUARIO_EMAIL}  qazando@gmail.com
${USUARIO_SENHA}  123456

*** Keywords ***
Abrir Site Herbert
    Open Browser  ${SITE_URL_HERBERT}  chrome

Abrir Site
    Open Browser  ${SITE_URL}  chrome

Abrir Endereco Errado
    Open Browser  ${SITE_ERRADO}  chrome

Abrir esse site
    [Arguments]  ${url}
    Open Browser  ${url}  chrome

Esperar Página Carregar
    Sleep  5s

Clicar em Link de Login
    Click Element  xpath://a[@href='/login']

Preencher Campo de E-mail
    Input Text  id:user  ${USUARIO_EMAIL}

Preencher Campo de Senha
    Input Text  id:password  ${USUARIO_SENHA}

Clicar em Botão de Login
    Click Element  id:btnLogin

Verificar texto login realizado
    ${texto_atual}  Get Text  id:swal2-title
    Should Be Equal As Strings  ${texto_atual}  Login realizado

*** Test Cases ***
Cenário 1: Teste de login com sucesso
    [Tags]  Teste1
    Abrir Site
    Esperar Página Carregar
    Clicar em Link de Login
    Esperar Página Carregar
    Preencher Campo de E-mail
    Preencher Campo de Senha
    Clicar em Botão de Login
    Esperar Página Carregar
    Verificar texto login realizado

Cenário 2: Testando Robot
    [Tags]  Teste2
    Abrir Endereco Errado
    Esperar Página Carregar
    Clicar em Link de Login
    Esperar Página Carregar
    Preencher Campo de E-mail
    Preencher Campo de Senha
    Clicar em Botão de Login
    Esperar Página Carregar
    Verificar texto login realizado