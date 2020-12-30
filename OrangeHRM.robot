*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
T1
    Open Browser    https://opensource-demo.orangehrmlive.com/index.php/auth/login    chrome
    Input Text    id=txtUsername    Admin
    Input Text    name=txtPassword    admin123
    Click Button    id=btnLogin
    Close Browser
