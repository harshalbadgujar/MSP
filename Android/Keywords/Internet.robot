*** Settings ***
Resource     ../Setting.robot
*** Variable ***
${Login_Number} =     9798304852
${RebateAMT}
*** Keywords ***
Internet.Login to the MSP android application for Internet Bill
    Invoke App   ${Login_Number}
Internet.To verify Ananda internet service provider
    Tap    ${Internet_btn}
    Wait Until Element Is Visible    ${Ananda}  30s
    Tap  ${Ananda}    30
    Wait Until Element Is Visible    ${Ananda}  30s
    @{amount} =  create list     5,000   10,000   20,000   35,000
        :FOR  ${i}  IN  @{amount}
        \   Tap  android=UiSelector().text("${i}")    30
        \   ${Outofstock}=  Run Keyword And Return Status    Wait Until Element Is Visible    ${Ok_Btn}   5s
        \   Run Keyword If    ${Outofstock}     Tap  ${Ok_Btn}
        \   ${cnfrm}=  Run Keyword And Return Status    Wait Until Element Is Visible    ${Confirm}   5s
        \   Run Keyword If    ${cnfrm}     PossibleRebate
        \   Exit For Loop IF    ${cnfrm} == True
        Run Keyword If    ${cnfrm} == False     log to console     all amounts out of stock
        Run Keyword If    ${cnfrm} == False     Swipe    497  1011   65  1555  4000
        Pass Execution If	${cnfrm} == False     all amounts out of stock
    On confirmation screen    ${i}   Ananda
    Tap  ${Confirm}
    ENTER PASSCODE
    If Fails To Login
    On Sucesss screen   Ananda

Internet.To verify Hi internet service provider
    ${Internetbar}=  Run Keyword And Return Status    Wait Until Element Is Visible    ${Ananda}   4s
    Run Keyword If    ${Internetbar}        Swipe    497  1011   65  1555  4000
    Wait Until Element Is Visible    ${TransferButton}  10
    Tap    ${Internet_btn}
    Wait Until Element Is Visible    ${Hi_Internet}  30s
    Tap  ${Hi_Internet}    30
    Wait Until Element Is Visible    ${Hi_Internet}  30s
    @{amount} =  create list     300   1,000   1,500
        :FOR  ${i}  IN  @{amount}
        \   Tap  android=UiSelector().text("${i}")    30
        \   ${Outofstock}=  Run Keyword And Return Status    Wait Until Element Is Visible    ${Ok_Btn}   5s
        \   Run Keyword If    ${Outofstock}     Tap  ${Ok_Btn}
        \   ${cnfrm}=  Run Keyword And Return Status    Wait Until Element Is Visible    ${Confirm}   5s
        \   Run Keyword If    ${cnfrm}     PossibleRebate
        \   Exit For Loop IF    ${cnfrm} == True
        Run Keyword If    ${cnfrm} == False     log to console     all amounts out of stock
        Run Keyword If    ${cnfrm} == False     Swipe    497  1011   65  1555  4000
        Pass Execution If	${cnfrm} == False     all amounts out of stock
    On confirmation screen    ${i}   Hi Internet
    Tap  ${Confirm}
    ENTER PASSCODE
    If Fails To Login
    On Sucesss screen   Hi Internet

Internet.To verify MyanmarNet Prepaid service provider
    ${HiInternetbar}=  Run Keyword And Return Status    Wait Until Element Is Visible    ${Hi_Internet}   4s
    Run Keyword If    ${HiInternetbar}        Swipe    497  1011   65  1555  4000
    Wait Until Element Is Visible    ${TransferButton}  10
    Tap    ${Internet_btn}
    Wait Until Element Is Visible    ${Mynmr_int}   30s
    Tap  ${Mynmr_int}     30
    Wait Until Element Is Visible    ${Mynmr_int}   30s
    @{amount} =  create list     1,000    3,000   5,000   10,000
        :FOR  ${i}  IN  @{amount}
        \   Tap  android=UiSelector().text("${i}")    30
        \   ${Outofstock}=  Run Keyword And Return Status    Wait Until Element Is Visible    ${Ok_Btn}   5s
        \   Run Keyword If    ${Outofstock}     Tap  ${Ok_Btn}
        \   ${cnfrm}=  Run Keyword And Return Status    Wait Until Element Is Visible    ${Confirm}   5s
        \   Run Keyword If    ${cnfrm}     PossibleRebate
        \   Exit For Loop IF    ${cnfrm} == True
    Run Keyword If    ${cnfrm} == False     log to console     all amounts out of stock
    Run Keyword If    ${cnfrm} == False     Swipe    497  1011   65  1555  4000
    Pass Execution If	${cnfrm} == False     all amounts out of stock
    On confirmation screen    ${i}   MyanmarNet Prepaid
    Tap  ${Confirm}
    ENTER PASSCODE
    If Fails To Login
    On Sucesss screen   MyanmarNet Prepaid

Internet.To verify Ooredoo Fiber service provider
    ${MInternetbar}=  Run Keyword And Return Status    Wait Until Element Is Visible    ${Mynmr_int})   4s
    Run Keyword If    ${MInternetbar}        Swipe    497  1011   65  1555  4000
    Wait Until Element Is Visible    ${TransferButton}  10
    Tap    ${Internet_btn}
    Wait Until Element Is Visible    ${Ooredo}  30s
    Tap  ${Ooredo}    30
    Wait Until Element Is Visible    ${Ooredo}  30s
    Input text  ${CustomerId}    1231
    Input text  ${CustomerNm}    harshal badgujar
    Input text  ${CustomerInvc}    543217
    Input text  ${CustomerAmt}    6,000
    Tap  ${NextBtn}
    On confirmation screen    6,000   Ooredoo Fiber
    Tap  ${Confirm}
    ENTER PASSCODE
    If Fails To Login
    On Sucesss screen   Ooredoo Fiber

Internet.To verify Telenor Fiber service provider
    ${MInternetbar}=  Run Keyword And Return Status    Wait Until Element Is Visible    ${Telenor_Fiber}   4s
    Run Keyword If    ${MInternetbar}        Swipe    497  1011   65  1555  4000
    Wait Until Element Is Visible    ${TransferButton}  10
    Tap    ${Internet_btn}
    Wait Until Element Is Visible    ${Telenor_Fiber}  30s
    Tap  ${Telenor_Fiber}    30
    Wait Until Element Is Visible    ${Telenor_Fiber}  30s
    Input text  ${editMo}    09791001059
    Tap   ${NextBtn}
    Wait Until Element Is Visible    ${Internet}  30s
    ${Telenor} =   Get text  ${CustomerAmt}
    Log to console   ${Telenor}
    Swipe   52  1607  60  1381  4000
    Tap     ${NextBtn}   30s
    On confirmation screen    ${Telenor}   Telenor Fiber
    Tap  ${Confirm}
    ENTER PASSCODE
    If Fails To Login
    On Sucesss screen   Telenor Fiber

Internet.To validate Wrong number Telenor Fiber
   ${MInternetbar}=  Run Keyword And Return Status    Wait Until Element Is Visible    ${Telenor_Fiber}   4s
    Run Keyword If    ${MInternetbar}        Swipe    497  1011   65  1555  4000
    Wait Until Element Is Visible    ${TransferButton}  10
    Tap    ${Internet_btn}
    Wait Until Element Is Visible    ${Telenor_Fiber}  30s
    Tap  ${Telenor_Fiber}    30
    Wait Until Element Is Visible    ${Telenor_Fiber}  30s
    Input text  ${editMo}     09791001055
    Tap   ${NextBtn}
    Wait Until Element Is Visible    ${PopupTitle}     30s
    ${Mo_Popup_Header} =   Get Text    ${PopupTitle}
    ${Wrong_NumText} =     Get Text    ${PopupMsg}
    Log to console     ${Mo_Popup_Header}
    Log to console     ${Wrong_NumText}
    Tap  ${PopupOk}
    Wait Until Element Is Visible    ${NextBtn}  30s
    Press Keycode                 4
Internet.To validate insufficient balance of Ooredoo fiber
    ${MInternetbar}=  Run Keyword And Return Status    Wait Until Element Is Visible    ${Mynmr_int}   4s
    Run Keyword If    ${MInternetbar}        Swipe    497  1011   65  1555  4000
    Wait Until Element Is Visible    ${TransferButton}  10
    Tap    ${Internet_btn}
    Wait Until Element Is Visible    ${Ooredo}  30s
    Tap  ${Ooredo}    30
    Wait Until Element Is Visible    ${Ooredo}  30s
    Input text  ${CustomerId}    1231
    Input text  ${CustomerNm}    harshal badgujar
    Input text  ${CustomerInvc}    54321777
    Input text  ${CustomerAmt}    12000000
    Tap  ${NextBtn}
    ${Mo_Popup_Header} =   Get Text    ${PopupTitle}
    ${Wrong_NumText} =     Get Text    ${PopupMsg}
    Log to console     ${Mo_Popup_Header}
    Log to console     ${Wrong_NumText}
    Tap  ${PopupOk}
    Wait Until Element Is Visible    ${Ooredo}  30s
    Press Keycode                 4
    Wait Until Element Is Visible    ${TransferButton}  30s

