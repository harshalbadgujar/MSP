*** Settings ***
Library     AppiumLibrary
Library	    Screenshot
Library     String
Resource    Resources/Login_To_MSP.robot
Resource    Resources/Show_All_Transaction.robot
Resource    Resources/ENTER_PASSCODE.robot
*** Variables ***
${right} =   Harsha
${Left}=   Harshal
*** Test Cases ***
Customer to Merchant RTP
     ${Outofstock}=  Run Keyword And Return Status   Should be equal    ${right}    ${Left}
      Run Keyword If    ${Outofstock}      log to console      ok
      Run Keyword If    ${Outofstock}  ==   "False"       log to console       not ok

    Open Application
    ...    http://localhost:4723/wd/hub
    ...    alias=Myapp1
    ...    platformName=Android
    ...    deviceName=MA
    ...    appPackage=com.ccpp.msp.uat
    ...    appActivity=com.ccpp.msp.Launcher
   ${Gen_Mo}=   Generate Random String  7  	[NUMBERS]
    ${IsElementVisible1}=  Run Keyword And Return Status    Wait Until Element Is Visible    android=UiSelector().text("ALLOW")   10s
    Run Keyword If    ${IsElementVisible1}  Tap    id=com.android.packageinstaller:id/permission_allow_button
   ${Skip}=  Run Keyword And Return Status    Wait Until Element Is Visible    android=UiSelector().text("SKIP")    10s
    Run Keyword If    ${Skip}   Tap  android=UiSelector().text("SKIP")
     Wait Until Page Contains Element   android=UiSelector().text("REGISTER")   20s
    Tap    id=com.ccpp.msp.uat:id/btnSignIn
    Wait Until Element Is Visible    android=UiSelector().text("Enter your mobile no.")
    Input Text    id=com.ccpp.msp.uat:id/edt_mobile    9798304852
    Tap    id=com.ccpp.msp.uat:id/btnConfirm
    ENTER PASSCODE
    If Fails To Loginap   android=UiSelector().text("REGISTTER")
    Tap  id=com.ccpp.msp.uat:id/edt_mobile
    Input text  id=com.ccpp.msp.uat:id/edt_mobile   09${Gen_Mo}
    Tap  id=com.ccpp.msp.uat:id/btnConfirm
    Wait Until Element Is Visible    android=UiSelector().text("VERIFICATION")  120s
    Wait Until Element Is Visible    id=com.ccpp.msp.uat:id/tvRef   30s
   ${Fetch_Prefix}=  GET TEXT    id=com.ccpp.msp.uat:id/tvRef
   log to console  ${Fetch_Prefix}
   Tap    id=com.ccpp.msp.uat:id/otpView
   sleep   2s
   Press Keycode                145
   Press Keycode                146
   Press Keycode                147
   Press Keycode                148
   Press Keycode                149
   Press Keycode                150
   Press Keycode                151
   Press Keycode                152
   Press Keycode                153



