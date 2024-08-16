*** Settings ***
Resource   ../../configs/EnvDetails.robot
Resource   ../../configs/BrowserDetails.robot
Resource   ../../configs/ApplicationVariables.robot
Resource   ../../CommonDirectory.robot

Library    SeleniumLibrary
Library    String
Library    OperatingSystem
Library    DateTime
Library    Screenshot


*** Keywords ***
Take Full Page Screenshot
   [Documentation]
   ...  The Following Keyword Takes Full Page Screenshot ...
   [Arguments]   ${SCREENSHOT_NAME}
   # Check if the directory exists
    #Get Current Date in %Y-%m-%d format
    ${current_date}=  Get Current Date  result_format=%Y-%m-%d
    #Get Epooch Time
    ${epooch_time}    Get Time    epoch
    #Convert the date time to string
    ${string_curr_date}=    Convert To String   ${current_date}

    ${dir_exists}=  Run Keyword And Return Status  Directory Should Exist  ${SCREENSHOT_DIR}
    Run Keyword If  '${dir_exists}' == 'False'  Create Directory  ${SCREENSHOT_DIR}
    #Create a Subfolder
    ${SUBFOLDER_DIRECTORY}=    Catenate   SEPARATOR=   ${SCREENSHOT_DIR}   /    ${string_curr_date}
    ${subdir_exists}=   Run Keyword And Return Status  Directory Should Exist  ${SUBFOLDER_DIRECTORY}
    Run Keyword If  '${dir_exists}' == 'False'  Create Directory  ${SUBFOLDER_DIRECTORY}
     # Define the full path for the screenshot
    ${screenshot_name} =  Catenate   SEPARATOR=--   ${SCREENSHOT_NAME}  ${string_curr_date}
    ${screenshot_updated_name}=   Catenate   SEPARATOR=   ${screenshot_name}  ${epooch_time}  ${extension}
    ${screenshot_path}=  Set Variable  ${SUBFOLDER_DIRECTORY}/${screenshot_updated_name}

    # Capture the screenshot and save it to the specified path
    Capture Page Screenshot  ${screenshot_path}
    Log  Screenshot saved at: ${screenshot_path}

Get Current Page Title
   [Documentation]
   ...  Gets the Current Page Title and Returns it  ...
   ${page_title}=    Get Title
   Return From Keyword    ${page_title}

Get Random Text
     [Documentation]
	...  Return random text value  ...
      
    ${randomText}    Generate Random String      8      [LETTERS]
    Return From Keyword     ${randomText}
 
      
Get Current Epoch Time
     [Documentation]
	 ...  Return current epoch time  ...
    
    ${randomText}    Get Time    epoch
    Return From Keyword     ${randomText}
