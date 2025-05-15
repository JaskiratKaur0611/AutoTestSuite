*** Settings ***
Library    DatabaseLibrary
Resource   ../resources/keywords/db_keywords.robot
Resource   ../resources/variables/global_variables.robot
Resource   ../resources/keywords/ss_video.robot
Resource   ../resources/keywords/ss_video.robot
Library    ../video_recorder.py

*** Test Cases ***
Validate User Info In DB
#    Start Screen Recording
    sleep    3s
    Connect To Database Postgres
    Verify User Exists In Database
    Disconnect From Database Postgres
    sleep    2s
#    Stop Screen Recording

