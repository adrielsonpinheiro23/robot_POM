*** Settings ***
Library    SeleniumLibrary
Resource   ../main.robot

*** Variables ***
${URL}                    http://localhost:3000/

*** Keywords ***
I access Organo
    Open Browser      url=${URL}  browser=Chrome

I close Organo
    Close Browser