*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Add Product To Cart
    Click Element    xpath://a[text()='Laptops']
    Wait Until Page Contains    Sony vaio i5
    Click Element    xpath://a[text()='Sony vaio i5']
    Click Button    xpath://a[text()='Add to cart']
    Sleep    3
    Handle Alert
