*** Settings ***
Library           Selenium2Library
Library           OperatingSystem
Library           String
Library           Collections
Resource          L3--Palindrome.txt

*** Variables ***
@{values}         1    2    3    4
@{key}            A    B    C    D

*** Test Cases ***
Palindrome Check
    @{list}=    ReadingFile
    IsPalindrome    @{list}

List to dictionary
    &{dict}    Create Dictionary
    ${len}=    Get Length    ${key}
    FOR    ${i}    IN RANGE    ${len}
        Set To Dictionary    ${dict}    ${key[${i}]}    ${values[${i}]}
    END
    log    ${dict}
    ${a}=    Evaluate    ${10}%2

*** Keywords ***
ReadingFile
    ${fp}    OperatingSystem.Join Path    ${CURDIR}    L3--Palindrome.txt
    ${fc}=    Get File    ${fp}
    ${checkDataType}=    Evaluate    type($fc).__name__
    @{fc_list}    Split String    ${fc}    \n
    [Return]    @{fc_list}

IsPalindrome
    [Arguments]    @{List}
    ${len}=    Get Length    ${List}
    FOR    ${i}    IN RANGE    ${len}-1
        ${var}=    Get From List    ${List}    ${i}
        @{char}=    Split String To Characters    ${var}
        @{revChar}=    Copy List    ${char}
        Reverse List    ${char}
        ${val ans}    Set Variable If    ${char}==${revChar}    True    False
        log    ${val ans}
    END
