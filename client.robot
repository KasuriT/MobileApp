*** Settings ***
Documentation        View campaign details
Library        SeleniumLibrary
Resource        ../test/resource.robot
Resource        ../test/validLogin.robot

*** Variables ***
${browser}        chrome
${url}        https://testing.sapphireapps.com/authentication/login/
${valid_username}        agency@sapphireapps.com
${valid_password}        j*1N7iEF7T%O
${client_page}        xpath:(//span[normalize-space()='Clients'])[1]
${page_title}        Sapphire Studios  - Clients


*** Test Cases ***

Sapphire Valid Login
    [Documentation]    Validate successful login with valid credentials
    Open Browser With Login Page
    Fill Login Form
    Submit Login Form
    [Teardown]        Close Browser
    
Create client profile
    [Documentation]    Verify the client profile
    Open Browser With Login Page
    Fill Login Form
    Submit Login Form
    Navigate to client page
    #[Teardown]        Close Browser
    
Verify the page title
    Verify the page title of client page

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

Navigate to client page
    Click Element        ${client_page}
    
Verify the page title of client page
    Title Should Be        ${page_title}