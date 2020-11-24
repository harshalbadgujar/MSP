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
${Mo_No}
${Pass_no}
*** Keywords ***
RegisterBy_EN_FPBy_MM.Login MSP for check Forgot Passcode in Myanmar Langauge
    Open Application
    ...    http://localhost:4723/wd/hub
    ...    alias=Myapp1
    ...    platformName=Android
    ...    deviceName=MA
    ...    appPackage=com.ccpp.msp.uat
    ...    appActivity=com.ccpp.msp.Launcher

RegisterBy_EN_FPBy_MM.To verify Generate Number For Register in English langauge
    Allow_Pop-up
    ${Skip}=  Run Keyword And Return Status    Wait Until Element Is Visible    ${Skipbtn}    5s
    Run Keyword If    ${Skip}   Tap  ${Skipbtn}
    ${Gen_Mobile}=   Generate Random String  7  	[NUMBERS]
    Set Suite Variable  ${Mo_No}  ${Gen_Mobile}
    Wait Until Element Is Visible    ${Registerbtn}   40s
    Tap   ${Registerbtn}
    Tap  ${Mo_TextToEnter}
    Input text  ${Mo_TextToEnter}   09${Gen_Mobile}
    Tap  ${SignInCnf}
    Wait Until Element Is Visible    ${VERIFICATION}  50s

RegisterBy_EN_FPBy_MM.To verify Fetch OTP
    Fetch OTP

RegisterBy_EN_FPBy_MM.To verify Registration processs
   ${Passport_Number}=   Generate Random String  7  	[NUMBERS]
   Set Suite Variable  ${Pass_no}  ${Passport_Number}
   Wait Until Element Is Visible    ${VI}   120s
   Input Text  ${Regsrnam}     Robot Registration
   Tap  ${passporttab}
   Input Text  ${Pass_num}   P${Passport_Number}
   Tap  ${SignInCnf}
   Wait Until Element Is Visible    ${Setpass}  120s
   Tap    ${pressone}
   Tap    ${pressone}
   Tap    ${pressone}
   Tap    ${pressone}
   Tap    ${pressone}
   Tap    ${pressone}
   Wait Until Element Is Visible    ${Confpass}  120s
   Tap    ${pressone}
   Tap    ${pressone}
   Tap    ${pressone}
   Tap    ${pressone}
   Tap    ${pressone}
   Tap    ${pressone}
   Wait Until Element Is Visible    ${RegOk}  120s
   Tap    ${Val_Okbtn}
   Wait Until Element Is Visible    ${TransferButton}    120s
    Tap  ${Humberger_Menu}
    Wait Until Element Is Visible    ${Hum_pay}  120s
    Scroll    ${Hum_Gifts}      ${Hum_Trans}
    Tap  ${CPSout}
RegisterBy_EN_FPBy_MM.To verify Check in MM Lang
    Wait Until Element Is Visible    ${Registerbtn}   120s
    Tap   ${ENGLISH}
    Tap   ${Myanmar}
    Wait Until Element Is Visible    ${NumMMlanReg}   120s
    Tap  ${MMSininBtn}
    Wait Until Element Is Visible    ${MMMwel}   120s
    Input Text    ${Mo_TextToEnter}    09${Mo_No}
    Tap    ${SignInCnf}
    Wait Until Element Is Visible    id=com.ccpp.msp.uat:id/tvForgotPassword   120s
    Tap    id=com.ccpp.msp.uat:id/tvForgotPassword
    Tap  ${passporttab}
    Wait Until Element Is Visible    ${RegisterEnMM}   120s
    Input Text  ${RegisterEnMM}    P${Pass_no}
    Tap  ${SignInCnf}
RegisterBy_EN_FPBy_MM.To verify Fetch OTP For EN_FB_MM_set_pass
   Fetch OTP
   Wait Until Element Is Visible    ${pressone}   120s
   Tap    ${pressone}
   Tap    ${pressone}
   Tap    ${pressone}
   Tap    ${pressone}
   Tap    ${pressone}
   Tap    ${pressone}
   Wait Until Element Is Visible    ${pressone}    120s
   Tap    ${pressone}
   Tap    ${pressone}
   Tap    ${pressone}
   Tap    ${pressone}
   Tap    ${pressone}
   Tap    ${pressone}
   Wait Until Element Is Visible    ${Val_Okbtn}  120s
   Tap    ${Val_Okbtn}
   Capture Page Screenshot    Screenshots/Registration_Success.png