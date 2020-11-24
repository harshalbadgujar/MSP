*** Settings ***
Resource     ../Setting.robot
*** Variable ***
${Login_Number} =     9798304852
${eLoad_Number} =     09964233241
*** Keywords ***
eLoad.Login to the MSP android application for Eload in Mobile
  Invoke App   ${Login_Number}

eLoad.Eload Functionality by the Reedem rewards on elaod transaction
    Tap    ${Realod_Button}
    Wait Until Element Is Visible    ${Chose_dp}  20s
    Input Text    ${Enter_Mo}    ${eLoad_Number}
    Wait Until Element Is Visible    ${elaod}  30s
    Tap    ${Tap_1000MMK}
    Wait Until Element Is Visible    ${Confirm}  30s
    On confirmation screen    1,000    Ooredoo eLoad
    Tap  ${Confirm}
    ENTER PASSCODE
    If Fails To Login
eLoad.Check Success page of Eoad reedem validate
    Allow_Pop-up
    Wait Until Element Is Visible    ${RedeemButton}   30s
    Tap  ${RedeemButton}
    ${Redeem}=  Run Keyword And Return Status    Wait Until Element Is Visible    ${RedeemSucess}   5s
    Run Keyword If    ${Redeem}      popup
    Wait Until Keyword Succeeds    1 min    1 sec    Element Should Be Visible    ${Success_page}
    ${SuccessAmtAnanda} =   Get text  ${Get_Amt}
    log to console    ${SuccessAmtAnanda}
    Should Be Equal   ${glob}   ${SuccessAmtAnanda}   msg= Seleted ${glob} as a biller is not match with biller name on confirm page as ${SuccessAmtAnanda}
    ${successAnanda} =   Get text  ${ReceiverName}
    log to console   ${successAnanda}
    Should Be Equal   Ooredoo eLoad   ${successAnanda}   msg= Seleted Ooredoo eLoad as a biller is not match with biller name on confirm page as ${successAnanda}
    Scroll    ${Scrollfrom}    ${ScrollToeload}
    Wait Until Element Is Visible    ${BacktoHome}   30s
    Tap   ${Share}
    sleep  2s
    Press Keycode                 4
    Wait Until Element Is Visible    ${BacktoHome}    30s
    Tap    ${BacktoHome}

eLoad.Eload Functionality by the Donate rewards on elaod transaction
    Wait Until Element Is Visible    ${TransferButton}  40s
    Tap    ${Realod_Button}
    Wait Until Element Is Visible    ${Chose_dp}  20s
    Input Text    ${Enter_Mo}   ${eLoad_Number}
    Wait Until Element Is Visible    ${elaod}  30s
    Tap    ${Tap_1000}
    Wait Until Element Is Visible    ${Confirm}  30s
    On confirmation screen    1,000   Ooredoo eLoad
    Tap  ${Confirm}
    ENTER PASSCODE
    If Fails To Login
eLoad.Check Success page of the Elaod Donate validate
    Allow_Pop-up
    Wait Until Element Is Visible    ${Donate}    30s
    Tap  ${Donate}
    Wait Until Element Is Visible    ${DonationRank}  30s
    Tap  ${OK_button}
    ${Redeem}=  Run Keyword And Return Status    Wait Until Element Is Visible    ${RedeemSucess}   5s
    Run Keyword If    ${Redeem}      popup
    Wait Until Keyword Succeeds    1 min    1 sec    Element Should Be Visible    ${Success_page}
    ${SuccessAmtAnanda} =   Get text  ${Get_Amt}
    log to console    ${SuccessAmtAnanda}
    Should Be Equal   ${glob}   ${SuccessAmtAnanda}   msg= Seleted ${glob} as a biller is not match with biller name on confirm page as ${SuccessAmtAnanda}
    ${successAnanda} =   Get text  ${ReceiverName}
    log to console   ${successAnanda}
    Should Be Equal   Ooredoo eLoad   ${successAnanda}   msg= Seleted Ooredoo eLoad as a biller is not match with biller name on confirm page as ${successAnanda}
    Scroll    ${Scrollfrom}    ${ScrollToeload}
    Wait Until Element Is Visible    ${BacktoHome}   30s
    Tap   ${Share}
    sleep  2s
    Press Keycode                 4
    Wait Until Element Is Visible    ${BacktoHome}    30s
    Tap    ${BacktoHome}
    Wait Until Element Is Visible    android=UiSelector().text("Transfer")  40s
