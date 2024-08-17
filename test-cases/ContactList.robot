*** Settings ***
Resource   ../configs/EnvDetails.robot
Library               RequestsLibrary
Library               OperatingSystem

Documentation   This suite includes all API Testing Tests
*** Variables ***
${HEADERS}     Content-Type=application/json
${RESOURCE}    /contacts


*** Test Cases ***
Verify User is able to view Contacts
     # Create a session
    Create Session    my_session    ${BASE_API}

    # Send GET request
    ${response}=    GET On Session    my_session    ${RESOURCE}

    # Check the response status code
    Should Be Equal As Numbers    ${response.status_code}    200

    # Log the response content
    Log    ${response}

    # Optionally parse JSON response
#    ${response_json}=    Evaluate    ${response.json()}    json
#    Log    ${response_json}