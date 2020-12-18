*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${LOGIN_URL}                    http://comercial-uat.riachuelo.net/portal/#/login

${Login-FIELD_EMAIL}      xpath=//*[@id="user"]
${Login-FIELD_SENHA}      xpath=/html/body/app-root/app-login/div/div/form/div/div/div[3]/app-input-container/div/span/span/input
${Login-BUTTON_SUBMIT}    xpath=/html/body/app-root/app-login/div/div/form/div/div/div[4]/button/span

${Login-ALERTA_ERRO}      xpath=/html/body/app-root/app-login/p-confirmdialog/div/div[2]/span

*** Keywords ***
#Pre-condição
Dado que estou na pagina Login
    Go To    ${HOME_URL}
    SET SELENIUM IMPLICIT WAIT   5
    #Title Should Be    ${HOME_TITLE_TEXT}

#AUTENTICAÇÃO COM ERRO
Quando preencho as informações com erro
      Input Text       ${Login-FIELD_EMAIL}     123456
      Input password   ${Login-FIELD_SENHA}     abacaxi     
      Click Element    ${Login-BUTTON_SUBMIT}

Então é exibida a mensagem de erro "${mensagemErro}"
    Wait Until Element Is Visible        ${Login-ALERTA_ERRO}   
    Element Text Should Be               ${Login-ALERTA_ERRO}          ${mensagemErro}