*** Settings ***
Resource     ../Setting.robot
*** Variable ***
${Login_Number} =     9798304852
${abc}
*** Keywords ***
PossibleRebate
     ${rebate}=  Run Keyword And Return Status    Wait Until Element Is Visible    android=UiSelector().text("Rebate")   10s
      Run Keyword If    ${rebate}     rebate value
rebate value
    ${RebateAMT} =   Get Text  id=com.ccpp.msp.uat:id/tvRebate
    ${remove_space}=       Evaluate    '${RebateAMT}'.replace(' ','')
    log to console    ${remove_space}
    ${RebateAmount} =   Fetch From Right	  ${remove_space}     K
     log to console    ${RebateAmount}
     Set Global variable   ${abc}       ${RebateAmount}
popup

    ${Redeempopup}=   Get Text   id=com.ccpp.msp.uat:id/tvAmt
    ${remove_space1}=       Evaluate    '${Redeempopup}'.replace(' ','')
    log to console    ${remove_space1}
    ${RedeemedAmount} =   Fetch From Right	  ${remove_space1}     K
    log to console    ${RedeemedAmount}
    Should Be Equal   ${abc}  ${RedeemedAmount}   msg= Redeemed amount= ${RedeemedAmount} is not match with rebate amount= ${abc}
    Tap   id=com.ccpp.msp.uat:id/iv_close

Allow_Pop-up
    ${Allow}=  Run Keyword And Return Status    Wait Until Element Is Visible    android=UiSelector().text("ALLOW")   10s
    Run Keyword If    ${Allow}  Tap    id=com.android.packageinstaller:id/permission_allow_button