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
NRC_Num_MM_Lang.To verify Login MSP for NRC check
    Open Application
    ...    http://localhost:4723/wd/hub
    ...    alias=Myapp1
    ...    platformName=Android
    ...    deviceName=MA
    ...    appPackage=com.ccpp.msp.uat
    ...    appActivity=com.ccpp.msp.Launcher

NRC_Num_MM_Lang.To verify Generate Number For NRC Number
    ${Gen_Mo}=   Generate Random String  7  	[NUMBERS]
    Allow_Pop-up
    ${Skip}=  Run Keyword And Return Status    Wait Until Element Is Visible    ${Skipbtn}    10s
    Run Keyword If    ${Skip}   Tap  ${Skipbtn}
    Wait Until Element Is Visible    ${Registerbtn}   120s
    Tap   ${ENGLISH}
    Tap   ${Myanmar}
    Wait Until Element Is Visible    ${NumMMlanReg}   120s
    Tap   ${NumMMlanReg}
    Wait Until Element Is Visible    ${Mo_TextToEnter}   120s
    Tap  ${Mo_TextToEnter}
    Input text  ${Mo_TextToEnter}   09${Gen_Mo}
    Tap  ${SignInCnf}
    Wait Until Element Is Visible    ${အဆင့် ၂/၄}  120s
NRC_Num_MM_Lang.To verify Fetch OTP For NRC
    Fetch OTP
NRC_Num_MM_Lang.To verify MM lang NRC number and Duplicate in MM
    Input Text  ${Regsrnam}     Robot Registration
    Tap   ${NRCicon}
    Tap   ${StateCode}
    Wait Until Element Is Visible    ${၁}   120s
    Tap   ${၁}
    Wait Until Element Is Visible    ${DisttCode}   10s
    Tap  ${DisttCode}
    Wait Until Element Is Visible    ${ကပတ}   10s
    Tap   ${ကပတ}
    Wait Until Element Is Visible    ${tvType}   10s
    Tap   ${tvType}
    Wait Until Element Is Visible    ${ဧည့်}   10s
    Tap   ${ဧည့်}
    Wait Until Element Is Visible    ${Csmttype}   10s
    Input Text  ${Csmttype}     987654
    Wait Until Element Is Visible    ${SignInCnf}   10s
    Tap   ${SignInCnf}
    Wait Until Element Is Visible    ${Val_Okbtn}   10s
    Tap  ${Val_Okbtn}
NRC_Num_MM_Lang.To verify Duplicate Passport in MM Lang
    Tap  ${passporttab}
    Input Text  ${Pass_num}    T1234569
    Tap   ${SignInCnf}
    Wait Until Element Is Visible    ${Val_Okbtn}   120s
    Tap  ${Val_Okbtn}
    Wait Until Element Is Visible     ${passporttab}   5s
    Tap  ${Back_button}
    Wait Until Element Is Visible     ${Mo_TextToEnter}     7s
    Tap  ${Back_button}