*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
Open Amazon
    Open Browser    https://www.amazon.com/    chrome
    input
    Click Link    //a[contains(text(),'Under $25')]
    Click Link    //span[@id='a-autoid-0-announce']

*** Keywords ***
input
    Input Text    id=twotabsearchtextbox    Dumbells
    Click Button    //input[@type='submit']
