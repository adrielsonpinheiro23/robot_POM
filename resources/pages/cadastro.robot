*** Settings ***

Resource    ../main.robot

*** Variables ***
${BOTAO_CARD}             id:form-botao
${ERRO_NOME}          id:form-nome-erro
${ERRO_CARGO}         id:form-cargo-erro
${ERRO_TIMES}         id:form-times-erro

${CAMPO_NOME}             id:form-nome
${CAMPO_CARGO}            id:form-cargo
${CAMPO_IMAGEM}           id:form-imagem
${CAMPO_TIME}             class:lista-suspensa
${BOTAO_CARD}             id:form-botao
@{SELECIONAR_TIMES}        
...      //option[contains(.,'Programação')]
...      //option[contains(.,'Front-End')]
...      //option[contains(.,'Data Science')]
...      //option[contains(.,'Devops')] 
...      //option[contains(.,'UX e Design')]
...      //option[contains(.,'Mobile')]
...      //option[contains(.,'Inovação e Gestão')]

*** Keywords ***
I fill the form fields
    ${nome}        FakerLibrary.first_name
    ${cargo}       FakerLibrary.Job
    ${imagem}      FakerLibrary.Image Url    #width=150    height=200
    Input Text     ${CAMPO_NOME}            ${nome}
    Input Text     ${CAMPO_CARGO}           ${cargo}
    Input Text     ${CAMPO_IMAGEM}          ${imagem}
    Click Element  ${CAMPO_TIME}    
    Click Element  ${SELECIONAR_TIMES}[5]

I click on create card button
    Click Element  ${BOTAO_CARD}

I identify the card in the respective team
    Element Should Be Visible    class:colaborador

I create "${repetition}" cards in the respective team
    FOR    ${i}    IN RANGE    0    ${repetition}
        I fill the form fields
        I click on create card button
        Log    ${i}               
    END
    Sleep    5s 

I create and identify the card for each available team
    FOR    ${i}    ${time}    IN ENUMERATE    @{SELECIONAR_TIMES}
        I fill the form fields
        Click Element    ${time}
        I click on create card button
        Log    ${i}: ${time}        
    END
    Sleep    5s

The System should present a message for mandatory fields
    Element Should Be Visible    ${ERRO_NOME}
    Element Should Be Visible    ${ERRO_CARGO}
    Element Should Be Visible    ${ERRO_TIMES}
