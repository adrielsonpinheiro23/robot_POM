*** Settings ***
Resource          ../resources/main.robot
Test Setup        Given I access Organo
Test Teardown     And I close Organo


*** Test Cases ***
TC1: Preencher os Campos do formulário e verificar
    Given I fill the form fields
    When I click on create card button
    Then I identify the card in the respective team

TC2: Verificar se é possivel criar mais de um card
    Given I create "3" cards in the respective team

TC3: Criar um card para cada time disponivel
    Given I fill the form fields
    Then I create and identify the card for each available team