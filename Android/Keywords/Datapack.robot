*** Settings ***
Resource     ../Setting.robot
*** Variable ***
${Login_Number} =        9798304852
${Datapack_Number} =     09694504895

*** Keywords ***
Datapck.Login to the MSP android application for Datapack in Mobile
  Invoke App   ${Login_Number}
Datapck.Datapack Functionality by Checeking datapack on datapack transaction
    Wait Until Element Is Visible    ${TransferButton}  40s
    Tap    ${Realod_Button}
    Wait Until Element Is Visible    ${Chose_dp}  60s
    Input Text    ${Enter_Mo}    ${Datapack_Number}
    Wait Until Element Is Visible    ${Select1000}  30s
    Tap    ${Tap1000MB}
    On confirmation screen    1,050    MyTel DataPack
    Tap  ${Confirm}
    ENTER PASSCODE
    If Fails To Login
Datapck.Check Success page of datapack
    Allow_Pop-up
    Wait Until Keyword Succeeds    1 min    1 sec    Element Should Be Visible    ${Success_page}
    ${SuccessAmtAnanda} =   Get text  ${Get_Amt}
    log to console    ${SuccessAmtAnanda}
    Should Be Equal   ${glob}   ${SuccessAmtAnanda}   msg= Seleted ${glob} as a biller is not match with biller name on confirm page as ${SuccessAmtAnanda}
    ${successAnanda} =   Get text  ${ReceiverName}
    log to console   ${successAnanda}
    Should Be Equal   MyTel DataPack     ${successAnanda}   msg= Seleted MyTel DataPack as a biller is not match with biller name on confirm page as ${successAnanda}
    Scroll    ${Scrollfrom}    ${ScrollToeload}
    Wait Until Element Is Visible    ${BacktoHome}   30s
    Tap   ${Share}
    sleep  2s
    Press Keycode                 4
    ${TapRedeem}=  Run Keyword And Return Status    Wait Until Element Is Visible    ${RedeemButton}   5s
    Run Keyword If    ${TapRedeem}      Tap   ${RedeemButton}
    ${Redeem}=  Run Keyword And Return Status    Wait Until Element Is Visible    ${RedeemSucess}   5s
    Run Keyword If    ${Redeem}      popup
    ${BackButton}=  Run Keyword And Return Status   Wait Until Element Is Visible    ${BacktoHome}   3s
    Run Keyword If    ${BackButton}      Tap   ${BacktoHome}

Datapck.Datapack-Donate
    Wait Until Element Is Visible    ${TransferButton}  40s
    Tap    ${Realod_Button}
    Wait Until Element Is Visible    ${elaod}
    sleep  2s
    Input Text    ${Enter_Mo}    ${Datapack_Number}
    sleep  2s
    Wait Until Element Is Visible    ${Select1000}  30s
    Tap    ${Tap1000}
    On confirmation screen    1,050   MyTel DataPack
    Tap  ${Confirm}
    ENTER PASSCODE
    If Fails To Login
    Allow_Pop-up
    Wait Until Keyword Succeeds    1 min    1 sec    Element Should Be Visible    ${Success_page}
    ${SuccessAmtAnanda} =   Get text  ${Get_Amt}
    log to console    ${SuccessAmtAnanda}
    Should Be Equal   ${glob}   ${SuccessAmtAnanda}   msg= Seleted ${glob} as a biller is not match with biller name on confirm page as ${SuccessAmtAnanda}
    ${successAnanda} =   Get text  ${ReceiverName}
    log to console   ${successAnanda}
    Should Be Equal   MyTel DataPack   ${successAnanda}   msg= Seleted MyTel DataPack as a biller is not match with biller name on confirm page as ${successAnanda}
    Scroll    ${Scrollfrom}    ${ScrollToeload}
    Wait Until Element Is Visible    ${BacktoHome}   30s
    Tap   ${Share}
    sleep  2s
    Press Keycode                 4
    ${TapDonate}=  Run Keyword And Return Status    Wait Until Element Is Visible    ${Donate}    7s
    Run Keyword If    ${TapDonate}      Tap  ${Donate}
    ${Drank}=  Run Keyword And Return Status    Wait Until Element Is Visible    ${DonationRank}  7s
    Run Keyword If    ${Drank}      Tap  ${OK_button}
    ${Redeem}=  Run Keyword And Return Status    Wait Until Element Is Visible    ${RedeemSucess}   5s
    Run Keyword If    ${Redeem}      popup
    ${BackButton}=  Run Keyword And Return Status   Wait Until Element Is Visible    ${BacktoHome}   3s
    Run Keyword If    ${BackButton}      Tap   ${BacktoHome}

