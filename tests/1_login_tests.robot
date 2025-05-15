*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/keywords/login_keywords.robot
Resource   ../resources/keywords/ss_video.robot
Library    ../video_recorder.py
#Suite Setup    Start Video Recording
#Suite Teardown    Stop Video Recording
#Test Teardown    Capture Screenshot On Failure

*** Test Cases ***
Valid User Can Log In Successfully
    Start Screen Recording
    Sleep   1s
    Open Login Page
    Login With Valid Credentials
    Close Browser Session
    Sleep   3s
    Stop Screen Recording

