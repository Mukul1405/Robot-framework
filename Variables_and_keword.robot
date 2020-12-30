*** Settings ***
Library           Selenium2Library
Library           Collections

*** Variables ***
${name}           Mukul    # name of person
@{Fruits}         Apple    Mango    Papaya    Strawberry
&{PriceList}      Apple=100    Cherries=150    Orange=80

*** Test Cases ***
Testcase1
    log    "Hello I am ${name}"
    ${name2} =    Set Variable    Aakash
    log    ${name2}
    Set Global Variable    ${name3}    DevilOp
    log    ${Fruits}
    @{Coding Languages}    Create List    C    C++    Java    Python
    log    ${Coding Languages}
    Set Global Variable    @{Veg}    Potato    Cauliflower    Carrot    Onion
    log    ${PriceList}
    &{Rank}    Create Dictionary    Mukul=2    Aakash=1    Rishabh=3
    log    ${Rank.Mukul}
    Set Global Variable    &{Rating}    Pubg=4.4    ClashOfClans=4.2    FreeFire=4.3
    log    ${Rating}
    Dictionary Should Contain Value    ${Rating}    4.4    I am not in dictionary
    ${val}=     Get From Dictionary    ${Rating}    Pubg
    ${var}=    Function    10    2
    ${for}=    ForImplementation

Testcase2
    log    ${name}
    log    ${name3}
    log    ${Veg}
    log    ${Rating.Pubg}
    Open Browser    https://www.google.co.in    chrome

*** Keywords ***
Function
    [Arguments]    ${var1}    ${var2}
    Run Keyword And Return If    ${var1}==1    log    Ist var value is 1
    ${var3}    Set Variable If    ${var2}==2    3
    [Return]    ${var3}

ForImplementation
    FOR    ${i}    IN RANGE    10
        log    ${i}
    END
