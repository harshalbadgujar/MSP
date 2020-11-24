*** Settings ***
Library    AppiumLibrary
Library    String
Library	   OperatingSystem
Resource    ../Global Keyword.robot
Resource    ../../Locator/ChangePasscode.resource
Resource    ../../Locator/HomePage.resource

*** Keywords ***
To verify Change passcode
   [Arguments]    ${Mobile}
    WAIT UNTIL ELEMENT IS VISIBLE    ${LocateHambergeriCon}
    Tap     ${LocateHambergeriCon}
    Wait until element is visible    ${LocateSetting}   10s
    Tap   ${LocateSetting}
    WAIT UNTIL ELEMENT IS VISIBLE    ${ChangePasscodeButton}
    Tap    ${ChangePasscodeButton}
    Enter New Passcode (Change Passcode)
    Change PASSCODE KeyWord
    WAIT UNTIL ELEMENT IS VISIBLE    ${ChangePasscodeButton}
    Cross Check By old passcode (Change Passcode)    ${Mobile}
    Enter Passcode (Change Passcode Back)
    WAIT UNTIL ELEMENT IS VISIBLE    ${LocateHambergeriCon}
    Tap     ${LocateHambergeriCon}
    Wait until element is visible    ${LocateSetting}   10s
    Tap   ${LocateSetting}
    WAIT UNTIL ELEMENT IS VISIBLE    ${ChangePasscodeButton}
    Tap    ${ChangePasscodeButton}
    Change PASSCODE Back KeyWord
    WAIT UNTIL ELEMENT IS VISIBLE    ${ChangePasscodeButton}
    Tap    ${BackButton}
    Wait until element is visible    ${LocateHambergeriCon}   20s
    
Change passcode (Enter Passcode Failed)
    WAIT UNTIL ELEMENT IS VISIBLE    ${LocateHambergeriCon}
    Tap     ${LocateHambergeriCon}
    Wait until element is visible    ${LocateSetting}   10s
    Tap   ${LocateSetting}
    WAIT UNTIL ELEMENT IS VISIBLE    ${ChangePasscodeButton}
    Tap    ${ChangePasscodeButton}
    Change PASSCODE Failed Key Word  
     
Change PASSCODE KeyWord
     WAIT UNTIL ELEMENT IS VISIBLE  ${HeaderEnterPassscode}   10s
     sleep  3s
     Tap   //XCUIElementTypeKey[@name="1"]
     Tap   //XCUIElementTypeKey[@name="2"]
     Tap   //XCUIElementTypeKey[@name="3"]
     Tap   //XCUIElementTypeKey[@name="4"]
     Tap   //XCUIElementTypeKey[@name="5"]
     Tap   //XCUIElementTypeKey[@name="6"]
     WAIT UNTIL ELEMENT IS VISIBLE  ${HeaderEnterPassscode}   5s
     sleep   3s
     Tap   //XCUIElementTypeKey[@name="1"]
     Tap   //XCUIElementTypeKey[@name="2"]
     Tap   //XCUIElementTypeKey[@name="3"]
     Tap   //XCUIElementTypeKey[@name="4"]
     Tap   //XCUIElementTypeKey[@name="5"]
     Tap   //XCUIElementTypeKey[@name="6"]
     Wait Until Element Is Visible    ${OKbutton}  30s
     Tap    ${OKbutton}
     
Change PASSCODE Back KeyWord
     Enter Passcode (Change Passcode Back)
     WAIT UNTIL ELEMENT IS VISIBLE  ${HeaderEnterPassscode}   10s
     sleep   3s
     Tap   //XCUIElementTypeKey[@name="1"]
     Tap   //XCUIElementTypeKey[@name="1"]
     Tap   //XCUIElementTypeKey[@name="1"]
     Tap   //XCUIElementTypeKey[@name="1"]
     Tap   //XCUIElementTypeKey[@name="1"]
     Tap   //XCUIElementTypeKey[@name="1"]
     WAIT UNTIL ELEMENT IS VISIBLE  ${HeaderEnterPassscode}   5s
     sleep    3s
     Tap   //XCUIElementTypeKey[@name="1"]
     Tap   //XCUIElementTypeKey[@name="1"]
     Tap   //XCUIElementTypeKey[@name="1"]
     Tap   //XCUIElementTypeKey[@name="1"]
     Tap   //XCUIElementTypeKey[@name="1"]
     Tap   //XCUIElementTypeKey[@name="1"]
     Wait Until Element Is Visible    ${OKbutton}  30s
     Tap    ${OKbutton}
     Capture Page Screenshot     Change_Passcode_Success.png
    
Change PASSCODE Failed Key Word
     WAIT UNTIL ELEMENT IS VISIBLE  ${HeaderEnterPassscode}   20s
     wait until element is visible  //XCUIElementTypeKey[@name="1"]   5s
     Tap   //XCUIElementTypeKey[@name="1"]
     Tap   //XCUIElementTypeKey[@name="2"]
     Tap   //XCUIElementTypeKey[@name="3"]
     Tap   //XCUIElementTypeKey[@name="4"]
     Tap   //XCUIElementTypeKey[@name="5"]
     Tap   //XCUIElementTypeKey[@name="6"]
     Wait Until Element Is Visible    ${OKbutton}    30s
     ${WordingFailed}    Get Text    ${locateEnterPasscodeFailed}
     Should Be Equal    ${WordingChangePasscodeFailed}    ${WordingFailed}
     Tap    ${OKbutton}
     WAIT UNTIL ELEMENT IS VISIBLE  ${HeaderEnterPassscode}   10s
     sleep    3s
     Tap   //XCUIElementTypeKey[@name="1"]
     Tap   //XCUIElementTypeKey[@name="1"]
     Tap   //XCUIElementTypeKey[@name="1"]
     Tap   //XCUIElementTypeKey[@name="1"]
     Tap   //XCUIElementTypeKey[@name="1"]
     Tap   //XCUIElementTypeKey[@name="1"]
       WAIT UNTIL ELEMENT IS VISIBLE  ${HeaderEnterPassscode}   10s
       sleep     3s
     Tap   //XCUIElementTypeKey[@name="1"]
     Tap   //XCUIElementTypeKey[@name="2"]
     Tap   //XCUIElementTypeKey[@name="3"]
     Tap   //XCUIElementTypeKey[@name="4"]
     Tap   //XCUIElementTypeKey[@name="5"]
     Tap   //XCUIElementTypeKey[@name="6"]
     WAIT UNTIL ELEMENT IS VISIBLE  ${HeaderEnterPassscode}   5s
     sleep    3s
     Tap   //XCUIElementTypeKey[@name="2"]
     Tap   //XCUIElementTypeKey[@name="2"]
     Tap   //XCUIElementTypeKey[@name="2"]
     Tap   //XCUIElementTypeKey[@name="2"]
     Tap   //XCUIElementTypeKey[@name="2"]
     Tap   //XCUIElementTypeKey[@name="2"]
     ${WordingConfirmFailed}    Get Text    ${locateEnterPasscodeFailed}
     Should Be Equal    ${WordingConfirmPasscodeFailed}    ${WordingConfirmFailed}
     Tap    ${OKbutton}

Cross Check By old passcode (Change Passcode)
   [Arguments]    ${MobileChangePasscode}
    Tap    id=Back
    wait until element is visible    ${LocateHambergeriCon}
    Tap    ${LocateHambergeriCon}
    Tap     //XCUIElementTypeStaticText[@name="SIGN OUT"]
    wait until element is visible    //XCUIElementTypeStaticText[@name="Already have an account? SIGN IN"]   5s
    Tap   //XCUIElementTypeStaticText[@name="Already have an account? SIGN IN"]
    Wait until element is visible    //*[contains(@value, 'Enter your mobile no.')]   10s
    Input text   //*[contains(@value, 'Enter your mobile no.')]   ${MobileChangePasscode}
    Wait until element is visible    //XCUIElementTypeStaticText[@name="SIGN IN"]   10s
    Tap   //XCUIElementTypeStaticText[@name="SIGN IN"]
    Wait until element is visible    ${HeaderEnterPassscode}   30s
    sleep    3s
    Tap   //XCUIElementTypeKey[@name="1"]
    Tap   //XCUIElementTypeKey[@name="1"]
    Tap   //XCUIElementTypeKey[@name="1"]
    Tap   //XCUIElementTypeKey[@name="1"]
    Tap   //XCUIElementTypeKey[@name="1"]
    Tap   //XCUIElementTypeKey[@name="1"]
    Wait until element is visible    ${locateEnterPasscodeFailed}    10s
    Tap   ${OKbutton}
    
Enter New Passcode (Change Passcode)
    Wait until element is visible    ${HeaderEnterPassscode}       10s
    sleep  3s
    Tap   //XCUIElementTypeKey[@name="1"]
    Tap   //XCUIElementTypeKey[@name="1"]
    Tap   //XCUIElementTypeKey[@name="1"]
    Tap   //XCUIElementTypeKey[@name="1"]
    Tap   //XCUIElementTypeKey[@name="1"]
    Tap   //XCUIElementTypeKey[@name="1"]
    
Enter Passcode (Change Passcode Back)
    Wait until element is visible    ${HeaderEnterPassscode}     10s
    ${check1}   run keyword and return status      Wait Until Page Does Not Contain Element    //XCUIElementTypeKey[@name="1"]
    run keyword if   ${check1}     Tap    ${enterpassdot}
    Tap   //XCUIElementTypeKey[@name="1"]
    Tap   //XCUIElementTypeKey[@name="2"]
    Tap   //XCUIElementTypeKey[@name="3"]
    Tap   //XCUIElementTypeKey[@name="4"]
    Tap   //XCUIElementTypeKey[@name="5"]
    Tap   //XCUIElementTypeKey[@name="6"]
    
Change the app language from EN to MM
    #change language to MM
    wait until element is visible  ${Hamburgerbtn}   15s
    Tap    ${Hamburgerbtn}
    wait until element is visible     ${addmoneymenu}    5s
    scroll  ${addmoneymenu}     ${giftmenu}
    wait until element is visible    ${settingbutton}   5s
    # click on setting option
    Tap   ${settingbutton}
    wait until element is visible   ${changelanguage}   5s
    # click on change language menu
    Tap   ${changelanguage}
    wait until element is visible  ${langselectMM}   5s
    # select MM language
    Tap    ${langselectMM}
    Tap    ${confirmpopup}

    #change back language to original
    wait until element is visible  ${Hamburgerbtn}   15s
    Tap    ${Hamburgerbtn}
    wait until element is visible     ${addmoneymenu}    5s
    scroll  ${addmoneymenu}     ${giftmenu}
    wait until element is visible    ${settingbutton}   5s
    Tap   ${settingbutton}
    wait until element is visible   ${changelanguage}   5s
    Tap   ${changelanguage}
    wait until element is visible  ${langselectEN}   5s
    # select english language
    Tap    ${langselectEN}
    Tap    ${confirmpopup}
