*** Settings ***
Resource     ../Setting.robot
*** Variable ***
${Login_Number} =  9798304852
${Expected_Amount} =  100
${Billnumber} =  042019080201000040
*** Keywords ***
Bills.Login to the MSP android application for pay bills of MCDC and electricity
    Invoke App   ${Login_Number}
Bills.To validate Already paid bill of MCDC
    Wait Until Element Is Visible    ${TransferButton}  40s
    Tap    ${Bill_Btn}
    Wait Until Element Is Visible    ${Wait_Bills}
    Tap    ${Tap_bill}
    Wait Until Element Is Visible    ${Mandaley_Bill}
    Input Text    ${BillText}     ${Billnumber}
    Tap    ${NextBtn}
    Wait Until Element Is Visible    ${AlreadyPaid}   60s
    Tap   ${Okbtn}
    Wait Until Element Is Visible    ${Mandaley_Bill}   30s
    Press Keycode                 4
    Wait Until Element Is Visible    ${TransferButton}  30s
Bills.To validate Invalid Invoice number of MCDC payment
    Wait Until Element Is Visible    ${TransferButton}  40s
    Tap    ${Bill_Btn}
    Wait Until Element Is Visible    ${Wait_Bills}
    Tap    ${Tap_bill}
    Wait Until Element Is Visible    ${Mandaley_Bill}
    Input Text    ${BillText}     345645676549823456
    Tap    ${NextBtn}
    Wait Until Element Is Visible    ${Inv_Num}   60s
    Tap   ${Okbtn}
    Wait Until Element Is Visible    ${Mandaley_Bill}   30s
    Press Keycode                 4
Bills.To validate Length of the Invoice number of MCDC bills
    Wait Until Element Is Visible    ${TransferButton}  40s
    Tap    ${Bill_Btn}
    Wait Until Element Is Visible    ${Wait_Bills}
    Tap    ${Tap_bill}
    Wait Until Element Is Visible    ${Mandaley_Bill}
    Input Text    ${BillText}     34564567654982345643
    Tap    ${NextBtn}
    Wait Until Element Is Visible    ${Pop-upMsg}   60s
    Tap   ${Okbtn}
    Wait Until Element Is Visible    ${Mandaley_Bill}   30s
    Press Keycode                 4
Bills.To validate an Invalid meter bill of MESC bills
    Wait Until Element Is Visible    ${TransferButton}  40s
    Tap    ${Bill_Btn}
    Wait Until Element Is Visible    ${Elec_Pop}   30s
    Tap    ${Elec_Pop}
    Wait Until Element Is Visible    ${State}   30s
    Tap    ${State}
    Wait Until Element Is Visible    ${City}   30s
    Tap    ${City}
    Input Text   ${Unique_code}      543455
    Tap    ${MESCNext}
    Wait Until Element Is Visible    ${Invalidmtrbill}   60s
    Tap   ${Okbtn}
    Press Keycode  4
#Bills.To verify MCDC bill for pay bill of valid invoice
#     Tap    ${Bill_Btn}
#    Wait Until Element Is Visible    ${Wait_Bills}
#    Tap    ${Tap_bill}
#    Wait Until Element Is Visible    ${Mandaley_Bill}
#    Input Text    ${BillText}     ${Billnumber}
#    Tap    ${NextBtn}
#    Wait Until Element Is Visible    android=UiSelector().text("CONFIRMATION")    10s
#    Tap   android=UiSelector().text("CONFIRM")
#    ENTER PASSCODE
#    Wait Until Element Is Visible    android=UiSelector().text("SUCCESS!")
#    Swipe    983    1290    184    884
#    Tap    id=com.ccpp.msp.uat:id/btnBackToHome
#    Transaction Details   ${Expected_Amount}   ${Type}
#    Tap  id=com.ccpp.msp.uat:id/ibBackIcon
#    Tap  id=com.ccpp.msp.uat:id/ibBackIcon
#    Wait Until Element Is Visible    android=UiSelector().text("Show All Transaction")
#    Swipe    1054    967    699    1715
#    Wait Until Element Is Visible    ${TransferButton}  10
#    Transaction Details   ${Expected_Amount}   ${Type}
    

