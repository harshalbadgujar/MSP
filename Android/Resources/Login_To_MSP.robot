*** Settings ***
Resource     ../Setting.robot
*** Keywords ***
Invoke App
    [Arguments]   ${Login_Number}
    Open Application msp  ${Login_Number}
Open Application msp
    [Arguments]   ${Login_Number}
    Open Application    
    ...    http://localhost:4723/wd/hub
    ...    alias=Myapp1    
    ...    platformName=Android    
    ...    deviceName=MA
    ...    appPackage=com.ccpp.msp.uat      
    ...    appActivity=com.ccpp.msp.Launcher
    ${IsElementVisible1}=  Run Keyword And Return Status    Wait Until Element Is Visible    android=UiSelector().text("ALLOW")   10s
    Run Keyword If    ${IsElementVisible1}  Tap    id=com.android.packageinstaller:id/permission_allow_button
    ${Skip}=  Run Keyword And Return Status    Wait Until Element Is Visible    android=UiSelector().text("SKIP")    10s
    Run Keyword If    ${Skip}   Tap  android=UiSelector().text("SKIP")
    Wait Until Element Is Visible    android=UiSelector().text("REGISTER")  120s
    Tap    android=UiSelector().text("Already have an account? SIGN IN")
    Wait Until Element Is Visible    android=UiSelector().text("Enter your mobile no.")      
    Input Text    id=com.ccpp.msp.uat:id/edt_mobile    ${Login_Number} 
    Tap    id=com.ccpp.msp.uat:id/btnConfirm  
    ENTER PASSCODE
    If Fails To Login
    Wait Until Element Is Visible    android=UiSelector().text("Transfer")  30s