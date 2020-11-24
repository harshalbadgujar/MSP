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
RegisterBy_MM_FPBy_EN.Login MSP for check Forgot passcode in English langauge
    Open Application
    ...    http://localhost:4723/wd/hub
    ...    alias=Myapp1
    ...    platformName=Android
    ...    deviceName=MA
    ...    appPackage=com.ccpp.msp.uat
    ...    appActivity=com.ccpp.msp.Launcher

RegisterBy_MM_FPBy_EN.To verify Change langauage to Myanmar
    Allow_Pop-up
    ${Skip}=  Run Keyword And Return Status    Wait Until Element Is Visible    ${Skipbtn}    5s
    Run Keyword If    ${Skip}   Tap  ${Skipbtn}
    Wait Until Element Is Visible    ${Registerbtn}   40s
    Tap   ${ENGLISH}
    Tap   ${Myanmar}
RegisterBy_MM_FPBy_EN.To verify Generate Number For Register in MM
    ${Gen_Mobile}=   Generate Random String  7  	[NUMBERS]
    Set Suite Variable  ${Mo_No}  ${Gen_Mobile}
    Wait Until Element Is Visible    ${NumMMlanReg}    40s
    Tap   ${NumMMlanReg}
    Wait Until Element Is Visible    ${Mo_TextToEnter}   40s
    Tap  ${Mo_TextToEnter}
    Input text  ${Mo_TextToEnter}   09${Gen_Mobile}
    Tap  ${SignInCnf}
    Wait Until Element Is Visible    ${တစ်ခါသုံးလျှို့ဝှက်နံပါတ်ကိုထည့်ပါ}  50s

RegisterBy_MM_FPBy_EN.To verify Fetch OTP For MM_FP_EE
    Fetch OTP

RegisterBy_MM_FPBy_EN.To verify Registration processs of MM
   ${Passport_Number}=   Generate Random String  7  	[NUMBERS]
   Set Suite Variable  ${Pass_no}  ${Passport_Number}
   Wait Until Element Is Visible    ${ကိုယ်ရေးအချက်အလက်များကိုစိစစ်ပါ}   30s
   Input Text  ${Regsrnam}     Robot Registration
   Tap  ${passporttab}
   Input Text  ${Pass_num}   P${Passport_Number}
   Tap  ${SignInCnf}
   Wait Until Element Is Visible    ${pressone}  30s
   Tap    ${pressone}
   Tap    ${pressone}
   Tap    ${pressone}
   Tap    ${pressone}
   Tap    ${pressone}
   Tap    ${pressone}
   Wait Until Element Is Visible    ${pressone}  30s
   Tap    ${pressone}
   Tap    ${pressone}
   Tap    ${pressone}
   Tap    ${pressone}
   Tap    ${pressone}
   Tap    ${pressone}
   Wait Until Element Is Visible    ${Val_Okbtn}  30s
   Tap    ${Val_Okbtn}
   Wait Until Element Is Visible    ${Humberger_Menu}    30s
    Tap  ${Humberger_Menu}
    Wait Until Element Is Visible    ${ဖုန်းငွေဖြည့်}
    Scroll    ${ReMMScrollF}     ${ReMMScrollT}
    Tap  ${MMSI}  #sign out
RegisterBy_MM_FPBy_EN.To verify Forgot passcode in english langauge
    Wait Until Element Is Visible    ${ReMMReBtn}   40s
    Tap  ${SignInBtn}
    Wait Until Element Is Visible    ${SignInCnf}   40s
    Input Text    ${Mo_TextToEnter}    09${Mo_No}
    Tap    ${SignInCnf}
    Wait Until Element Is Visible    ${ForgotPassword}   40s
    Tap    ${ForgotPassword}
    Tap  ${passporttab}
    Wait Until Element Is Visible    ${RegisterEnMM}   40s
    Input Text  ${RegisterEnMM}    P${Pass_no}
    Tap  ${SignInCnf}
RegisterBy_MM_FPBy_EN.To verify Fetch OTP For MM_FB_EE_set_pass
    Fetch OTP
    Wait Until Element Is Visible    ${pressone}   30s
   Tap    ${pressone}
   Tap    ${pressone}
   Tap    ${pressone}
   Tap    ${pressone}
   Tap    ${pressone}
   Tap    ${pressone}
   Wait Until Element Is Visible    ${pressone}  30s
   Tap    ${pressone}
   Tap    ${pressone}
   Tap    ${pressone}
   Tap    ${pressone}
   Tap    ${pressone}
   Tap    ${pressone}
   Wait Until Element Is Visible    ${Val_Okbtn}  60s
   Tap    ${Val_Okbtn}
   Capture Page Screenshot    Screenshots/Registration_Success.png
   Tap  ${Humberger_Menu}
   Wait Until Element Is Visible    ${Hum_pay}  120s
   Scroll    ${Hum_Gifts}      ${Hum_Trans}
   Tap  ${CPSout}