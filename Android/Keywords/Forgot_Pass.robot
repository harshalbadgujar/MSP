*** Settings ***
Resource     ../Setting.robot
*** Keywords ***
Forgot_Pass.Login to MSP for Forgot passcode
    Open Application
    ...    http://localhost:4723/wd/hub
    ...    alias=Myapp1
    ...    platformName=Android
    ...    deviceName=MA
    ...    appPackage=com.ccpp.msp.uat
    ...    appActivity=com.ccpp.msp.Launcher
    Allow_Pop-up
   ${Skip}=  Run Keyword And Return Status    Wait Until Element Is Visible    ${Skipbtn}    10s
    Run Keyword If    ${Skip}   Tap  ${Skipbtn}
Forgot_Pass.To verify Forgot passcode option is working or not
    Wait Until Element Is Visible    ${Registerbtn}   120s
    Tap    ${SignInBtn}
    Wait Until Element Is Visible    ${Enter_Mo_text}  120s
    Input Text    ${Mo_TextToEnter}    9798304852
    Tap    ${SignInCnf}
    Wait Until Element Is Visible    ${EnterPass}   120s
    Tap  ${Forgot_passcode}
   Tap  ${passporttab}
   Input Text  ${NRCtextBx}    T1232358
   Tap   ${CONTINUE}
Forgot_Pass.To verify Fetch OTP For Forgot passcode
   Fetch OTP
Forgot_Pass.To verify Set Passcode for Forgot passcode
   Wait Until Element Is Visible    ${Setpass}   120s
    Tap    id=com.ccpp.msp.uat:id/k1
    Tap    id=com.ccpp.msp.uat:id/k1
    Tap    id=com.ccpp.msp.uat:id/k1
    Tap    id=com.ccpp.msp.uat:id/k1
    Tap    id=com.ccpp.msp.uat:id/k1
    Tap    id=com.ccpp.msp.uat:id/k1
    Wait Until Element Is Visible    ${Confpass}   120s
    Tap    id=com.ccpp.msp.uat:id/k1
    Tap    id=com.ccpp.msp.uat:id/k1
    Tap    id=com.ccpp.msp.uat:id/k1
    Tap    id=com.ccpp.msp.uat:id/k1
    Tap    id=com.ccpp.msp.uat:id/k1
    Tap    id=com.ccpp.msp.uat:id/k1
    Wait Until Element Is Visible    ${Cpok}    120s
    Tap  ${Cpok}
    Wait Until Element Is Visible    ${TransferButton}  120s
    Tap  ${Humberger_Menu}
    sleep  2s
    Scroll    ${Hum_Gifts}      ${Hum_Trans}
    Tap  ${CPSout}
