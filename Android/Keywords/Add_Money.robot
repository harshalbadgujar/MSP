*** Settings ***
Resource     ../Setting.robot
*** Variable ***
${Login_Number} =  9798304852
${Top-up Amt} =    100
*** Keywords ***
Add_Money.Login to the MSP android application for Add Money to Wallet
   Invoke App   ${Login_Number}
Add_Money.Select Custom Amount option and enter Amount in custom text box
    Wait Until Element Is Visible    ${Visible_Home}  40s
    Tap    ${Tap_Add_Money}
    Wait Until Element Is Visible    ${Add_page}  60s
    Swipe    207    1605    130    792    3000
    Wait Until Element Is Visible    ${Custom_Option}    60s
    Tap  ${Custom_Option}
    Wait Until Element Is Visible    id=com.ccpp.msp.uat:id/edtAmount   60s
    Input Text    ${Enter_Amount}    ${Top-up Amt}
    Tap    ${Confirm_Button}
Add_Money.Select MPU option for payments Custom Amount
    Wait Until Element Is Visible   ${Tap_Biller_MPU}  60s
    Tap  ${Tap_Biller_MPU}
    Wait Until Element Is Visible    ${Confirmation}  60s
    Swipe    962    1234    415    721    3000
    Tap   ${Confirm}
    Wait Until Element Is Visible    ${Cancel_Button}    180s
    Tap    ${Tap_Cancel}
    ${Cancel}=  Run Keyword And Return Status    Wait Until Element Is Visible    ${Cancel_Pop-up}  7s
    Run Keyword If    ${Cancel}      Tap    ${Close_popup}
    ${Swipeback}=  Run Keyword And Return Status    Wait Until Element Is Visible    ${Add_page}  7s
    Run Keyword If    ${Swipeback}      Swipe  600    960    320    1578    3000
Add_Money.Select Amount Direct throught the button
    Tap    ${Tap_Add_Money}
    Wait Until Element Is Visible    ${Add_page}  60s
    Swipe    207    1605    130    792    3000  
    Tap    ${Amount5000}
Add_Money.Select MPU option for payment throught the button
    Wait Until Element Is Visible   ${Tap_Biller_MPU}  60s
    Tap  ${Tap_Biller_MPU}
    Wait Until Element Is Visible    ${Confirmation}  60s
    Swipe    962    1234    415    721    3000
    Tap  ${Confirm}
    Wait Until Element Is Visible    ${Cancel_Button}   180s
    Tap    ${Tap_Cancel}
    ${Cancel}=  Run Keyword And Return Status    Wait Until Element Is Visible    ${Cancel_Pop-up}  7s
    Run Keyword If    ${Cancel}      Tap    ${Close_popup}
    ${Swipeback}=  Run Keyword And Return Status    Wait Until Element Is Visible    ${Add_page}  7s
    Run Keyword If    ${Swipeback}      Swipe  600    960    320    1578    3000

