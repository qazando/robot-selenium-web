*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${SITE_URL}  https://automationpratice.com.br/
${SITE_URL_HERBERT}  https://www.google.com/
${USUARIO_EMAIL}  qazando@gmail.com
${USUARIO_SENHA}  123456

*** Keywords ***
Configurar Opções do Chrome
    ${chrome_options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    test-type
    Call Method    ${chrome_options}    add_argument    --disable-extensions
    Call Method    ${chrome_options}    add_argument    --headless
    Call Method    ${chrome_options}    add_argument    --disable-gpu
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    [Return]  ${chrome_options}

Abrir Navegador Chrome
    [Arguments]    ${chrome_options}
    Create Webdriver    Chrome    chrome_options=${chrome_options}

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
    ${chrome_options}=    Configurar Opções do Chrome
    Abrir Navegador Chrome    ${chrome_options}
    Go To    ${SITE_URL}
    Esperar Página Carregar
    Clicar em Link de Login
    Esperar Página Carregar
    Preencher Campo de E-mail
    Preencher Campo de Senha
    Clicar em Botão de Login
    Esperar Página Carregar
    Verificar texto login realizado
    Close All Browsers

Cenário 2: Testando Robot
    [Tags]  Teste3
    ${chrome_options}=    Configurar Opções do Chrome
    Abrir Navegador Chrome    ${chrome_options}
    Go To    ${SITE_URL}
    Esperar Página Carregar
    Clicar em Link de Login
    Esperar Página Carregar
    Preencher Campo de E-mail
    Preencher Campo de Senha
    Clicar em Botão de Login
    Esperar Página Carregar
    Verificar texto login realizado
    Close All Browsers

Cenário 3: Testando valor no teste
    [Tags]  Teste3
    ${chrome_options}=    Configurar Opções do Chrome
    Abrir Navegador Chrome    ${chrome_options}
    Go To    ${SITE_URL}
    Esperar Página Carregar
    Clicar em Link de Login
    Esperar Página Carregar
    Preencher Campo de E-mail
    Preencher Campo de Senha
    Clicar em Botão de Login
    Esperar Página Carregar
    Verificar texto login realizado
    Close All Browsers
