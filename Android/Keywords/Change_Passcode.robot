*** Settings ***
Resource     ../Setting.robot
*** Variable ***
${Login_Number} =     9798304852
*** Keywords ***
Change_Passcode.Login to MSP for change passcode Functionlaity
    Invoke App   ${Login_Number}
Change_Passcode.To verify change passcode option
    Tap  ${Humberger_Menu}
    Wait Until Element Is Visible    ${Hum_Trans}  30s
    Scroll    ${Hum_Gifts}      ${Hum_Trans}
    Tap  ${SETTINGS}
    Wait Until Element Is Visible    ${ChnagePass}  30s
    Tap  ${CPicon}
Change_Passcode.To verify set New passcode
    ENTER PASSCODE
    Wait Until Element Is Visible    ${Setpass}  30s
    Tap    id=com.ccpp.msp.uat:id/k1
    Tap    id=com.ccpp.msp.uat:id/k2
    Tap    id=com.ccpp.msp.uat:id/k3
    Tap    id=com.ccpp.msp.uat:id/k4 
    Tap    id=com.ccpp.msp.uat:id/k5
    Tap    id=com.ccpp.msp.uat:id/k6
    Wait Until Element Is Visible    ${Confpass}  30s
    Tap    id=com.ccpp.msp.uat:id/k1
    Tap    id=com.ccpp.msp.uat:id/k2
    Tap    id=com.ccpp.msp.uat:id/k3
    Tap    id=com.ccpp.msp.uat:id/k4 
    Tap    id=com.ccpp.msp.uat:id/k5
    Tap    id=com.ccpp.msp.uat:id/k6
    Wait Until Element Is Visible    ${Passcahnged}  30s
    log to console   Passcode was changed successfully as 123456
    Tap    ${Cpok}
Change_Passcode.To verify Change passcode is working or not by login
    Wait Until Element Is Visible    ${ChnagePass}   30s   
    Tap  ${CPback}
    Wait Until Element Is Visible    ${Visible_Home}  30s
    Tap  ${Humberger_Menu}
    sleep  2s
    Tap  ${CPSout}
    Wait Until Element Is Visible    ${CPRegi}  30s
    Tap    ${CPSI}
    Wait Until Element Is Visible    ${CPEntermo}      30s
    Input Text    ${CPMoBox}    9798304852
    Tap    ${Confirm_Button}
Change_Passcode.TO verify Old passcode is working or not
    Wait Until Element Is Visible    ${PsscodeScrn}  30s
    Tap    id=com.ccpp.msp.uat:id/k1
    Tap    id=com.ccpp.msp.uat:id/k1
    Tap    id=com.ccpp.msp.uat:id/k1
    Tap    id=com.ccpp.msp.uat:id/k1
    Tap    id=com.ccpp.msp.uat:id/k1
    Tap    id=com.ccpp.msp.uat:id/k1
    Wait Until Element Is Visible    ${Cpok}   20s
    Tap    ${Cpok}
Change_Passcode.To verify changed passcode is working or not
    Wait Until Element Is Visible    ${PsscodeScrn}  30s
    Tap    id=com.ccpp.msp.uat:id/k1
    Tap    id=com.ccpp.msp.uat:id/k2
    Tap    id=com.ccpp.msp.uat:id/k3
    Tap    id=com.ccpp.msp.uat:id/k4 
    Tap    id=com.ccpp.msp.uat:id/k5
    Tap    id=com.ccpp.msp.uat:id/k6
    Wait Until Element Is Visible    ${Visible_Home}  30s
    Tap  ${Humberger_Menu}
    Wait Until Element Is Visible    ${Hum_pay}  30s
    Scroll    ${Hum_Gifts}      ${Hum_Trans}
    Tap  ${SETTINGS}
    Wait Until Element Is Visible    ${ChnagePass}  30s
Change_Passcode.Set Previous Passcode for further use
    Tap  ${CPicon}
    Wait Until Element Is Visible    ${PsscodeScrn}   30s
    Tap    id=com.ccpp.msp.uat:id/k1
    Tap    id=com.ccpp.msp.uat:id/k2
    Tap    id=com.ccpp.msp.uat:id/k3
    Tap    id=com.ccpp.msp.uat:id/k4
    Tap    id=com.ccpp.msp.uat:id/k5
    Tap    id=com.ccpp.msp.uat:id/k6
    Wait Until Element Is Visible    ${Setpass}  30s
    Tap    id=com.ccpp.msp.uat:id/k1
    Tap    id=com.ccpp.msp.uat:id/k1
    Tap    id=com.ccpp.msp.uat:id/k1
    Tap    id=com.ccpp.msp.uat:id/k1 
    Tap    id=com.ccpp.msp.uat:id/k1
    Tap    id=com.ccpp.msp.uat:id/k1
    Wait Until Element Is Visible    ${Confpass}  30s
    Tap    id=com.ccpp.msp.uat:id/k1
    Tap    id=com.ccpp.msp.uat:id/k1
    Tap    id=com.ccpp.msp.uat:id/k1
    Tap    id=com.ccpp.msp.uat:id/k1 
    Tap    id=com.ccpp.msp.uat:id/k1
    Tap    id=com.ccpp.msp.uat:id/k1
    Wait Until Element Is Visible    ${Passcahnged}   10s
    log to console   Previous passcode is as 111111
    Tap    ${Cpok}
    Wait Until Element Is Visible    ${ChnagePass}   30s
    Tap  ${CPback}
    Wait Until Element Is Visible    ${Visible_Home}  30s
