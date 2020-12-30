*** Settings ***
Library           Selenium2Library
Library           DateTime
Library           String
Library           OperatingSystem
Library           BuiltIn

*** Test Cases ***
Log
    Log    Hello World
    Log    Mukul

Comment
    Comment    Hey I am using Comment

Fail
    Fail    Testcase Failed

Date Time
    ${date1} =    Convert Date    2014-06-11 10:07:42.000
    ${date2} =    Convert Date    20140611100742    result_format=timestamp

String
    ${str1} =    Convert To Lower Case    Abc
    ${str2} =    Convert To Upper Case    Abc

BuiltIn
    ${str1} =    Catenate    Hello    Mukul
    Log    ${str1}
    ${str2} =    Catenate    SEPARATOR=---    Hello    Mukul
    ${ctbinary}=    Convert To Binary    10
    ${ctbytes}=    Convert To Bytes    10
    ${ctHex}=    Convert To Hex    255
    ${ctNumber}    Convert To Number    84.67981    1
    ${getlength}=    Get Length    Hello there
    ${time}=    Get Time

Operating System
    Append To Environment Variable    Name    first
    Append To Environment Variable    Name    second    third
