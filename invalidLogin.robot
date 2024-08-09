*** Settings ***
Documentation        A test with a single test for valid login
Library        SeleniumLibrary
...        This test has a workflow that is created using keywords in
...        The imported resource file
Resource        resource.robot

*** Variables ***
${browser}        chrome

*** Test Cases ***        username        password
invalid_username Test
    [Documentation]        Test with an invalid username
    Open Browser With Login Page
    Login With Invalid Credentials Should Be Fail        ${invalid_username}        ${valid_password}

invalid_password Test
    [Documentation]        Test with an invalid password
    Open Browser With Login Page
    Login With Invalid Credentials Should Be Fail        ${valid_username}        ${invalid_password}

invalid_username and invalid_password Test
    [Documentation]        Test with an invalid username and password
    Open Browser With Login Page
    Login With Invalid Credentials Should Be Fail        ${invalid_username}        ${invalid_password}

Empty_username Test
    [Documentation]        Test with an empty username
    Open Browser With Login Page
    Login With Invalid Credentials Should Be Fail        ${EMPTY}        ${valid_password}

Empty_password Test
    [Documentation]        Test with an empty password
    Open Browser With Login Page
    Login With Invalid Credentials Should Be Fail        ${valid_username}        ${EMPTY}

Empty_username And Empty_password Test
    [Documentation]        Test with an empty username and password
    Open Browser With Login Page
    Login With Invalid Credentials Should Be Fail        ${EMPTY}        ${EMPTY}


*** Keywords ***

Open Browser With Login Page
    Open Browser        ${url}        ${browser}

Login with Invalid credentials should be fail
    [Arguments]        ${username}        ${password}
    Input Text        name:username        ${username}
    Input Password        name:password        ${password}
    Submit Login Form

Submit Login Form
    Wait Until Element Is Visible        xpath://button[@id='login-button']
    Scroll Element Into View    xpath://button[@id='login-button']
    Click Button    xpath://button[@id='login-button']
    Close Browser

