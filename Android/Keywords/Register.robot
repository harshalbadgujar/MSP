*** Settings ***
Resource     ../Setting.robot
*** Variables ***
${dbdriver} =    ODBC Driver 17 for SQL Server
${dbName} =      GIP_UAT
${dbUsername} =  qa_aloha
${dbPassword} =  qa_aloha@12
${dbHost} =      172.31.3.36
${dbPort} =      5432
${query} =       select TOP 1 * from OTP order by ID desc
*** Keywords ***
Register.Login to MSP for Registration
    Open Application    
    ...    http://localhost:4723/wd/hub    
    ...    alias=Myapp1    
    ...    platformName=Android    
    ...    deviceName=MA    
    ...    appPackage=com.ccpp.msp.uat    
    ...    appActivity=com.ccpp.msp.Launcher  

Register.Generate Number For Register
    ${Gen_Mo}=   Generate Random String  7  	[NUMBERS]
    Allow_Pop-up
    ${Skip}=  Run Keyword And Return Status    Wait Until Element Is Visible    ${Skipbtn}    10s
    Run Keyword If    ${Skip}   Tap  ${Skipbtn}
    Wait Until Element Is Visible    ${Registerbtn}   120s
    Tap   ${Registerbtn}
    Tap  ${Mo_TextToEnter}
    Input text  ${Mo_TextToEnter}   09${Gen_Mo}
    Tap  ${SignInCnf}
    Wait Until Element Is Visible    ${VERIFICATION}  120s

Register.To verify Fetch OTP From SQL DB and Enter
    Fetch OTP

Register.To verify Blank Name
     Wait Until Element Is Visible    ${VI}  120s
     Tap   ${SignInCnf}
     Wait Until Element Is Visible    ${Val_Popup}     30s
     ${Balnk_name_popup} =   Get Text    ${Val_Popup}
     ${Balnk_name_Msg} =   Get Text    ${Val_Msg}
     Log to console   Blank_Nmae=${Balnk_name_popup}
     Log to console   Blank_Nmae=${Balnk_name_Msg}
     Tap  ${Val_Okbtn}
Register.To verify Balnk NRC
    Input Text  ${Regsrnam}     Robot Registration
    Tap   ${SignInCnf}
    Wait Until Element Is Visible    ${Val_Popup}     30s
    ${Balnk_NRC_popup} =   Get Text    ${Val_Popup}
    ${Balnk_NRC_Msg} =   Get Text    ${Val_Msg}
    Log to console   Balnk NRC=${Balnk_NRC_popup}
    Log to console   Blank NRC=${Balnk_NRC_Msg}
    Tap  ${Val_Okbtn}
Register.To verify Blank Passport
    Tap  ${passporttab}
    Tap   ${SignInCnf}
    Wait Until Element Is Visible    ${Val_Popup}     30s
    ${Balank_passport_pop} =   Get Text    ${Val_Popup}
    ${Balank_passport_Msg} =   Get Text    ${Val_Msg}
    Log to console   Blank Pssport=${Balank_passport_pop}
    Log to console   Blank Passport=${Balank_passport_Msg}
    Tap  ${Val_Okbtn}
Register.To verify Enter User Details
    ${Passport}=   Generate Random String  7  	[NUMBERS]
    Input Text  ${Regsrnam}     Robot Registration
    Tap  ${passporttab}
    Input Text  ${Pass_num}  P${Passport}
    Tap  ${SignInCnf}
    Wait Until Element Is Visible    ${Setpass}  120s
    Tap    id=com.ccpp.msp.uat:id/k1
    Tap    id=com.ccpp.msp.uat:id/k1
    Tap    id=com.ccpp.msp.uat:id/k1
    Tap    id=com.ccpp.msp.uat:id/k1
    Tap    id=com.ccpp.msp.uat:id/k1
    Tap    id=com.ccpp.msp.uat:id/k1
    Wait Until Element Is Visible    ${Confpass}  120s
    Tap    id=com.ccpp.msp.uat:id/k1
    Tap    id=com.ccpp.msp.uat:id/k1
    Tap    id=com.ccpp.msp.uat:id/k1
    Tap    id=com.ccpp.msp.uat:id/k1
    Tap    id=com.ccpp.msp.uat:id/k1
    Tap    id=com.ccpp.msp.uat:id/k1
    Wait Until Element Is Visible    ${RegOk}  120s
    Tap    ${Val_Okbtn}
    Wait Until Element Is Visible    ${TransferButton}    120s
Register.To verify Verify User Details
    Tap  ${Humberger_Menu}
    Wait Until Element Is Visible    ${Hum_pay}  120s
    Scroll    ${Hum_Gifts}      ${Hum_Trans}
    Tap  ${SETTINGS}
    Capture Page Screenshot    Screenshots/Registration_Success.png
    Tap  ${CPback}
    Wait Until Element Is Visible    ${TransferButton}   120s
    Tap  ${Humberger_Menu}
    Tap  ${CPSout}
Register.To verify No passcode Case
    ${Gen_Mo}=   Generate Random String  7  	[NUMBERS]
    Wait Until Element Is Visible    ${Registerbtn}   120s
    Tap   ${Registerbtn}
    Tap  ${Mo_TextToEnter}
    Input text  ${Mo_TextToEnter}   09${Gen_Mo}
    Tap  ${SignInCnf}
    Wait Until Element Is Visible    ${VERIFICATION}  120s
    Fetch OTP
    ${Passport}=   Generate Random String  7  	[NUMBERS]
    Input Text  ${Regsrnam}     Robot Registration
    Tap  ${passporttab}
    Input Text  ${Pass_num}  P${Passport}
    Tap  ${SignInCnf}
    Wait Until Element Is Visible    ${Welc_cm}    60s
    Tap  ${VAlTranbackcheck}
    Wait Until Element Is Visible    ${VI}    30s
    Tap  ${VAlTranbackcheck}
    Wait Until Element Is Visible    ${SignInCnf}  12s
    Tap  ${SignInCnf}
    Wait Until Element Is Visible    ${Setpass}  120s
    ${Gettext}=  Get text   ${Welc_cm}
    Should be Equal as Strings    ${Gettext}     SET PASSCODE
    Wait Until Element Is Visible    ${VAlTranbackcheck}  12s
    Tap  ${VAlTranbackcheck}
    Wait Until Element Is Visible    ${Back_button}  12s
    Tap  ${Back_button}
