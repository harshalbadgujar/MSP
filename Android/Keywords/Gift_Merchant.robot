*** Settings ***
Resource     ../Setting.robot
*** Variable ***
${Login_Num} =        9405175231
${Gift_MobileP_No} =  09450002831
${Wrong_Viberout} =   9798304852
*** Keywords ***
Gift_Merchant.To verify Login to the Merchant account

    Wait Until Element Is Visible    ${Registration}  30
    Tap    ${SignIn}
    Wait Until Element Is Visible    ${MoNoPage}
    Input Text    ${EnterMoNo}    9405175231
    Tap    ${ConfirmLgn}
    ENTER PASSCODE
    If Fails To Login
    Wait Until Element Is Visible    ${TransferButton}  30s

Gift_Merchant.To verify that iTunes service provider for Merchant gifts
    Tap    ${GiftButton}
    Wait Until Element Is Visible    ${Wait_gifts}   30s
    Tap    ${iTunes}
    Wait Until Element Is Visible    ${iTunes}  30s
    Tap    ${Tap5}
    PossibleRebate
    Wait Until Element Is Visible    ${WaitConfm}   30s
    Tap  ${WaitConfm}
    ENTER PASSCODE
    If Fails To Login
    Allow_Pop-up
    Wait Until Keyword Succeeds    1 min    1 sec    Element Should Be Visible    ${SucessPg}
    Scroll    ${ScrollFrom}    ${ScrollToGift}
    Wait Until Element Is Visible    ${BacktoHome}   30s
    Tap   ${BacktoHome}
    sleep  3s
    ${Redeem}=  Run Keyword And Return Status    Wait Until Element Is Visible    android=UiSelector().text("Redeem Success")   40s
    Run Keyword If    ${Redeem}      popup

Gift_Merchant.To verify that Vakok Service provider for Merchant gifts
    Tap    ${GiftButton}
    Wait Until Element Is Visible    ${Wait_gifts}   30s
    Tap    ${Vakok}
    Wait Until Element Is Visible    ${Vakok}  30s
    Tap    ${Tap3}
    PossibleRebate
    Wait Until Element Is Visible    ${WaitConfm}   30s
    Tap  ${WaitConfm}
    ENTER PASSCODE
    If Fails To Login
    Allow_Pop-up
    Wait Until Keyword Succeeds    1 min    1 sec    Element Should Be Visible    ${SucessPg}
    Scroll    ${ScrollFrom}    ${ScrollToGift}
    Wait Until Element Is Visible    ${BacktoHome}   30s
    Tap   ${BacktoHome}
    sleep  3s
    ${Redeem}=  Run Keyword And Return Status    Wait Until Element Is Visible    ${ReedeemSucess}   40s
    Run Keyword If    ${Redeem}      popup
Gift_Merchant.To verfiry that viberOut Service provider for Merchant gifts
    Tap    ${GiftButton}
    Wait Until Element Is Visible    ${Wait_gifts}   30s
    Tap    ${ViberOut}
    Wait Until Element Is Visible    ${ViberOut}  30s
    Tap    ${Tap1}
    Input Text    ${EnterMo}     ${Gift_MobileP_No}
    Tap   ${NextBtn}
    PossibleRebate
    Wait Until Element Is Visible    ${WaitConfm}   30s
    Tap  ${WaitConfm}
    ENTER PASSCODE
    If Fails To Login
    Allow_Pop-up
    Wait Until Keyword Succeeds    1 min    1 sec    Element Should Be Visible    ${SucessPg}
    Scroll    ${ScrollFrom}    ${ScrollToGift}
    Wait Until Element Is Visible    ${BacktoHome}   30s
    Tap   ${BacktoHome}
    sleep  3s
    ${Redeem}=  Run Keyword And Return Status    Wait Until Element Is Visible    ${ReedeemSucess}   40s
    Run Keyword If    ${Redeem}      popup
Gift_Merchant.To Validate that Wrong ViverOut Mobile Number in merchant login
    Tap    ${GiftButton}
    Wait Until Element Is Visible    ${Wait_gifts}   30s
    Tap    ${ViberOut}
    Wait Until Element Is Visible    ${ViberOut}  30s
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
    Swipe    130    312    121    1413

Gift_Merchant.To validate that Humberger charge amount
     Tap  ${Humberger_Menu}
     Wait Until Element Is Visible    ${TransferButton}   120s
     Tap   ${Charge}
     Wait Until Element Is Visible    ${ChargeAmount}   12s
     Tap   ${Tap1000}
     Tap  ${CONTINUE}
     Allow_Pop-up
     sleep   2s
     Press Keycode   4
     sleep  2s
     Press Keycode   4
