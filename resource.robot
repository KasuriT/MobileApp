*** Settings ***
Documentation    A resource file with reusable keywords and variables
...
...        The system specific keywords created here form our own
...        domain specific language. They utilize keywords provided
...        by the imported SeleniumLibrary
Library    SeleniumLibrary

*** Variables ***
${valid_username}        agency@sapphireapps.com
${valid_password}        j*1N7iEF7T%O
${url}        https://testing.sapphireapps.com/authentication/login/
${invalid_username}        Kasuri
${invalid_password}        12345
${empty_password}        ${EMPTY}
${empty_username}        ${EMPTY}
${error_message_invalid_username}        Enter a valid email
${error_message_invalid_password}        Please enter a correct Email Address and password. Note that both fields may be case-sensitive.


*** Keywords ***
open the browser with the login page
    Create Webdriver    Chrome executable_path= C:/Users/lenovo/PycharmProjects/testLogin1/test/resources/chromedriver.exe
    Go To   ${url}

