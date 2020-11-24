*** Settings ***
Library    AppiumLibrary
Library    String
Library	   OperatingSystem
Resource    ../Global Keyword.robot
Resource    ../Connect to DB/db.robot
Resource    ../../Locator/ePinMenu.resource

*** Keywords ***
ePin Redeem
    [Arguments]    ${ePinSelectMenu}    ${Amount}    ${Mobile}
    ${AmountBefore}    Get wallet amount    ${Mobile}
    ${AmountBefore}    Convert To Number    ${AmountBefore}
    Wait Until Element Is Visible    ${ePinMainMenu}    10s
    Capture Page Screenshot    Home page.png
    Tap    ${ePinMainMenu}
    Wait Until Element Is Visible    ${ePinHeader}
    Tap    ${ePinMenu${ePinSelectMenu}}
    Tap    ${ePin${Amount}MMK}
    Capture Page Screenshot    ePin.png
    Tap    ${ButtonContinue}
    Wait Until Element Is Visible    ${HeaderePinConfirm}    10s
    Capture Page Screenshot    CONFIRMATION.png
    ${menu}    Get Text    ${LocateMenuConfirm}
    Should Be Equal    ePin    ${menu}
    ${AmountConfirm}    Get Text    ${ePinAmount}
    ${AmountConfirm}    Remove String    ${AmountConfirm}    ,    
    ${AmountConfirm}    Convert To Number    ${AmountConfirm}   
    ${ePinAmount}    Remove String    ${Amount}    ,    
    ${ePinAmount}    Convert To Number    ${ePinAmount}
    Should Be Equal    ${AmountConfirm}    ${ePinAmount}
    ${ConfirmePinMenu}    Get Text    ${LocateChannelePinConfirm}
    Should Be Equal    ${ePinSelectMenu} ePin    ${ConfirmePinMenu}
    Tap    ${ePinConfirmbutton}
    ENTER PASSCODE
    Allow Permission
    Sleep    5s
    Wait Until Element Is Visible    ${ePinSuccess}    10s
    Capture Page Screenshot    ePinSuccess.png
    #${AmountSuccess}    Get Text    //XCUIElementTypeStaticText[@name="${Amount}"]
    #${AmountSuccess}    Remove String    ${AmountSuccess}    MMK
    #${AmountSuccess}    Remove String    ${AmountSuccess}    ,
    #${AmountSuccess}    Convert To Number    ${AmountSuccess}
    #Should Be Equal    ${AmountSuccess}    ${AmountConfirm}
    ${PIN}    Get Text    ${ePinPINSuccess}
    ${PIN}    Remove String    PIN:
    Log    ${PIN}
    ${ePinSuccessChannel}    Get Text    ${LocateePinSuccessChannel}
    Should Be Equal    ${ePinSelectMenu} ePin    ${ePinSuccessChannel}
    Scroll    ${LocateePinSuccessChannel}    ${ePinSuccess}
    Scroll    ${LocateREBATE}    ${LocateePinSuccessChannel}
    ${REBATE}    Get Text    ${LocateREBATE}
    ${AmountRedeem}    Convert To Number    ${REBATE}       
    Tap    ${BackToHome}
    Wait Until Element Is Visible   //XCUIElementTypeStaticText[@name="Redeem Success"]    10s
    Capture Page Screenshot    Redeem Success.png
    ${AmountAfter}    Get wallet amount    ${Mobile}
    ${AmountAfter}    Convert To Number    ${AmountAfter}
    ${AmountTotal}    Evaluate    ${AmountBefore}-${ePinAmount}+${AmountRedeem}
    Should Be Equal    ${AmountTotal}    ${AmountAfter}
    [Return]    ${PIN}    