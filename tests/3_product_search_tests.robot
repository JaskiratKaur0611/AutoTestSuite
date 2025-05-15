*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/variables/global_variables.robot
Resource   ../resources/keywords/self_healing.robot
Resource   ../resources/keywords/ss_video.robot
Resource   ../resources/keywords/ss_video.robot
Library    ../video_recorder.py

*** Test Cases ***
User Can View Phones Category
    Start Screen Recording
    sleep    5s
    Open Browser    ${URL}    ${BROWSER}
    MAXIMIZE BROWSER WINDOW
    sleep    2s
    Smart Click    xpath://a[text()='Phones']
    Wait Until Page Contains Element    xpath://h4[@class='card-title']
    sleep    2s
    Page Should Contain    Samsung galaxy s6
    sleep    1s
    Close Browser
    sleep    5s
    Stop Screen Recording

