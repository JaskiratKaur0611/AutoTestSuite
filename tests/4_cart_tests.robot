*** Settings ***
Library           SeleniumLibrary
Resource   ../resources/keywords/self_healing.robot
Resource   ../resources/keywords/ss_video.robot
Resource   ../resources/keywords/ss_video.robot
Library    ../video_recorder.py

*** Variables ***
${URL}            https://www.demoblaze.com/
${BROWSER}        chrome

*** Test Cases ***
User Can Add Product To Cart
    Start Screen Recording
    sleep    5s
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    sleep    2s
    Wait Until Page Contains Element    xpath=//a[text()='Samsung galaxy s6']    5s
    Smart Click    xpath=//a[text()='Samsung galaxy s6']
    Wait Until Page Contains Element    xpath=//a[text()='Add to cart']    5s
    Smart Click    xpath=//a[text()='Add to cart']
    Sleep    2s
    Handle Alert
    [Teardown]    Close Browser
    sleep    3s
    Stop Screen Recording

