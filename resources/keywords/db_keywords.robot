*** Settings ***
Library    DatabaseLibrary

*** Variables ***
${DB_NAME}         ecommerce
${DB_USER}         postgres
${DB_PASSWORD}     Jasimasi@123
${DB_HOST}         localhost
${DB_PORT}         5432
${DB_API_MODULE}   psycopg2

*** Keywords ***
Connect To Database Postgres
    Connect To Database    psycopg2    ${DB_NAME}    ${DB_USER}    ${DB_PASSWORD}    ${DB_HOST}    ${DB_PORT}

Disconnect From Database Postgres
    Disconnect From Database

Verify User Exists In Database
    ${USERNAME}=    Set Variable    john_doe
    ${query}=       Set Variable    SELECT * FROM users WHERE username='${USERNAME}'
    ${result}=      Query    ${query}
    Should Not Be Empty    ${result}


