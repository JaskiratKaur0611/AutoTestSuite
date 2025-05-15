*** Settings ***
Library    SeleniumLibrary
Resource   ../variables/global_variables.robot

*** Keywords ***
Open Login Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    id:login2

Login With Valid Credentials
    Click Element    id:login2
    Sleep    2
    Input Text    id:loginusername    ${USERNAME}
    Input Text    id:loginpassword    ${PASSWORD}
    Click Button    xpath://*[@onclick='logIn()']
    Wait Until Element Contains    id:nameofuser    Welcome ${USERNAME}    15s

Close Browser Session
    Close Browser
