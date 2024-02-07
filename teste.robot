*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${SITE_URL}  https://automationpratice.com.br/
${SITE_URL_HERBERT}  https://www.google.com/
${USUARIO_EMAIL}  qazando@gmail.com
${USUARIO_SENHA}  123456

*** Keywords ***
Abrir Site Herbert
    Open Browser  ${SITE_URL_HERBERT}  headlesschrome  options=add_argument("--disable-gpu")  options=add_argument("--no-sandbox")  options=add_argument("--disable-dev-shm-usage")

Abrir Site
    Open Browser  ${SITE_URL}  headlesschrome  options=add_argument("--disable-gpu")  options=add_argument("--no-sandbox")  options=add_argument("--disable-dev-shm-usage")

Abrir esse site
    [Arguments]  ${url}
    Open Browser  ${url}  headlesschrome  options=add_argument("--disable-gpu")  options=add_argument("--no-sandbox")  options=add_argument("--disable-dev-shm-usage")

Esperar Página Carregar
    Sleep  3s

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

Fechar Navegador
    Close Browser

*** Test Cases ***
Cenário 1: Acessando o site do Robot
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
    Close Browser

Cenário 2: Testando Robot
    [Tags]  Teste3
    Abrir Site
    Esperar Página Carregar
    Clicar em Link de Login
    Esperar Página Carregar
    Preencher Campo de E-mail
    Preencher Campo de Senha
    Clicar em Botão de Login
    Esperar Página Carregar
    Verificar texto login realizado

Cenário 3: Testando valor no teste
    [Tags]  Teste3
    Abrir esse site  https://automationpratice.com.br/  
    Esperar Página Carregar
    Clicar em Link de Login
    Esperar Página Carregar
    Preencher Campo de E-mail
    Preencher Campo de Senha
    Clicar em Botão de Login
    Esperar Página Carregar
    Verificar texto login realizado