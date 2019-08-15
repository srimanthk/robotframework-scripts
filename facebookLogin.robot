*** Setting ***
Library           Selenium2Library
Library           XML

*** Variables ***
${XML}            C:/test/xmlData.xml
${email}          email
${password}       password

*** Test Cases ***
Login facebook
    Read from XML        ${email}    ${password}

*** Keywords ***
Read from XML
    [Arguments]    ${email}    ${password}
    ${root} =	Parse XML	${XML}
    Should Be Equal    ${root.tag}    Data
    ${email}=        Get Element	${root}	username
    ${password}=        Get Element	${root}	password
    Open facebook by Chrome
    Log in and Log out facebook    ${email.text}    ${password.text}
  
Open facebook by Chrome
    Open Browser    http://www.facebook.com    chrome
    Wait Until Page Contains    Log In

Log in and Log out facebook
    [Arguments]    ${email}    ${password}
    Input Text    email    ${email}
    Input Password    pass    ${password}
    Click Button    Log In
    Wait Until Page Contains    Home
    Click Element    class:_3ixn
    Click Element    id:userNavigationLabel
    Wait Until Page Contains    Log Out
    Submit Form    //*[@class="_w0d _w0d"]
    Wait Until Page Contains    Log In
    Close Browser
