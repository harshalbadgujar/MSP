*** Settings ***
Library    AppiumLibrary
Library    String
Library	   OperatingSystem
Resource    ../Global Keyword.robot
Resource    ../Connect to DB/db.robot
Resource    ../../Locator/OTPPage.resource
Resource    ../../Locator/HomePage.resource
Resource    ../../Locator/Login.resource


*** Keywords ***
Login
    [Arguments]  ${Mobile}
    ${status1}    Run Keyword And Return Status    WAIT UNTIL ELEMENT IS VISIBLE   ${Enterpasscodetext}     10S
      run keyword If  ${status1}   sleep   3s
      Run Keyword If  ${status1}  Tap  ${backbtnonpasspage}

    #${status}    Run Keyword And Return Status    WAIT UNTIL ELEMENT IS VISIBLE   //XCUIElementTypeButton[@name="Don’t Allow"]   5s
    #Run Keyword If    "${status}"=="True"      TAP    //XCUIElementTypeButton[@name="Don’t Allow"]
    #WAIT UNTIL ELEMENT IS VISIBLE    //XCUIElementTypeButton[@name="Allow"]
    #Tap     //XCUIElementTypeButton[@name="Allow"]
    #${status}    Run Keyword And Return Status    WAIT UNTIL ELEMENT IS VISIBLE   //XCUIElementTypeStaticText[@name="ENTER PASSCODE"]   5s
    #Run Keyword If    ${status}      TAP  //XCUIElementTypeButton[@name="Back"]
#     Tap     //XCUIElementTypeButton[@name="Allow"]
    #${status}    Run Keyword And Return Status    WAIT UNTIL ELEMENT IS VISIBLE   id=SKIP   5s
    #Run Keyword If    "${status}"=="True"      TAP    id=SKIP
    wait until element is visible    ${Signinbtn}    10s
    Tap   ${Signinbtn}
    wait until element is visible    ${mobilefield}   10s
    Tap    ${mobilefield}
    Input text   ${mobilefield}    ${Mobile}
    wait until element is visible    ${loginbutton}    10s
    Tap   ${loginbutton}
    sleep  2s
    ${statusOTP}    Run Keyword And Return Status    WAIT UNTIL ELEMENT IS VISIBLE    	${LocateOTPPrefix}    10s
    run keyword if     ${statusOTP}     sleep   3s
    Run Keyword If    ${statusOTP}    Enter OTP
    Enter Passcode
    Allow Permission

To verify register with relogin
    [Arguments]    ${Mobile}
    wait until element is visible    ${Signinbtn}    10s
    Tap   ${Signinbtn}
    wait until element is visible    ${mobilefield}    10s
    Tap    ${mobilefield}
    Input text   ${mobilefield}     ${Mobile}
    wait until element is visible    ${loginbutton}   10s
    Tap   ${loginbutton}
    ${statusOTP}    Run Keyword And Return Status    WAIT UNTIL ELEMENT IS VISIBLE   ${LocateOTPPrefix}    10s
    Run Keyword If    "${statusOTP}"=="True"    Enter OTP
    Enter Passcode
    Wait until element is visible    ${Hamburgerbtn}    20s
    Capture Page Screenshot    Registration_Success.png

Enter unregister number
# Condition check if user is on enterpasscode page
    ${check}    Run Keyword And Return Status    WAIT UNTIL ELEMENT IS VISIBLE   ${Enterpasscodetext}     10S
      run keyword If  ${check}   sleep   3s
      #click on back arrow button on enterpasscode page
      Run Keyword If  ${check}  Tap  ${backbtnonpasspage}
      wait until element is visible    ${Signinbtn}    10s
      #click on signin button on landing page
      Tap   ${Signinbtn}
      wait until element is visible    ${mobilefield}   10s
      #Click on the mobilenumber field
      Tap    ${mobilefield}
      #Input Mobilenumber in field
      Input text   ${mobilefield}    090000009
      wait until element is visible  ${loginbutton}     3s
      #click on login button on signin page
      tap    ${loginbutton}
      wait until element is visible   ${errormsg}     5s
      #get the error msg written on the popoup
      ${geterrormsg}   get text  ${errormsg}
      #print the msg in logs
      log   ${geterrormsg}
      #click on the Ok button on the error popup
      tap   ${okerrorpopup}
      #compare the error msg
      ${checkmsg}    Run keyword and return status     should be equal  ${saveerrormsg}       ${geterrormsg}
      run keyword if    ${checkmsg}     log to console     The error msg is correct
      run keyword if     ${checkmsg} == "False"     log to console  The error msg is not correct


