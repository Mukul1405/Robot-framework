*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
t1
    Open Browser    https://www.geeksforgeeks.org/    chrome
    Click Element    //li[contains(text(),"Tutorials")]
    Sleep    5s
    Click Element    //li/following::span[contains(text(),"Algorithms")]
