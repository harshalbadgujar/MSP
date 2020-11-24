*** Settings ***
Resource     ../Setting.robot
*** Variable ***
${Login_Number} =       9798304852
${Gift_MobileP_No} =    09450002831
${Wrong_Viberout} =     9798304852
*** Keywords ***
Gifts_Customer.Login to the MSP android application for Gifts

    Invoke App   ${Login_Number}

Gifts_Customer.To verify that iTunes service provider for customer gifts
    Tap    ${GiftButton}
    Wait Until Element Is Visible    ${Wait_gifts}   30s
    Tap    android=UiSelector().text("iTunes")
    Wait Until Element Is Visible    ${iTunes}  30s
    @{amount} =  create list     5   10   15    25    50    100
        :FOR  ${i}  IN  @{amount}
        \   Tap  android=UiSelector().text("${i}")    30
        \   ${Outofstock}=  Run Keyword And Return Status    Wait Until Element Is Visible    ${okBtn}   5s
        \   Run Keyword If    ${Outofstock}     Tap  ${okBtn}
        \   ${cnfrm}=  Run Keyword And Return Status    Wait Until Element Is Visible    ${ConfirmBtn}   5s
        \   Run Keyword If    ${cnfrm}     PossibleRebate
        \   Exit For Loop IF    ${cnfrm} == True
         Run Keyword If    ${cnfrm} == False     log to console     all amounts out of stock
         Pass Execution If	${cnfrm} == False     all amounts out of stock
    Wait Until Element Is Visible    ${ConfirmBtn}   30s      error=Test case failed due to all amounts are out of stock
    ${ConfAmt} =   Get text  id=com.ccpp.msp.uat:id/tvAmount
    log to console    ${ConfAmt}
    ${billeriTunes} =   Get text  id=com.ccpp.msp.uat:id/tvMswRec
    Should Be Equal   iTunes  ${billeriTunes}   msg= Seleted iTunes as a biller match is not with biller name on confirm page as ${billeriTunes}
    log to console    ${billeriTunes}
    Tap  ${ConfirmBtn}
    ENTER PASSCODE
    If Fails To Login
    Allow_Pop-up
    Wait Until Keyword Succeeds    1 min    1 sec    Element Should Be Visible    ${SucessPg}
   ${SuccessAmount} =   Get text  ${TotalAmt}
   log to console    ${SuccessAmount}
   Should Be Equal   ${ConfAmt}   ${SuccessAmount}   msg= Seleted ${ConfAmt} as a biller is not match with biller name on confirm page as ${SuccessAmount}
   Scroll    ${ScrollFrom}    ${ScrollToGift}
   Wait Until Element Is Visible    ${BacktoHome}   30s
   ${successiTunes} =   Get text  ${Details}
   log to console   ${successiTunes}
   Should Be Equal   iTunes  ${successiTunes}   msg= Seleted iTunes as a biller is not match with biller name on confirm page as ${successiTunes}
   Tap   ${Share}
   Press Keycode                 4
   sleep  2s
   Wait Until Element Is Visible    ${BacktoHome}   30s
   Tap   ${BacktoHome}
   sleep  3s
   ${Redeem}=  Run Keyword And Return Status    Wait Until Element Is Visible    ${ReedeemSucess}   5s
   Run Keyword If    ${Redeem}      popup

Gifts_Customer.To verify that Vakok Service provider for Customer gifts
     ${Internetbar}=  Run Keyword And Return Status    Wait Until Element Is Visible    ${iTunes}   4s
    Run Keyword If    ${Internetbar}      Press Keycode   4
     Tap    ${GiftButton}
    Wait Until Element Is Visible    ${Wait_gifts}   30s
    Tap    ${Vakok}
    Wait Until Element Is Visible    ${Vakok}  30s
    @{amount} =  create list     3,000   5,000   10,000
        :FOR  ${i}  IN  @{amount}
        \   Tap  android=UiSelector().text("${i}")    30
        \   ${Outofstock}=  Run Keyword And Return Status    Wait Until Element Is Visible    ${okBtn}   5s
        \   Run Keyword If    ${Outofstock}     Tap  ${okBtn}
        \   ${cnfrm}=  Run Keyword And Return Status    Wait Until Element Is Visible    ${ConfirmBtn}   5s
        \   Run Keyword If    ${cnfrm}     PossibleRebate
        \   Exit For Loop IF    ${cnfrm} == True
        Run Keyword If    ${cnfrm} == False     log to console     all amounts out of stock
        Pass Execution If	${cnfrm} == False     all amounts out of stock
     Wait Until Element Is Visible    ${ConfirmBtn}   30s      error=Test case failed due to all amounts are out of stock
    ${ConfAmt} =   Get text  ${ConfrmAmount}
    log to console    ${ConfAmt}
    ${billeriTunes} =   Get text  ${ConfrimBiler}
    Should Be Equal   Vakok  ${billeriTunes}   msg= Seleted Vakok as a biller match is not with biller name on confirm page as ${billeriTunes}
    log to console    ${billeriTunes}
    Tap  ${ConfirmBtn}
    ENTER PASSCODE
    If Fails To Login
    Allow_Pop-up
    Wait Until Keyword Succeeds    1 min    1 sec    Element Should Be Visible    ${SucessPg}
   ${SuccessAmount} =   Get text  ${TotalAmt}
   log to console    ${SuccessAmount}
   Should Be Equal   ${ConfAmt}   ${SuccessAmount}   msg= Seleted ${ConfAmt} as a biller is not match with biller name on confirm page as ${SuccessAmount}
    Scroll    ${ScrollFrom}    ${ScrollToGift}
    Wait Until Element Is Visible    ${BacktoHome}   30s
    ${successiTunes} =   Get text  ${Details}
    log to console   ${successiTunes}
    Should Be Equal   Vakok  ${successiTunes}   msg= Seleted Vakok as a biller is not match with biller name on confirm page as ${successiTunes}
    Tap   ${Share}
    Press Keycode                 4
    sleep  2s
    Wait Until Element Is Visible    ${BacktoHome}   30s
    Tap   ${BacktoHome}
    sleep  3s
    ${Redeem}=  Run Keyword And Return Status    Wait Until Element Is Visible    ${ReedeemSucess}   30s
    Run Keyword If    ${Redeem}      popup

Gifts_Customer.To verfiry that viberOut Service provider for Customer gifts
    ${Internetbar}=  Run Keyword And Return Status    Wait Until Element Is Visible    ${Vakok}   4s
    Run Keyword If    ${Internetbar}       Press Keycode   4
    Tap    ${GiftButton}
    Wait Until Element Is Visible    ${Wait_gifts}   30s
    Tap    ${ViberOut}
    Wait Until Element Is Visible    ${ViberOut}  30s
    Input Text    ${EnterMo}     ${Gift_MobileP_No}
     @{amount} =  create list     1   2   3    5    10    20
        :FOR  ${i}  IN  @{amount}
        \   Tap  android=UiSelector().text("${i}")    30
        \   Tap   ${GiftViberNext}
        \   ${Outofstock}=  Run Keyword And Return Status    Wait Until Element Is Visible    ${okBtn}   5s
        \   Run Keyword If    ${Outofstock}     Tap  ${okBtn}
        \   ${cnfrm}=  Run Keyword And Return Status    Wait Until Element Is Visible    ${ConfirmBtn}   5s
        \   Run Keyword If    ${cnfrm}     PossibleRebate
        \   Exit For Loop IF    ${cnfrm} == True
    Wait Until Element Is Visible    ${ConfirmBtn}   30s
     ${ConfAmtViberOut} =   Get text  ${ConfrmAmount}
    log to console    ${ConfAmtViberOut}
    ${billerViberOut} =   Get text  ${ConfrimBiler}
    Should Be Equal   ViberOut  ${billerViberOut}   msg= Seleted iTunes as a biller is not match with biller name on confirm page as ${billerViberOut}
    log to console    ${billerViberOut}
    Tap  ${ConfirmBtn}
    ENTER PASSCODE
    If Fails To Login
    Allow_Pop-up
    Wait Until Keyword Succeeds    1 min    1 sec    Element Should Be Visible    ${SucessPg}
   ${SuccessAmtViberOut} =   Get text  ${TotalAmt}
   log to console    ${SuccessAmtViberOut}
   Should Be Equal   ${ConfAmtViberOut}   ${SuccessAmtViberOut}   msg= Seleted ${ConfAmtViberOut} as a biller is not match with biller name on confirm page as ${SuccessAmtViberOut}
    Scroll    ${ScrollFrom}    ${ScrollToGift}
    Wait Until Element Is Visible    ${BacktoHome}   30s
    ${successViberOut} =   Get text  ${Details}
    log to console   ${successViberOut}
    Should Be Equal   ViberOut  ${successViberOut}   msg= Seleted ViberOut as a biller is not match with biller name on confirm page as ${successViberOut}
    Tap   ${Share}
    Press Keycode                 4
    sleep  2s
    Wait Until Element Is Visible    ${BacktoHome}   30s
    Tap   ${BacktoHome}
    sleep  3s
    ${Redeem}=  Run Keyword And Return Status    Wait Until Element Is Visible    ${ReedeemSucess}   30s
    Run Keyword If    ${Redeem}      popup

Gifts_Customer.To Validate that Wrong ViverOut Mobile Number in customer login
    ${Internetbar}=  Run Keyword And Return Status    Wait Until Element Is Visible    ${ViberOut}   4s
    Run Keyword If    ${Internetbar}       Press Keycode   4
    Wait Until Element Is Visible    ${GiftButton}   30s
    Tap    ${GiftButton}
    Wait Until Element Is Visible    ${Wait_gifts}   30s
    Tap    ${ViberOut}
    Wait Until Element Is Visible      ${ViberOut}    30s
    Tap    ${Tap1}
    Input Text    ${EnterMo}     ${Wrong_Viberout}
    Tap   ${NextBtn}
    Wait Until Element Is Visible    ${WaitConfm}   30s
    Tap  ${WaitConfm}
    ENTER PASSCODE
    If Fails To Login
    Wait Until Element Is Visible    ${okBtn}   30s
    Tap  ${okBtn}
    Wait Until Element Is Visible    ${ViberOut}  30s
    Press Keycode  4
    Wait Until Element Is Visible    ${TransferButton}  60s

Gifts_Customer.To Validate that Wrong Contact number through phone book of viberOut
    Wait Until Element Is Visible    ${GiftButton}  30s
    Tap    ${GiftButton}
    Wait Until Element Is Visible    ${Wait_gifts}   30s
    Tap    ${ViberOut}
    Wait Until Element Is Visible    ${ViberOut}  30s
    Tap    ${Tap1}
    Tap    ${Contact}
    Allow_Pop-up
    Wait Until Element Is Visible    ${Merchant}  30s
    Tap   ${Merchant}
    Tap   ${NextBtn}
    Wait Until Element Is Visible    ${WaitConfm}   30s
    Tap  ${WaitConfm}
    ENTER PASSCODE
    If Fails To Login
    Wait Until Element Is Visible    ${Popup}     30s
    ${GIft_Popup_Viberout} =   Get Text    ${Popup}
    ${Insufficient_Bal_Viber} =   Get Text    ${Popup_msg}
    Log to console   ${GIft_Popup_Viberout}
    Log to console   ${Insufficient_Bal_Viber}
    Tap  ${okBtn}
    Wait Until Element Is Visible    ${ViberOut}   60s
    PressKeycode   4
Gifts_Customer.Signout from Customer
    Tap  ${Humberger_Menu}
    Wait Until Element Is Visible    ${pay}  30s
    Scroll    ${Hum_ScrollFrom}     ${Hum_ScrollTo}
    Tap  ${SIGNOUT}

