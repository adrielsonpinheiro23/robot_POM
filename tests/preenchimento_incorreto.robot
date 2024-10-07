*** Settings ***
Resource          ../resources/main.robot
Test Setup        Given I access Organo
Test Teardown     And I close Organo

*** Test Cases ***
TC2: Verificar o não preenchimento de campos obrigatorios
    Given I click on create card button
    Then The System should present a message for mandatory fields