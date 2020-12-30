*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
t1
    Open Browser    https://www.google.com/    chrome
    Input text    //input[@type="text"]    pubg
    Click Button    //div[@class="FPdoLc tfB0Bf"]//following::input
