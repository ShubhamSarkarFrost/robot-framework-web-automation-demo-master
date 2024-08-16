*** Settings ***
Resource   ../object-repository/page-objects/LoginPo.robot
Resource   ../object-repository/page-objects/BrowserFunc.robot
Resource   ../configs/EnvDetails.robot
Resource   ../configs/BrowserDetails.robot
Resource   ../object-repository/page-objects/CommonPo.robot
Library    SeleniumLibrary
Suite Setup      Open New Browser  ${SWAG_LABS_URL}  ${BROWSER}  ${SELENIUM_TIMEOUT}
Suite Teardown   Close Browser



Documentation   This suite includes login tests

*** Test Cases ***
Navigate to Swag Labs Website and Verify Page Title
   [Documentation]  Open a website and verify Page Title.
   ${current_page_title}=  Get Current Page Title
   Should Be Equal    ${current_page_title}    ${SWAG_LABS_TITLE}
   Take Full Page Screenshot   ${TEST NAME}


Enter Valid Username and Password in SauceLabs Login Page
    [Documentation]  Open Sauce Labs Website and Login with Valid Details.
    Login To The Application   ${STANDARD_USERNAME}    ${PASSWORD}
    Verify Cart Icon is Visible
    Take Full Page Screenshot   ${TEST NAME}




