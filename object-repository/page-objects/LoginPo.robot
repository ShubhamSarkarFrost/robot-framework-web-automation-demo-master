*** Settings ***
Resource    ../locators/LoginPageLocators.robot
Resource   ../../configs/BrowserDetails.robot
Library    SeleniumLibrary


*** Keywords ***
Login To The Application
    [Arguments]   ${username}   ${password}
	Enter Username    ${username}
	Enter Password    ${password}
	Click Submit Button



Enter Username
   [Arguments]  ${Username}
   Wait Until Page Contains Element    ${usernameTextBox}     timeout= ${PAGE_TIMEOUT}
   Element Should Be Visible     ${usernameTextBox}
   Input Text    ${usernameTextBox}    ${Username}

Enter Password
    [Arguments]  ${Password}
    Wait Until Page Contains Element    ${passwordTextBox}       timeout= ${PAGE_TIMEOUT}
    Element Should Be Visible    ${passwordTextBox}
    Input Text    ${passwordTextBox}   ${Password}


Click Submit Button
   Wait Until Page Contains Element    ${loginButton}      timeout= ${PAGE_TIMEOUT}
   Element Should Be Enabled    ${loginButton}
   Click Element    ${loginButton}


Verify Cart Icon is Visible
   Wait Until Page Contains Element    ${carticon}               timeout= ${PAGE_TIMEOUT}
