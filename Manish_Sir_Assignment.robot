*** Settings ***
Library           SeleniumLibrary
Resource          loginfile.txt
Library           String
Library           OperatingSystem
Library           Collections
Resource          logintxt.txt

*** Variables ***

*** Test Cases ***
TC1
    Open Browser    https://testng.org/doc/index.html    chrome
    @{Links}    Get WebElements    //div[@id="topmenu"]/table/tbody/tr/td
    ${length}    Get Length    ${Links}
    Log    ${length}
    FOR    ${i}    IN    @{Links}
        ${text}=    Get Text    ${i}
        Log To Console    ${text}
    END
    ${elements}    Get Webelement    //td[@class="current"]
    ${bg color}    Call Method    ${elements}    value_of_css_property    background-color
    Log To Console    ${bg color}
    FOR    ${i}    IN    @{Links}
        ${text}=    Get Text    ${i}
        Exit For Loop If    '${text}'=='JavaDoc'
        Log To Console    ${text}
    END
    Click Link    //a[text()="JavaDoc"]

TC2
    Open Browser    https://www.flipkart.com/    chrome
    @{links}    Get WebElements    //a
    ${count}    Get Length    ${links}
    Log To Console    ${count}
    @{text_box}    Get WebElements    //*[@type="text"]
    ${count1}    Get Length    ${text_box}
    Log To Console    ${count1}
    @{button}    Get WebElements    //button
    ${count2}    Get Length    ${button}
    Log To Console    ${count2}

TC3
    Open Browser    https://opensource-demo.orangehrmlive.com/index.php/auth/login    chrome
    Title Should Be    OrangeHRM
    Page Should Contain Element    //div[contains(text(),"LOGIN")]
    Page Should Contain Element    id=divUsername
    Page Should Contain Element    id=divPassword
    Page Should Contain Element    id=btnLogin
    @{list}    ReadingFile
    ${Id}    Collections.Get From List    ${list}    0
    ${Pass}    Collections.Get From List    ${list}    1
    Log To Console    ${Id}
    Log To Console    ${Pass}
    Input Text    id=txtUsername    ${Id}
    Input Text    id=txtPassword    ${Pass}
    Click Button    id=btnLogin
    Page Should Contain Element    //a[contains(text(),"Welcome")]

*** Keywords ***
ReadingFile
    ${fp}    OperatingSystem.Join Path    ${CURDIR}    loginfile.txt
    ${fc}=    Get File    ${fp}
    ${checkDataType}=    Evaluate    type($fc).__name__
    @{fc_list}    Split String    ${fc}    \n
    [Return]    @{fc_list}
