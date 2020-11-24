*** Settings ***
Library    AppiumLibrary
Library    String
Library	   OperatingSystem
Resource    ../Global Keyword.robot
Resource    ../../Locator/Register.resource

*** Keywords ***
Login with the number and click on forgot passcode
    [Arguments]    ${MobileChangePasscode}    ${Passport}
    ${check}   run keyword and return status  WAIT UNTIL ELEMENT IS VISIBLE    //XCUIElementTypeButton[@name="Allow"]
    run keyword if  ${check}    Tap     //XCUIElementTypeButton[@name="Allow"]
    ${check1}    Run Keyword And Return Status    WAIT UNTIL ELEMENT IS VISIBLE   //XCUIElementTypeStaticText[@value="ENTER PASSCODE"]   5s
    Run Keyword If    ${check1}      Tap    //XCUIElementTypeButton[@name="Back"]
    #Tap     //XCUIElementTypeButton[@name="Allow"]
    #${statusOTP}    Run Keyword And Return Status    WAIT UNTIL ELEMENT IS VISIBLE    id=title_label    10s
    #Run Keyword If    "${statusOTP}"=="True"    Enter OTP
    wait until element is visible    //XCUIElementTypeStaticText[@name="Already have an account? SIGN IN"]   10s
    Tap   //XCUIElementTypeStaticText[@name="Already have an account? SIGN IN"]
    wait until element is visible    //*[contains(@value, 'Enter your mobile no.')]   10s
    Tap    //*[contains(@value, 'Enter your mobile no.')]
    Input text   //*[contains(@value, 'Enter your mobile no.')]    ${MobileChangePasscode}
    wait until element is visible    //XCUIElementTypeStaticText[@name="SIGN IN"]   10s
    Tap   //XCUIElementTypeStaticText[@name="SIGN IN"]
    ${statusOTP}    Run Keyword And Return Status    WAIT UNTIL ELEMENT IS VISIBLE    //XCUIElementTypeStaticText[@name="prefix_otp_label"]    10s
    Run Keyword If    "${statusOTP}"=="True"    Enter OTP
    wait until element is visible  //XCUIElementTypeStaticText[@name="Forgot Passcode?"]  10s
    Tap  //XCUIElementTypeStaticText[@name="Forgot Passcode?"]
    Tap  ${PassportButton}
    sleep    3s
    Input Text  //*[contains(@value, 'Enter passport no.')]   ${Passport}
    TAP  //XCUIElementTypeButton[@name="Done"]
    Tap     //*[@value="CONTINUE"]
    ${statusOTP}    Run Keyword And Return Status    WAIT UNTIL ELEMENT IS VISIBLE    id=title_label    10s
    Run Keyword If    "${statusOTP}"=="True"    Enter OTP
     
Set the new passcode
     WAIT UNTIL ELEMENT IS VISIBLE  //XCUIElementTypeKey[@name="1"]   10s
     Tap   //XCUIElementTypeKey[@name="1"]
     Tap   //XCUIElementTypeKey[@name="2"]
     Tap   //XCUIElementTypeKey[@name="3"]
     Tap   //XCUIElementTypeKey[@name="4"]
     Tap   //XCUIElementTypeKey[@name="5"]
     Tap   //XCUIElementTypeKey[@name="6"]
      WAIT UNTIL ELEMENT IS VISIBLE  //XCUIElementTypeKey[@name="1"]   5s
     Tap   //XCUIElementTypeKey[@name="1"]
     Tap   //XCUIElementTypeKey[@name="2"]
     Tap   //XCUIElementTypeKey[@name="3"]
     Tap   //XCUIElementTypeKey[@name="4"]
     Tap   //XCUIElementTypeKey[@name="5"]
     Tap   //XCUIElementTypeKey[@name="6"]
     Wait Until Element Is Visible    ${OKbutton}  30s
     Tap    ${OKbutton}
     wait until element is visible    ${LocateHambergeriCon}   20s
     Capture Page Screenshot     Change_Passcode_Success.png
    
Check the login by entering old passcode
   [Arguments]    ${MobileChangePasscode}
    Tap    ${LocateHambergeriCon}
    Tap     //XCUIElementTypeStaticText[@name="SIGN OUT"]
    wait until element is visible    //XCUIElementTypeStaticText[@name="Already have an account? SIGN IN"]   5s
    Tap   //XCUIElementTypeStaticText[@name="Already have an account? SIGN IN"]
    Wait until element is visible    //*[contains(@value, 'Enter your mobile no.')]   10s
    Input text   //*[contains(@value, 'Enter your mobile no.')]   ${MobileChangePasscode}
    Wait until element is visible    //XCUIElementTypeStaticText[@name="SIGN IN"]   10s
    Tap   //XCUIElementTypeStaticText[@name="SIGN IN"]
    Wait until element is visible    //XCUIElementTypeKey[@name="1"]   30s
    Tap   //XCUIElementTypeKey[@name="1"]
    Tap   //XCUIElementTypeKey[@name="1"]
    Tap   //XCUIElementTypeKey[@name="1"]
    Tap   //XCUIElementTypeKey[@name="1"]
    Tap   //XCUIElementTypeKey[@name="1"]
    Tap   //XCUIElementTypeKey[@name="1"]
    Wait until element is visible    ${locateEnterPasscodeFailed}    10s
    Tap   ${OKbutton}
    
Enter New Passcode
    Tap   //XCUIElementTypeKey[@name="1"]
    Tap   //XCUIElementTypeKey[@name="2"]
    Tap   //XCUIElementTypeKey[@name="3"]
    Tap   //XCUIElementTypeKey[@name="4"]
    Tap   //XCUIElementTypeKey[@name="5"]
    Tap   //XCUIElementTypeKey[@name="6"]
    
Reset the previous passcode again
    [Arguments]    ${MobileChangePasscode}    ${Passport}
    Wait until element is visible    ${LocateHambergeriCon} 
    Tap    ${LocateHambergeriCon}
    Tap     //XCUIElementTypeStaticText[@name="SIGN OUT"]
    wait until element is visible    //XCUIElementTypeStaticText[@name="Already have an account? SIGN IN"]   5s
    Tap   //XCUIElementTypeStaticText[@name="Already have an account? SIGN IN"]
    Wait until element is visible    //*[contains(@value, 'Enter your mobile no.')]   10s
    Input text   //*[contains(@value, 'Enter your mobile no.')]   ${MobileChangePasscode}
    Wait until element is visible    //XCUIElementTypeStaticText[@name="SIGN IN"]   10s
    Tap   //XCUIElementTypeStaticText[@name="SIGN IN"]
    wait until element is visible  //XCUIElementTypeStaticText[@name="Forgot Passcode?"]  10s
    Tap  //XCUIElementTypeStaticText[@name="Forgot Passcode?"]
    Tap  ${PassportButton}
    Input Text  ${LocateEnterPassport}   ${Passport}
    TAP  //XCUIElementTypeButton[@name="Done"]
    Tap     ${ContinueButton}
    ${statusOTP}    Run Keyword And Return Status    WAIT UNTIL ELEMENT IS VISIBLE   id=title_label    10s
    Run Keyword If    "${statusOTP}"=="True"    Enter OTP
    WAIT UNTIL ELEMENT IS VISIBLE  //XCUIElementTypeKey[@name="1"]   10s
    Tap   //XCUIElementTypeKey[@name="1"]
    Tap   //XCUIElementTypeKey[@name="1"]
    Tap   //XCUIElementTypeKey[@name="1"]
    Tap   //XCUIElementTypeKey[@name="1"]
    Tap   //XCUIElementTypeKey[@name="1"]
    Tap   //XCUIElementTypeKey[@name="1"]
    WAIT UNTIL ELEMENT IS VISIBLE  //XCUIElementTypeKey[@name="1"]   5s
    Tap   //XCUIElementTypeKey[@name="1"]
    Tap   //XCUIElementTypeKey[@name="1"]
    Tap   //XCUIElementTypeKey[@name="1"]
    Tap   //XCUIElementTypeKey[@name="1"]
    Tap   //XCUIElementTypeKey[@name="1"]
    Tap   //XCUIElementTypeKey[@name="1"]
    Wait Until Element Is Visible    ${OKbutton}  30s
    Tap  ${OKbutton}
    wait until element is visible    ${LocateHambergeriCon}   20s
    Capture Page Screenshot     Change_Passcode_Success.png
    
