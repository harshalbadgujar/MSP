*** Settings ***
Library    AppiumLibrary
*** Keywords ***
ENTER PASSCODE
  
    Wait Until Element Is Visible    android=UiSelector().text("ENTER PASSCODE")  60s
    Tap    id=com.ccpp.msp.uat:id/k1
    Tap    id=com.ccpp.msp.uat:id/k1
    Tap    id=com.ccpp.msp.uat:id/k1
    Tap    id=com.ccpp.msp.uat:id/k1
    Tap    id=com.ccpp.msp.uat:id/k1
    Tap    id=com.ccpp.msp.uat:id/k1

If Fails To Login
    ${Again}=  Run Keyword And Return Status    Wait Until Element Is Visible    android=UiSelector().text("Try again or tap forgot passcode to reset.")    8s
    Run Keyword If    ${Again}    Continue_Pass

Continue_Pass

        :FOR  ${i}  IN RANGE  1   10
        \   ${Again}=  Run Keyword And Return Status    Wait Until Element Is Visible    android=UiSelector().text("Try again or tap forgot passcode to reset.")    8s
        \   Run Keyword If    ${Again}   Tap  id=com.ccpp.msp.uat:id/btnOk
        \   Run Keyword If    ${Again}   ENTER PASSCODE
        \   ${Again1}=  Run Keyword And Return Status    Wait Until Element Is Visible    android=UiSelector().text("Transfer")  8s
        \   Exit For Loop IF    ${Again1} == True


