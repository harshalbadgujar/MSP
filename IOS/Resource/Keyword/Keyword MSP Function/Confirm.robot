*** Settings ***
Library    AppiumLibrary
Library    String
Library	   OperatingSystem
Resource    ../Global Keyword.robot
Resource    ../Connect to DB/db.robot
Resource    ../../Locator/Confirm.resource
Resource    ../../Locator/Insufficient Balance.resource

*** Keywords ***
Process Confirm not have fee
    [Arguments]    ${Mobile}
    Wait Until Element Is Visible    ${LocateAmountConfirm}
    ${AmountBefore}    Get wallet amount    ${Mobile}
    ${AmountBefore}    Convert To Number    ${AmountBefore}
    Capture Page Screenshot    CONFIRMATION.png
    ${AmountConfirm}    Get Text    ${LocateAmountConfirm}
    ${AmountConfirm}    Remove String    ${AmountConfirm}    ,    
    ${AmountConfirm}    Convert To Number    ${AmountConfirm}   
    #${eLoadAmount}    Remove String    ${AmountConfirm}    ,    
    #${eLoadAmount}    Convert To Number    ${eLoadAmount}
    ${Fee}    Get Text    ${LocateFeeConfirm}
    ${Fee}    Remove String    ${Fee}    MMK
    ${Fee}    Remove String    ${Fee}    ,
    ${Fee}    Convert To Number    ${Fee}
    Scroll    id=receiver_name_label    ${LocateAmountConfirm}
    ${statusConfirmRebate}    Run Keyword And Return Status    Wait Until Element Is Visible    ${LocateREBATEConfirm}
    ${REBATE}    Run Keyword If    "${statusConfirmRebate}"=="True"    CheckREBATE    ELSE    Set Variable    0
    #${REBATE}=    Run Keyword If    "${statusConfirmRebate}"=="False"    Set Variable    0
    Log    ${REBATE}
    #${REBATE}    Remove String    ${REBATE}    MMK
    #${REBATE}    Remove String    ${REBATE}    ,
    #${REBATE}    Remove String    ${REBATE}    +
    ${REBATE}    Convert To Number    ${REBATE}
    ${eLoadTotalAmount}    Run Keyword If    "${statusConfirmRebate}"=="True"    Set Variable    ${AmountConfirm}    ELSE    Set Variable    ${AmountConfirm}
    #${eLoadTotalAmount}    Run Keyword If    "${statusConfirmRebate}"=="False"   Set Variable    ${AmountConfirm}
    Log    ${eLoadTotalAmount}
    #Should Be Equal    ${AmountConfirm}    ${eLoadTotalAmount}
    Tap    ${LocateConfirmButton}
    ENTER PASSCODE
    Allow Permission
    Wait Until Element Is Visible    ${LocateSuccess}    10s
    Capture Page Screenshot    Success.png
    ${AmountSuccess}    Get Text    ${LocateAmountSuccess}
    ${AmountSuccess}    Remove String    ${AmountSuccess}    ,    
    ${AmountSuccess}    Convert To Number    ${AmountSuccess}
    Should Be Equal    ${AmountConfirm}    ${AmountSuccess}
    Scroll    ${LocateSucccessBiller}    ${LocateSuccess}
    Tap    ${SHARE}
    Sleep    1s
    Capture Page Screenshot    SHARE.png
    Tap    ${CloseSHARE}
    Sleep    1s
    Tap    ${BackToHome}
    Sleep    2s
    Capture Page Screenshot    Redeem Success.png
    Sleep    2s
    ${AmountAfter}    Get wallet amount    ${Mobile}
    ${AmountAfter}    Convert To Number    ${AmountAfter}
    ${AmountTotal}    Evaluate    ${AmountBefore}-${eLoadTotalAmount}+${REBATE}
    Should Be Equal    ${AmountTotal}    ${AmountAfter}
    Capture Page Screenshot    Home page.png
    
Process Confirm not Equal
    [Arguments]    ${Mobile}
    Wait Until Element Is Visible    ${LocateAmountConfirm}    10s
    ${AmountBefore}    Get wallet amount    ${Mobile}
    ${AmountBefore}    Convert To Number    ${AmountBefore}
    Capture Page Screenshot    CONFIRMATION.png
    ${AmountConfirm}    Get Text    ${LocateAmountConfirm}
    ${AmountConfirm}    Remove String    ${AmountConfirm}    ,    
    ${AmountConfirm}    Convert To Number    ${AmountConfirm}   
    #${eLoadAmount}    Remove String    ${AmountConfirm}    ,    
    #${eLoadAmount}    Convert To Number    ${eLoadAmount}
    ${Fee}    Get Text    ${LocateFeeConfirm}
    ${Fee}    Remove String    ${Fee}    MMK
    ${Fee}    Remove String    ${Fee}    ,
    ${Fee}    Convert To Number    ${Fee}
    Scroll    id=receiver_name_label    ${LocateAmountConfirm}
    ${statusConfirmRebate}    Run Keyword And Return Status    Wait Until Element Is Visible    ${LocateREBATEConfirm}
    ${REBATE}    Run Keyword If    "${statusConfirmRebate}"=="True"    Get Text    ${LocateREBATEConfirm}
    Log    ${REBATE}
    ${REBATE}    Remove String    ${REBATE}    MMK
    ${REBATE}    Remove String    ${REBATE}    ,
    ${REBATE}    Remove String    ${REBATE}    +
    ${REBATE}    Convert To Number    ${REBATE}
    ${eLoadTotalAmount}    Evaluate    ${AmountConfirm}+${Fee}
    Log    ${eLoadTotalAmount}
    Should Be Equal    ${AmountConfirm}    ${eLoadTotalAmount}
    Tap    ${LocateConfirmButton}
    Enter Passcode Gifts
    Allow Permission
    Wait Until Element Is Visible    ${LocateSuccess}    10s
    Capture Page Screenshot    Success.png
    ${AmountSuccess}    Get Text    ${LocateAmountSuccess}
    ${AmountSuccess}    Remove String    ${AmountSuccess}    ,    
    ${AmountSuccess}    Convert To Number    ${AmountSuccess}
    Should Be Equal    ${AmountConfirm}    ${AmountSuccess}
    Scroll    ${LocateSucccessBiller}    ${LocateSuccess}
    Tap    ${SHARE}
    Sleep    1s
    Capture Page Screenshot    SHARE.png
    Tap    ${CloseSHARE}
    Sleep    1s
    Tap    ${BackToHome}
    Wait Until Page Contains    Redeem Success    10s
    Capture Page Screenshot    Redeem Success.png
    Sleep    2s
    ${AmountAfter}    Get wallet amount    ${Mobile}
    ${AmountAfter}    Convert To Number    ${AmountAfter}
    ${AmountTotal}    Evaluate    ${AmountBefore}-${eLoadTotalAmount}+${REBATE}
    #Should Be Equal    ${AmountTotal}    ${AmountAfter}
    Capture Page Screenshot    Home page.png
    
Process Confirm not Equal (Movie)
    [Arguments]    ${Mobile}
    Wait Until Element Is Visible    ${LocateAmountConfirm}    10s
    ${AmountBefore}    Get wallet amount    ${Mobile}
    ${AmountBefore}    Convert To Number    ${AmountBefore}
    Capture Page Screenshot    CONFIRMATION.png
    ${AmountConfirm}    Get Text    ${LocateAmountConfirm}
    ${AmountConfirm}    Remove String    ${AmountConfirm}    ,    
    ${AmountConfirm}    Convert To Number    ${AmountConfirm}   
    #${eLoadAmount}    Remove String    ${AmountConfirm}    ,    
    #${eLoadAmount}    Convert To Number    ${eLoadAmount}
    ${Fee}    Get Text    ${LocateFeeConfirm}
    ${Fee}    Remove String    ${Fee}    MMK
    ${Fee}    Remove String    ${Fee}    ,
    ${Fee}    Convert To Number    ${Fee}
    Scroll    id=receiver_name_label    ${LocateAmountConfirm}
    ${statusConfirmRebate}    Run Keyword And Return Status    Wait Until Element Is Visible    ${LocateREBATEConfirm}
    ${REBATE}    Run Keyword If    "${statusConfirmRebate}"=="True"    Get Text    ${LocateREBATEConfirm}
    Log    ${REBATE}
    ${REBATE}    Remove String    ${REBATE}    MMK
    ${REBATE}    Remove String    ${REBATE}    ,
    ${REBATE}    Remove String    ${REBATE}    +
    ${REBATE}    Convert To Number    ${REBATE}
    ${eLoadTotalAmount}    Evaluate    ${AmountConfirm}+${Fee}
    Log    ${eLoadTotalAmount}
    Should Be Equal    ${AmountConfirm}    ${eLoadTotalAmount}
    Tap    ${LocateConfirmButton}
    Enter Passcode Gifts
    Allow Permission
    Wait Until Element Is Visible    ${LocateSuccess}    10s
    Capture Page Screenshot    Success.png
    ${AmountSuccess}    Get Text    ${LocateAmountSuccess}
    ${AmountSuccess}    Remove String    ${AmountSuccess}    ,    
    ${AmountSuccess}    Convert To Number    ${AmountSuccess}
    Should Be Equal    ${AmountConfirm}    ${AmountSuccess}
    Scroll    ${LocateSucccessBiller}    ${LocateSuccess}
    Tap    id=share_button
    Sleep    1s
    Capture Page Screenshot    SHARE.png
    Tap    ${CloseSHARE}
    Sleep    1s
    Tap    ${BackToHome}
    Wait Until Page Contains    Redeem Success    10s
    Capture Page Screenshot    Redeem Success.png
    Sleep    2s
    ${AmountAfter}    Get wallet amount    ${Mobile}
    ${AmountAfter}    Convert To Number    ${AmountAfter}
    ${AmountTotal}    Evaluate    ${AmountBefore}-${eLoadTotalAmount}+${REBATE}
    #Should Be Equal    ${AmountTotal}    ${AmountAfter}
    Capture Page Screenshot    Home page.png
    
Process Confirm Insufficient Balance
    [Arguments]    ${Mobile}
    Wait Until Element Is Visible    ${LocateAmountConfirm}    10s
    Tap    ${LocateConfirmButton}
    ${MessageInsufficientBalance}    Get Text    ${LocateInsufficientBalance}
    Should Be Equal    ${WordingInsufficientBalance}    ${MessageInsufficientBalance}
    Tap    ${OKbutton}
    Sleep    1s
    Tap    ${CloseConfirm}
    Sleep    1s
    Tap    ${CloseButton}
    Sleep    1s
    
    

