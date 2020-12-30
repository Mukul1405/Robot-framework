*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
t1
    Open Browser    https://www.amazon.in/    chrome
    Click Link    id=nav-link-accountList
    Input text    id=ap_email    mukulaggarwal1234@gmail.com
    Click Button    id=continue
    Input text    id=ap_password    Mukul@1234
    Click Button    id=signInSubmit
    sleep    5s
    Click Link    //a[@id="nav-hamburger-menu"]
    sleep    5s
    Click Link    //a[@data-menu-id="17"]
    Click Link    //a[@class="hmenu-item" and text()="All Books"]
    sleep    5s
    SeleniumLibrary.Select Checkbox    //input[@name="s-ref-checkbox-9141482031"]
    sleep    5s
    Input text    //input[@name="low-price"]    200
    Input text    //input[@name="high-price"]    900
    Click Button    //input[@type="submit" and @class="a-button-input"]
    sleep    5s
    Click Element    //span[contains(text(),'Chetan Bhagat') and @class="a-size-base a-color-base"]
    sleep    5s
    Click Element    //span[contains(text(),'One Arranged Murder')]
    sleep    8s
    Click Button    //a[@id='hlb-view-cart-announce']
    Click Element    //a[@id='dropdown1_2']
