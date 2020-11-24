*** Settings ***
Resource     ../Setting.robot
*** Keywords ***
Transaction Details
    [Arguments]      ${Type}
    Check Transafer Details     ${Type}

Check Transafer Details
    [Arguments]    ${Type}
    Wait Until Element Is Visible    android=UiSelector().text("Transfer")  10
    Scroll    android=UiSelector().text("Gifts")    id=com.ccpp.msp.uat:id/tvMsw
    sleep  1s
    Scroll   com.ccpp.msp.uat:id/txnDate      com.ccpp.msp.uat:id/tvFlashSaleMore
    Tap   id=com.ccpp.msp.uat:id/tvShowAll 
    Wait Until Keyword Succeeds    2 min    1 sec    Element Should Be Visible    xpath=//android.widget.LinearLayout[@index='0']
    Wait Until Element Is Visible   id=com.ccpp.msp.uat:id/tvTransactionType    180s
    Tap   id=com.ccpp.msp.uat:id/tvTransactionType 
    Wait Until Element Is Visible   //android.widget.TextView[@resource-id='com.ccpp.msp.uat:id/tvTransactionStatus']    120s
    ${Status}	Get Text   //android.widget.TextView[@resource-id='com.ccpp.msp.uat:id/tvTransactionStatus']
    log to console    ${Type} Status is = ${Status}    
    ${Transfer_Amt}	Get Text   //android.widget.TextView[@resource-id='com.ccpp.msp.uat:id/tvTransactionAmt']
    log to console    ${Type} Amount is = ${Transfer_Amt}
    Capture Page Screenshot   Screenshots/${Type}.png
    Tap  id=com.ccpp.msp.uat:id/iconStart
    Tap  id=com.ccpp.msp.uat:id/iconStart
    Wait Until Element Is Visible    android=UiSelector().text("Show All Transaction")  30s
    Scroll    id=com.ccpp.msp.uat:id/tvFlashSaleMore    id=com.ccpp.msp.uat:id/tvShowAll
    scroll    android=UiSelector().text("Add Money")   android=UiSelector().text("Gifts")
    Wait Until Element Is Visible    android=UiSelector().text("Transfer")  40s