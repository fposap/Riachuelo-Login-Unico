*** Settings ***
Resource          ../Resource/Resource.robot
resource          ../Resource/Pages/Login.robot

Test Setup        Abrir navegador
Test Teardown     Fechar navegador

*** Test Cases ***
#Historia XXX - Cenário de Erro de Autenticação
Cenario 1: Preencher os campos para logar com erro
    Dado que estou na pagina de Login
    Quando preencho as informações com erro
    Então é exibida a mensagem de erro "Usuário inválido"

#Historia XXX - Cenário de Sucesso de Autenticação
Cenario 2: Preencher os campos para logar com sucesso
    Dado que estou na pagina de Login 
    Quando preencho os campos user e senha
    Então é exibido o nome do Usuário no cabeçalho "Fernando Pinheiro de Oliveira"