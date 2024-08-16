*** Settings ***
Resource   ../page-objects/LoginPo.robot
Library    ../../resources/MultiBrowserWebDriver.py
Library    SeleniumLibrary

Documentation   This suite includes login tests


*** Keywords ***
Open New Browser
   [Arguments]  ${URL}  ${BROWSER}   ${TIMEOUT}
   Download And Set Up Drivers
   # Set the global Selenium timeout to 10 seconds
   Set Selenium Timeout  ${TIMEOUT}
   #Open Browser Instance
   Open Browser  ${URL}  ${BROWSER}
   #Maximize Browser Window
   Maximize Browser Window

Close Current Browser
   Close Browser