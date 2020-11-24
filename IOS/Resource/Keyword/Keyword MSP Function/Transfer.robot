*** Settings ***
Library    AppiumLibrary
Library    String
Library	   OperatingSystem
Resource    ../Global Keyword.robot
Resource    ../Connect to DB/db.robot
Resource    ../../Locator/TransferMenu.resource
Resource    ../../Locator/Insufficient Balance.resource
Resource    ../../Locator/HomePage.resource


*** Keywords ***
To validate transfer by sending money from one user to other
    [Arguments]    ${SenderMobile}    ${MobileReceiver}    ${Amount}
    ${amountAbefore}    Get wallet amount    ${SenderMobile}
    log    ${amountAbefore}
    ${amountBbefore}    Get wallet amount    ${MobileReceiver}
    log    ${amountBbefore}
    Wait Until Element Is Visible    ${Welcome}    10s
    Capture Page Screenshot    Home Page.png
    Wait Until Element Is Visible    //XCUIElementTypeButton[@name="burger_button"]    30s
    Tap   //XCUIElementTypeButton[@name="burger_button"]
    Wait Until Element is visible  //XCUIElementTypeStaticText[@name="TRANSFER"]  5s
    Tap     //XCUIElementTypeStaticText[@name="TRANSFER"]
    #Tap    ${LocateMenuTransfer}
    Wait Until Element Is Visible    ${TransferMainMenu}    10s
    Capture Page Screenshot    Transfer.png
    Tap    ${EditMobileTransfer}
    Input Text    ${EditMobileTransfer}    ${MobileReceiver}
    Tap    //XCUIElementTypeButton[@name="Done"]
    Input Text    ${EditAmountTransfer}    ${Amount}
    Tap    //XCUIElementTypeButton[@name="Done"]
    Input Text    ${EditNoteTransfer}    Robot Test
    Tap    //XCUIElementTypeButton[@name="Done"]
    Scroll    ${btnTransferNext}    ${TransferMainMenu}
    Tap    ${btnTransferNext}
    Wait Until Element Is Visible    ${HeaderTransferConfirm}    10s
    Capture Page Screenshot    CONFIRMATION.png
    ${CustomerReceiverName}    Get Text    ${LocateReceiverName}
    ${GetCustomerFirstname}    Get First Name Customer    ${MobileReceiver}
    Should Be Equal    ${CustomerReceiverName}    ${GetCustomerFirstname}
    ${CustomerReceiverNumber}    Get Text    ${LocateReceiverNumber}
    Should Be Equal    ${CustomerReceiverNumber}    ${MobileReceiver}
    Scroll    ${LocateReceiverName}    ${HeaderTransferConfirm}
    Tap   ${btnTransferConfrimNext}
    ENTER PASSCODE
    Allow Permission
    Wait Until Element Is Visible    ${TransferSuccess}    20s
    Capture Page Screenshot    TransferSUCCESS.png
    ${SenderTransferName}    Get Text    ${LocateSenderTransferName}
    ${GetCustomerSenderFirstname}    Get First Name Customer    ${SenderMobile}
    Should Be Equal    ${SenderTransferName}    ${GetCustomerSenderFirstname}
    ${SenderTransferNumber}    Get Text    ${LocateSenderTransferNumber}
    Should Be Equal    ${SenderMobile}    ${SenderTransferNumber}
    ${RecieveTransferName}    Get Text    ${LocateRecieveTransferName}
    ${GetCustomerRecieveFirstname}    Get First Name Customer    ${MobileReceiver}
    Should Be Equal    ${RecieveTransferName}    ${GetCustomerRecieveFirstname}
    ${RecieveTransferNumber}    Get Text    ${LocateRecieveTransferNumber}
    Should Be Equal    ${MobileReceiver}    ${RecieveTransferNumber}
    ${Amount}    Convert To Number    ${Amount}
    ${SUCCESSTransferAmount}    Get Text    ${LocateSUCCESSTransferAmount}
    ${SUCCESSTransferAmount}    Remove String    ${SUCCESSTransferAmount}    ,
    ${SUCCESSTransferAmount}    Convert To Number    ${SUCCESSTransferAmount}
    ${Fee}    Get Text    ${TransferFee}
    ${Fee}    Remove String    ${Fee}    MMK
    ${Fee}    Remove String    ${Fee}    ,
    ${Fee}    Convert To Number    ${Fee}
    ${TransferTotalAmount}    Evaluate    ${SUCCESSTransferAmount}+${Fee}
    Scroll    ${LocateRecieveTransferNumber}    ${LocateSUCCESSTransferAmount}
    Tap   ${Transfer Back TO HOME}
#    Wait Until Element Is Visible    ${LocateMenuTransfer}    10
    Capture Page Screenshot    btnBackToHome.png
    ${amountAafter}    Get wallet amount    ${SenderMobile}
    log    ${amountAafter}
    Verify amount    ${SenderMobile}    ${amountAbefore}    ${MobileReceiver}    ${amountBbefore}    ${TransferTotalAmount}
    
To validate transfer with insufficient balance user
    [Arguments]    ${SenderMobile}    ${MobileReceiver}    ${Amount}
    Wait Until Element Is Visible    ${Welcome}    10s
    Capture Page Screenshot    Home Page.png
    Wait Until Element Is Visible    //XCUIElementTypeButton[@name="burger_button"]    30s
    Tap   //XCUIElementTypeButton[@name="burger_button"]
    Wait Until Element is visible  //XCUIElementTypeStaticText[@name="TRANSFER"]  5s
    Tap     //XCUIElementTypeStaticText[@name="TRANSFER"]
#    Tap    ${LocateMenuTransfer}
    Wait Until Element Is Visible    ${TransferMainMenu}    10s
    Capture Page Screenshot    Transfer.png
    Tap    ${EditMobileTransfer}
    Input Text    ${EditMobileTransfer}    ${MobileReceiver}
    Tap    //XCUIElementTypeButton[@name="Done"]
    Input Text    ${EditAmountTransfer}    ${Amount}
    Tap    //XCUIElementTypeButton[@name="Done"]
    Input Text    ${EditNoteTransfer}    Robot Test
    Tap    //XCUIElementTypeButton[@name="Done"]
    Scroll    ${btnTransferNext}    ${TransferMainMenu}
    Tap    ${btnTransferNext}
    Wait Until Element Is Visible    ${LocateInsufficientBalance}
    ${MessageInsufficientBalance}    Get Text    ${LocateInsufficientBalance}
    Should Be Equal    ${WordingInsufficientBalance}    ${MessageInsufficientBalance}
    Tap    ${OKbutton}
    Sleep    1s

To check transfer without entering receiver
    Wait Until Element Is Visible   ${Hamburgerbtn}     30s
    # click on hamburger menu
    Tap   ${Hamburgerbtn}
    Wait Until Element is visible  ${Hamtransfer}  5s
    #click on transfer menu
    Tap     ${Hamtransfer}
    wait until element is visible    ${EditAmountTransfer}    5s
    #input amount in the amount field
    Input Text    ${EditAmountTransfer}      100
    #click on the done button on keypad
    Tap    //XCUIElementTypeButton[@name="Done"]
    #enter the text in the note field
    Input Text    ${EditNoteTransfer}    Robot Test
    #click on the done button on keypad
    Tap    //XCUIElementTypeButton[@name="Done"]
    #scroll the page
    Scroll    ${btnTransferNext}    ${TransferMainMenu}
    #check if NEXT button is disabled
    ${check}    run keyword and return status  element should be disabled   ${btnTransferNext}    5s
    run keyword if  ${check}   log to console    Next button is disabled
    run keyword if  ${check}    log    Next button is disabled
    #check if merchant then scroll
    ${checkifmer}    run keyword and return status   wait until page does not contain element     ${transcrossbtn}  5s
    run keyword if  ${checkifmer}    scroll   ${merscrollup}      ${merscrolldown}
    #check if customer then tap cross btn
    ${checkifcus}    run keyword and return status  wait until element is visible   ${transcrossbtn}   5s
    run keyword if  ${checkifcus}    tap   ${transcrossbtn}


To check transfer by selecting number from phonebook
    Wait Until Element Is Visible   ${Hamburgerbtn}     30s
    # click on hamburger menu
    Tap   ${Hamburgerbtn}
    Wait Until Element is visible  ${Hamtransfer}  5s
    #click on transfer menu
    Tap     ${Hamtransfer}
    wait until element is visible    ${Phonebook}    5s
    Tap   ${Phonebook}
    ${popup}   run keyword and return status  wait until element is visible  ${accesspopup}   5s
    run keyword if  ${popup}     tap    ${popupok}
    wait until element is visible  ${nofrombook}    5s
    Tap    ${nofrombook}
    Wait Until Element Is Visible    ${EditAmountTransfer}    10s
    #input amount in the amount field
    Input Text    ${EditAmountTransfer}      100
    #click on the done button on keypad
    Tap    ${keyboarddone}
    #enter the text in the note field
    Input Text    ${EditNoteTransfer}    Robot Test
    #click on the done button on keypad
    Tap    ${keyboarddone}
    #scroll the page
    Scroll    ${btnTransferNext}    ${TransferMainMenu}
    #click on NEXT button
    Tap    ${btnTransferNext}
    Wait Until Element Is Visible    ${HeaderTransferConfirm}    10s
    #scroll on confirmation page
    Scroll    ${LocateReceiverName}    ${HeaderTransferConfirm}
    #click on confirm button
    Tap   ${btnTransferConfrimNext}
    #navigate to enterpasscode method in globalkeyword.robot
    ENTER PASSCODE
    #navigate to handle popup method in globalkeyword.robot
    Allow Permission
    Wait Until Element Is Visible    ${LocateRecieveTransferNumber}    20s
    #scroll on success page
    Scroll    ${LocateRecieveTransferNumber}    ${LocateSUCCESSTransferAmount}
    #click on back to home button on success page
    Tap   ${Transfer Back TO HOME}






