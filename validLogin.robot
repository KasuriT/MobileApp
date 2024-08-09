*** Settings ***
Documentation        A test with a single test for valid login
Library        SeleniumLibrary
...        This test has a workflow that is created using keywords in
...        The imported resource file
Resource        resource.robot

*** Variables ***
${browser}        chrome

*** Test Cases ***
Sapphire Valid Login
    [Documentation]    Validate successful login with valid credentials
    Open Browser With Login Page
    Fill Login Form
    Submit Login Form
    [Teardown]        Close Browser

Verify the title of login window
    Verify Window Title

*** Keywords ***
Open Browser With Login Page
    Open Browser        ${url}        ${browser}

Fill Login Form
    Input Text        name:username        ${valid_username}
    Input Password        name:password        ${valid_password}

Submit Login Form
    Wait Until Element Is Visible        xpath://button[@id='login-button']
    Scroll Element Into View    xpath://button[@id='login-button']
    Click Button    xpath://button[@id='login-button']

Verify Window Title
    [Documentation]        Verify Window Title
    Open Browser        ${url}        ${browser}
    ${actual_title}=        Get Title
    Should Be Equal As Strings        ${actual_title}        Login - Sapphire Studios