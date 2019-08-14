*** Setting ***
Library           Selenium2Library

*** Test Cases ***
Login facebook
    Open facebook by Chrome
    Log in facebook    optimus243prime@gmail.com    eagleeye

*** Keywords ***
Open facebook by Chrome
    Open Browser    http://www.facebook.com    chrome
    Wait Until Page Contains    Log In

Log in facebook
    [Arguments]    ${email}    ${password}
    Input Text    email    ${email}
    Input Password    pass    ${password}
    Click Button    Log In
    Wait Until Page Contains    shailaja
    Click Element    class:_3ixn
    Click Element    id:userNavigationLabel
    Wait Until Page Contains    Log Out
    Submit Form    //*[@class="_w0d _w0d"]
    Wait Until Page Contains    Log In
    Close Browser