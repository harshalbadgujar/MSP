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
Duplicate_NRC_Passport.Login MSP for check duplicate
    Open Application
    ...    http://localhost:4723/wd/hub
    ...    alias=Myapp1
    ...    platformName=Android
    ...    deviceName=MA
    ...    appPackage=com.ccpp.msp.uat
    ...    appActivity=com.ccpp.msp.Launcher

Duplicate_NRC_Passport.To Verify Generate Number For Duplicate
    ${Gen_Mo}=   Generate Random String  7  	[NUMBERS]
    Allow_Pop-up
    ${Skip}=  Run Keyword And Return Status    Wait Until Element Is Visible    ${Skipbtn}    5s
    Run Keyword If    ${Skip}   Tap  ${Skipbtn}
    Wait Until Element Is Visible    ${Registerbtn}   120s
    Tap   ${Registerbtn}
    Tap  ${Mo_TextToEnter}
    Input text  ${Mo_TextToEnter}   09${Gen_Mo}
    Tap  ${SignInCnf}
Duplicate_NRC_Passport.To verify Fetch OTP for dulicate process
    Fetch OTP

Duplicate_NRC_Passport.To verify Check Duplicate Passport
   Wait Until Element Is Visible    ${VI}  120s
   Input Text  ${Regsrnam}     Robot Registration

   Tap  ${passporttab}
   Input Text  ${Pass_num}    T1234569
   Tap   ${Confirm}
   Wait Until Element Is Visible    ${Cpok}   120s
   Tap  ${Cpok}
Duplicate_NRC_Passport.To verify Check Duplicate NRC
     Tap   ${NRC}
     Tap   ${StateDupli}
     Wait Until Element Is Visible    ${TAP1NRC}   10s
     Tap   ${TAP1NRC}
     Wait Until Element Is Visible    ${District}   10s
     Tap   ${District}
     Wait Until Element Is Visible    ${AHGAYA}   10s
     Tap   ${AHGAYA}
     Wait Until Element Is Visible    ${dashicon}   10s
     Tap   ${dashicon}
     Wait Until Element Is Visible    ${Zone}   10s
     Tap   ${Zone}
     Wait Until Element Is Visible    ${last_no}   10s
     Tap   ${last_no}
     Input Text  ${last_no}     987654
     Press Keycode   4
     Wait Until Element Is Visible    ${Confirm}   10s
     Tap   ${Confirm}
     Wait Until Element Is Visible    ${Cpok}   10s
     Tap  ${Val_Okbtn}
     Wait Until Element Is Visible    ${VI}  120s
     Tap  ${VAlTranbackcheck}
     Wait Until Element Is Visible     ${Mo_TextToEnter}     120s
     Tap  ${Back_button}

