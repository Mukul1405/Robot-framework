*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
T1
    Open Browser    https://www.amazon.in/    chrome
    Click Link    id=nav-link-accountList
    Input text    id=ap_email    mukulaggarwal1234@gmail.com
    Click Button    id=continue
    Input text    id=ap_password    Mukul@1234
    Click Button    id=signInSubmit
    sleep    3s
    Input Text    id=twotabsearchtextbox    Samsung Phones
    Click Button    //input[@type="submit"]
    sleep    5s
    Input text    //input[@name="low-price"]    5000
    Input text    //input[@name="high-price"]    10000
    Click Button    //input[@type="submit" and @class="a-button-input"]
    @{price}    Get WebElements    //span[@class="a-price-whole"]
    FOR    ${i}    IN    @{price}
        ${text}=    Get Text    ${i}
        Log To Console    ${text}
    END
