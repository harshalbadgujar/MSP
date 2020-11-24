*** Settings ***
Library    AppiumLibrary
Library    String
Library	   OperatingSystem
Resource    ../Global Keyword.robot
Resource    ../../Locator/Register.resource
Resource    ../../Locator/HomePage.resource

*** variables ***
${number}

*** Keywords ***
To verify Register with valid passport number and name
    ${Gen_Mo}    Enter Register Mobile number
    Enter New Details Passport
    [Return]    ${Gen_Mo}

Enter Register Mobile number
     ${check}    Run Keyword And Return Status     WAIT UNTIL ELEMENT IS VISIBLE    //XCUIElementTypeButton[@name="Allow"]
     run keyword if  ${check}  Tap     //XCUIElementTypeButton[@name="Allow"]
     ${Gen_Mo}=   Generate Random String  7  	[NUMBERS]
     set global variable  ${number}    ${Gen_Mo}
#    Tap     //XCUIElementTypeButton[@name="Allow"]
     ${check1}    Run Keyword And Return Status    WAIT UNTIL ELEMENT IS VISIBLE   //XCUIElementTypeStaticText[@value="ENTER PASSCODE"]   10S
     run keyword if  ${check1}  Tap  //XCUIElementTypeButton[@name="Back"]
     wait until element is visible    //XCUIElementTypeStaticText[@name="REGISTER"]   10s
     Tap   //XCUIElementTypeStaticText[@name="REGISTER"]
     wait until element is visible    ${LocateEnterMobile}   10s
     Input text   ${LocateEnterMobile}   09${Gen_Mo}
     Tap   //XCUIElementTypeStaticText[@name="CONTINUE"]
     ${statusOTP}    Run Keyword And Return Status    WAIT UNTIL ELEMENT IS VISIBLE    id=title_label    10s
     Run Keyword If    "${statusOTP}"=="True"    Enter OTP
     [Return]    ${Gen_Mo}

Registered already user
     Wait Until Element Is Visible    ${LocateEnterFullName}
     Input Text    ${LocateEnterFullName}     Robot Registration
     Tap    ${PassportButton}
     Input Text    ${LocateEnterPassport}   I8973723
     TAP  //XCUIElementTypeButton[@name="Done"]
     Tap     ${ConfirmButton}
     Wait Until Element Is Visible    //XCUIElementTypeButton[@name="OK"]  30s
     Tap  //XCUIElementTypeButton[@name="OK"]
     
Enter New Details Passport
   ${Passport}=   Generate Random String  7  	[NUMBERS]
#   Wait Until Element Is Visible    //*[contains(@value, 'Enter name')]
#   Input Text  //*[contains(@value, 'Enter name')]     Robot Registration
#   Tap  //XCUIElementTypeButton[@name="Passport"]
   #Clear text   //*[contains(@value, 'I8973723')]
   Wait Until Element Is Visible    ${LocateEnterFullName}
   Input Text  ${LocateEnterFullName}     Robot Registration
   Tap    ${PassportButton}
   Input Text    ${LocateEnterPassport}   P${Passport}
   TAP    //XCUIElementTypeButton[@name="Done"]
   Tap     ${ConfirmButton}
   #Enter Passcode
   #Enter Passcode
   wait until element is visible    id=title_label    20s
     Tap   //XCUIElementTypeKey[@name="1"]
     Tap   //XCUIElementTypeKey[@name="1"]
     Tap   //XCUIElementTypeKey[@name="1"]
     Tap   //XCUIElementTypeKey[@name="1"]
     Tap   //XCUIElementTypeKey[@name="1"]
     Tap   //XCUIElementTypeKey[@name="1"]

   wait until element is visible    id=title_label    20s
     Tap   //XCUIElementTypeKey[@name="1"]
     Tap   //XCUIElementTypeKey[@name="1"]
     Tap   //XCUIElementTypeKey[@name="1"]
     Tap   //XCUIElementTypeKey[@name="1"]
     Tap   //XCUIElementTypeKey[@name="1"]
     Tap   //XCUIElementTypeKey[@name="1"]
   Wait Until Element Is Visible    ${OKbutton}  30s
   Tap    ${OKbutton}
   wait until element is visible    ${LocateHambergeriCon}   20s
   
Enter New Details NRC
    ${NRC}=   Generate Random String  1  	[NUMBERS]
#   Wait Until Element Is Visible    //*[contains(@value, 'Enter name')]
#   Input Text  //*[contains(@value, 'Enter name')]     Robot Registration
#   Tap  //XCUIElementTypeButton[@name="Passport"]
   #Clear text   //*[contains(@value, 'I8973723')]
   Wait Until Element Is Visible    //*[contains(@value, 'Enter name')]
   Input Text  //*[contains(@value, 'Enter name')]     Robot Registration
   Tap  //XCUIElementTypeButton[@name="NRC"]
   Tap    (//XCUIElementTypeImage[@name="picker_arrow_down"])[1]
   
   TAP  //XCUIElementTypeButton[@name="Done"]
   Tap     //*[@value="CONFIRM"]
     WAIT UNTIL ELEMENT IS VISIBLE  //XCUIElementTypeKey[@name="1"]   5s
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
   Tap    ${OKbutton}
   wait until element is visible    ${LocateHambergeriCon}   20s
    
Verify User Details
    Tap    ${LocateHambergeriCon}
    Tap    ${LocateSetting}
    Capture Page Screenshot    Registration_Success.png

Validate register functionality if user keeps name, NRC and passport blank
    Enter Register Mobile number
    # generate a string
    ${Passport}=   Generate Random String  7  	[NUMBERS]
    # check validation for no name
    wait until element is visible  ${PassportButton}     15s
    tap   ${PassportButton}
    # enter passport number
    Input Text    ${LocateEnterPassport}   P${Passport}
    TAP    ${keydone}
    wait until element is visible  ${ConfirmButton}   4s
    # click on confirm button
    Tap     ${ConfirmButton}
    ${getnameerror}     get text  ${nameerror}
    # verifying error message
    ${check}    run keyword and return status  should be equal  ${actnameerror}     ${getnameerror}
    run keyword if  ${check}      log to console  user name missing
    tap    ${nameerrok}

    # check validation for no nrc number
    Wait Until Element Is Visible    ${LocateEnterFullName}    4s
    Input Text    ${LocateEnterFullName}     Robot Registration
    wait until element is visible  ${NRCbutton}    3s
    Tap   ${NRCbutton}
    TAP    ${keydone}
    Tap     ${ConfirmButton}
    ${getnrcerror}     get text  ${nrcerror}
    # verifying error message
    ${check}    run keyword and return status  should be equal  ${actnrcerror}     ${getnrcerror}
    run keyword if  ${check}      log to console  user nrc number missing
    tap    ${nameerrok}

    # check validation for no passport number
    wait until element is visible  ${PassportButton}     5s
    tap   ${PassportButton}
    # clear the previously enter passport number
    wait until element is visible  xpath=//*[contains(@value, 'P${Passport}')]   10s
    tap   xpath=//*[contains(@value, 'P${Passport}')]
    clear text  xpath=//*[contains(@value, 'P${Passport}')]
    TAP    ${keydone}
    Tap     ${ConfirmButton}
    ${getpasserror}     get text  ${passerror}
    ${check}    run keyword and return status  should be equal  ${actpasserror}     ${getpasserror}
    run keyword if  ${check}      log to console  user passport number missing
    tap    ${nameerrok}

Validate register functionality when user do not set passcode
    # entering the new mobile number in register field
    Enter Register Mobile number
    #generate and input psasport number
    ${Passport}=   Generate Random String  7  	[NUMBERS]
    Wait Until Element Is Visible    ${LocateEnterFullName}    4s
    Input Text    ${LocateEnterFullName}     Robot Registration
    wait until element is visible  ${PassportButton}     15s
    tap   ${PassportButton}
    Input Text    ${LocateEnterPassport}   P${Passport}
    TAP    ${keydone}
    wait until element is visible  ${ConfirmButton}   4s
    #tap on confirm button and navigate to set passcode amd click on back arrow button there
    Tap     ${ConfirmButton}
    wait until element is visible  ${setbackarrow}    5s
    Tap   ${setbackarrow}
    #try to register with same and navigate to set passcode again
    wait until element is visible   ${ContinueButton}    10s
    Tap   ${ContinueButton}
    ${check}  run keyword and return status   wait until element is visible    ${setpasscodetext}   10s
    run keyword if  ${check}     log to console  passcode is not set

To Verify users name and number is same under setting and homepage
   wait until element is visible   ${Hamburgerbtn}     10s
   tap    ${Hamburgerbtn}
   wait until element is visible     ${addmoneymenu}    5s
   scroll  ${addmoneymenu}     ${giftmenu}
   wait until element is visible    ${settingbutton}   5s
   Tap   ${settingbutton}

   # verify user name and number under setting is same as it was while registration
   wait until element is visible  ${username}    4s
   ${getsusername}    get text  ${username}
   # verify user name under settings menu
   ${check}    run keyword and return status  should be equal  ${getsusername}     ${actusername}
   run keyword if  ${check}     log to console  user name under setting menu is correct
   ${getsnumber}    get text  ${snumber}
   # verify mobile number under settings menu
   ${check1}     run keyword and return status  should be equal  ${getsnumber}     09${number}
   run keyword if  ${check1}   log to console  user number under setting menu is correct
   wait until element is visible  ${settingback}    5s
   tap   ${settingback}

   #verify user name and number on home page is same as it was while registration
   wait until element is visible  ${homeusername}    5s
   ${gethusername}    get text  ${homeusername}
   # verify user name on home page
   ${check2}    run keyword and return status  should be equal  ${gethusername}     ${actusername}
   run keyword if  ${check2}     log to console    user name on home page is correct
   ${gethnumber}     get text  	//XCUIElementTypeButton[@name="09${number}"]
   # verify mobile number on home page
   ${check3}     run keyword and return status  should be equal  ${gethnumber}     09${number}
   run keyword if  ${check3}   log to console  user number on home page is correct



