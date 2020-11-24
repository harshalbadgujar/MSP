*** Settings ***
Resource     ../Setting.robot
*** Variable ***
${Type} =  Transfer Functionality
${Login_Number} =     9798304852
${Transfer_Amount} =  50
${Transfer_Number} =  09405175245
*** Keywords ***
Transfer.Login to the MSP Android application for Transfer
    Invoke App   ${Login_Number}
Transfer.Open Transfer page and fill details
    Tap     ${TransferButton}
    Wait Until Element Is Visible    ${MSP}  30s
    Input Text    ${Mobile_Number}    ${Transfer_Number}
    Tap    ${Tap_on_Edit_Mo}
    Press Keycode                 4
    Wait Until Element Is Visible    ${Wait_Transfer}
    Tap    ${Tap_Transfer}
    Press Keycode                 4
    Wait Until Element Is Visible    ${Wait_Amount}
    Input Text    ${Amount}    ${Transfer_Amount}
    Input Text    ${Note}    Robot Test
    Tap    id=com.ccpp.msp.uat:id/btnTransferNext
    Wait Until Element Is Visible    ${Wait_Conf}
    Swipe	619	1193	415	695	2000
    Tap   ${Tap_confirm}
Transfer.Enter Passcode for Transfer
    ENTER PASSCODE
    If Fails To Login
Transfer.Check Transfer Success Page Back to the Home
    Wait Until Element Is Visible    ${wait_Allow}
    Tap    ${Tap_Allow}
    Wait Until Element Is Visible    ${Wait_Success}
    Scroll    ${Scroll_From}    ${Scroll_To}
    Tap   ${Back_home}
    Transaction Details     ${Type}
Transfer.Validate Transfer Functionality if No receiver
    Wait Until Element Is Visible    ${Transfer_wait}   30s
    Tap    ${TransferButton}
    Wait Until Element Is Visible    ${Wait_Transfer}
    Input Text    ${Tap_Transfer}    ${Transfer_Amount}
    Input Text    ${Note}    Blank transfer Number
    Tap    ${Next}
    Element Should Be Disabled    ${Next}
    Tap  ${VAlTranbackcheck}
    Wait Until Element Is Visible    ${Transfer_wait}   30s
