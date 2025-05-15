*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Smart Click
    [Arguments]    ${locator}
    ${status}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${locator}    timeout=5s
    IF    '${status}' == 'False'
        Log    Element not visible, refreshing page...
        Reload Page
        Wait Until Element Is Visible    ${locator}    timeout=5s
    END
    Click Element    ${locator}

Smart Input Text
    [Arguments]    ${locator}    ${text}
    ${status}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${locator}    timeout=5s
    IF    '${status}' == 'False'
        Log    Element not visible, refreshing page...
        Reload Page
        Wait Until Element Is Visible    ${locator}    timeout=5s
    END
    Input Text    ${locator}    ${text}
