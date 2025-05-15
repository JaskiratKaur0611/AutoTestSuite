*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/variables/global_variables.robot
Resource   ../resources/keywords/self_healing.robot
Resource   ../resources/keywords/ss_video.robot
Resource   ../resources/keywords/ss_video.robot
Library    ../video_recorder.py

*** Test Cases ***
Verify Order Confirmation Message
    Start Screen Recording
    sleep    5s
    Open Browser    ${URL}    ${BROWSER}
    maximize browser window
    sleep    2s
    Smart Click    xpath://a[text()='Cart']
    Click Button    xpath://button[text()='Place Order']

    Sleep    1s
    Wait Until Element Is Visible    id:name    5s
    Smart Input Text    id:name    Test Name

    Smart Input Text    id:country    USA
    Smart Input Text    id:city       New York
    Smart Input Text    id:card       1234567890
    Smart Input Text    id:month      04
    Smart Input Text    id:year       2025

    Click Button    xpath://button[text()='Purchase']
    Page Should Contain    Thank you for your purchase!
    Close Browser
    sleep    5s
    Stop Screen Recording
