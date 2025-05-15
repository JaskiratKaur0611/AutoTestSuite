*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    Process

#*** Variables ***
#${SCREENSHOT_DIR}   ../results/screenshots

*** Keywords ***
Start Screen Recording
    Run Process    python    video_recorder.py    start

Stop Screen Recording
    Run Process    python    video_recorder.py    stop

#Capture Screenshot On Failure
#    ${timestamp}=    Get Time    %Y-%m-%d_%H-%M-%S
#    Capture Page Screenshot    ${SCREENSHOT_DIR}/screenshot_${timestamp}.png