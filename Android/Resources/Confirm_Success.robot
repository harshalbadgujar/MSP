*** Settings ***
Resource     ../Setting.robot
*** Variable ***
${Cnfirm} =     9798304852
${Success} =   63264862426
${glob}

*** Keywords ***
On confirmation screen
    [Arguments]      ${Amount}     ${Bname}
    Confirmation Screen     ${Amount}   ${Bname}
Confirmation Screen
    [Arguments]   ${Amount}     ${Bname}
    log to console   ${Amount}
    ${remove_quama1}=       Evaluate    '${Amount}'.replace(',','')
    ${Selectedamt}  Convert To Integer   ${remove_quama1}
    Wait Until Element Is Visible    android=UiSelector().text("CONFIRM")  30s      error=Test case failed due to all amounts are out of stock of ${Bname}
    ${ConfAmtAnanda} =   Get text  id=com.ccpp.msp.uat:id/tvAmount
    log to console    ${ConfAmtAnanda}
    Set Global variable   ${glob}       ${ConfAmtAnanda}
    ${remove_quama}=       Evaluate    '${ConfAmtAnanda}'.replace(',','')
    log to console   ${remove_quama}
    ${int}  Convert To Integer   ${remove_quama}
    ${billerAnanada} =   Get text  id=com.ccpp.msp.uat:id/tvMswRec
    Should Be Equal   ${Bname}    ${billerAnanada}   msg= Seleted ${Bname} as a biller match is not with biller name on confirm page as ${billerAnanada}
    log to console    ${billerAnanada}
    ${IsElementVisible1}=  Run Keyword And Return Status    Wait Until Element Is Visible    android=UiSelector().text("Rebate")   5s
    Run Keyword If    ${IsElementVisible1}     rebate value
    ${fee} =   Get text  id=com.ccpp.msp.uat:id/tvfeeAmount
    ${remove_space}=       Evaluate    '${fee}'.replace(' ','')
    log to console    ${remove_space}
    ${feeAmount} =   Fetch From Right	  ${remove_space}     K
    log to console    ${feeAmount}
    ${Addition}=       Evaluate    ${feeAmount} + ${Selectedamt}
    log to console    ${Addition}
    Should Be Equal   ${int}   ${Addition}     msg = amount is not match
On Sucesss screen
    [Arguments]         ${Bname}
    Success Screen      ${Bname}
Success Screen
    [Arguments]      ${Bname}
    ${IsElementVisible1}=  Run Keyword And Return Status    Wait Until Element Is Visible    android=UiSelector().text("ALLOW")   10s
    Run Keyword If    ${IsElementVisible1}  Tap    id=com.android.packageinstaller:id/permission_allow_button
    Wait Until Keyword Succeeds    1 min    1 sec    Element Should Be Visible    xpath=//android.widget.TextView[@text='SUCCESS!']
    ${SuccessAmtAnanda} =   Get text  id=com.ccpp.msp.uat:id/total
    log to console    ${SuccessAmtAnanda}
    Should Be Equal   ${glob}   ${SuccessAmtAnanda}   msg= Seleted ${glob} as a biller is not match with biller name on confirm page as ${SuccessAmtAnanda}
    Scroll    id=com.ccpp.msp.uat:id/arrow     android=UiSelector().text("SUCCESS!")
    Wait Until Element Is Visible    id=com.ccpp.msp.uat:id/btnBackToHome   30s
    ${successAnanda} =   Get text  id=com.ccpp.msp.uat:id/recName
    log to console   ${successAnanda}
    Should Be Equal   ${Bname}   ${successAnanda}   msg= Seleted ${Bname} as a biller is not match with biller name on confirm page as ${successAnanda}
    Tap   android=UiSelector().text("SHARE")
    sleep  2s
    Press Keycode                 4
    Wait Until Element Is Visible    id=com.ccpp.msp.uat:id/btnBackToHome   30s
    sleep  1s
    Tap   id=com.ccpp.msp.uat:id/btnBackToHome
    sleep  1s
    ${Redeem}=  Run Keyword And Return Status    Wait Until Element Is Visible    android=UiSelector().text("Redeem Success")   7s
    Run Keyword If    ${Redeem}      popup
