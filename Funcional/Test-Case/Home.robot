*** Settings ***
Resource          ../Resource/Resource.robot
resource          ../Resource/Pages/Login.robot

Test Setup        Abrir navegador
Test Teardown     Fechar navegador