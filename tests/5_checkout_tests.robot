*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/variables/global_variables.robot
Resource   ../resources/keywords/self_healing.robot
Resource   ../resources/keywords/ss_video.robot
Resource   ../resources/keywords/ss_video.robot
Library    ../video_recorder.py

*** Test Cases ***
User Can Place Order
    Start Screen Recording
    sleep    5s
    Open Browser    ${URL}    ${BROWSER}
    MAXIMIZE BROWSER WINDOW
    sleep    2s
    Smart Click    xpath://a[text()='Cart']
    Click Button    xpath://button[text()='Place Order']
    Wait Until Element Is Visible    id:name    5s
    Smart Input Text    id:name    John Doe
    Smart Input Text    id:country    USA
    Smart Input Text    id:city    New York
    Smart Input Text    id:card    1234567890
    Smart Input Text    id:month   04
    Smart Input Text    id:year    2025
    sleep    2s
    Click Button    xpath://button[text()='Purchase']
    Wait Until Page Contains    Thank you for your purchase!
    Click Button    xpath://button[text()='OK']
    Close Browser
    sleep    5s
    Stop Screen Recording

