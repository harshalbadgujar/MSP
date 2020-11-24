*** Settings ***
Library    AppiumLibrary
Library    String
Library	   OperatingSystem
Resource    ../Global Keyword.robot
Resource    ../Connect to DB/db.robot
Resource    ../../Locator/eLoadMenu.resource
Resource    ../../Locator/Insufficient Balance.resource

*** Keywords ***
To validate Eload Functionality by the Reedem rewards on eload transaction
    [Arguments]    ${eLoadSelectMenu}    ${eLoadMobile}    ${eLoadAmount}    ${Mobile}
    ${AmountBefore}    Get wallet amount    ${Mobile}
    ${AmountBefore}    Convert To Number    ${AmountBefore}
    #Wait Until Element Is Visible    ${eLoadMainMenu}    10s
    Capture Page Screenshot    Home page.png
    Wait Until Element Is Visible    //XCUIElementTypeButton[@name="burger_button"]    30s
    Tap   //XCUIElementTypeButton[@name="burger_button"]
    Wait Until Element is visible  //XCUIElementTypeButton[@name="eload_button"]  5s
    Tap     //XCUIElementTypeButton[@name="eload_button"]
    #Tap    ${eLoadMainMenu}
    Wait Until Element Is Visible    ${eLoadHeader}   10s
    Capture Page Screenshot    eLoad.png
    Clear text    ${eLoadEditMobile}
    Input Text    ${eLoadEditMobile}    ${eLoadMobile}
    Tap    //XCUIElementTypeButton[@name="Done"]
    #${eLoadChannel}    Get Text    ${LocateChanneleLoad}
    #Should Be Equal    ${eLoadSelectMenu}    ${eLoadChannel}
    #Sleep    3s  
    Sleep    1s
    Wait Until Element Is Visible    ${eLoad${eLoadAmount}MMK}    10s
    Tap    ${eLoad${eLoadAmount}MMK}
    Wait Until Element Is Visible    ${HeadereLoadConfirm}    10s
    Capture Page Screenshot    CONFIRMATION.png
    ${ChanneleLoadConfirm}    Get Text    ${LocateMenuConfirm}
    Should Be Equal    eLoad    ${ChanneleLoadConfirm}
    ${AmountConfirm}    Get Text    ${LocaeConfirmeLoadAmount}
    ${AmountConfirm}    Remove String    ${AmountConfirm}    ,    
    ${AmountConfirm}    Convert To Number    ${AmountConfirm}   
    ${eLoadAmount}    Remove String    ${eLoadAmount}    ,    
    ${eLoadAmount}    Convert To Number    ${eLoadAmount}
    ${Fee}    Get Text    ${eLoadFee}
    ${Fee}    Remove String    ${Fee}    MMK
    ${Fee}    Remove String    ${Fee}    ,
    ${Fee}    Convert To Number    ${Fee}
    #${eLoadTotalAmount}    Evaluate    ${eLoadAmount}+${Fee}
    ${ConfirmeLoadTopupMenu}    Get Text    ${LocateChanneleLoadConfirm}
    Should Be Equal    ${eLoadSelectMenu}    ${ConfirmeLoadTopupMenu}
    ${statusConfirmRebate}    Run Keyword And Return Status    Wait Until Element Is Visible    ${eLoadConfirmRebate}
    ${REBATE}    Run Keyword If    "${statusConfirmRebate}"=="True"    Get Text    ${eLoadConfirmRebate}
    Log    ${REBATE}
    ${REBATE}    Remove String    ${REBATE}    MMK
    ${REBATE}    Remove String    ${REBATE}    ,
    ${REBATE}    Remove String    ${REBATE}    +
    ${REBATE}    Convert To Number    ${REBATE}
    ${eLoadTotalAmount}    Evaluate    ${eLoadAmount}+${Fee}
    Log    ${eLoadTotalAmount}
    Should Be Equal    ${AmountConfirm}    ${eLoadTotalAmount}
    Tap    ${eLoadConfirmbutton}
    ENTER PASSCODE
    Allow Permission
    wait until element is visible  ${ButtonREDEEM}  8s
    Tap    ${ButtonREDEEM}
    ${check2}   run keyword and return status    Wait Until Page Contains    Redeem Success    20s
    run keyword if    ${check2}     Capture Page Screenshot    Redeem Success.png
    Capture Page Screenshot    Redeem Success.png
    ${check3}   run keyword and return status    Wait Until Page Contains    Redeem Success    20s
    run keyword if    ${check3}     Tap    ${CloseREDEEMPopup}
    ${AmountRedeem}    Get Text    ${REDEEMRebate}
    ${AmountRedeem}    Remove String    ${AmountRedeem}    MMK
    ${AmountRedeem}    Remove String    ${AmountRedeem}    ,
    ${AmountRedeem}    Convert To Number    ${AmountRedeem}
    ${REBATE}    Convert To Number    ${REBATE}
    Should Be Equal    ${AmountRedeem}    ${REBATE}

    Wait Until Element Is Visible    ${eLoadSuccess}    10s
    Capture Page Screenshot    eLoadSuccess.png
    ${AmountSuccess}    Get Text    ${LocateeLoadAmountSuccess}
    ${AmountSuccess}    Remove String    ${AmountSuccess}    ,
    ${AmountSuccess}    Convert To Number    ${AmountSuccess}
    Should Be Equal    ${AmountConfirm}    ${AmountSuccess}
    ${SuccesseLoadSelectMenu}    Get Text    ${LocateSuccesseLoadSelectMenu}
    Should Be Equal    ${SuccesseLoadSelectMenu}    ${eLoadSelectMenu}
    Scroll    ${LocateSuccesseLoadSelectMenu}    ${eLoadSuccess}
    Tap    ${SHARE}
    Sleep    1s
    Capture Page Screenshot    SHARE.png
    Tap    ${CloseSHARE}
    Sleep    2s
    Tap  ${eLoadBackToHome}
    ${AmountAfter}    Get wallet amount    ${Mobile}
    ${AmountAfter}    Convert To Number    ${AmountAfter}
    ${AmountTotal}    Evaluate    ${AmountBefore}-${eLoadTotalAmount}+${REBATE}
    Should Be Equal    ${AmountTotal}    ${AmountAfter}
    Wait Until Element Is Visible    ${Welcome}      10s
    Capture Page Screenshot    Home page.png
    
To validate Eload Functionality by the Transfering rewards on eload transaction
   [Arguments]    ${eLoadSelectMenu}    ${eLoadMobile}    ${eLoadAmount}    ${Mobile}
    ${AmountBefore}    Get wallet amount    ${Mobile}
    ${AmountBefore}    Convert To Number    ${AmountBefore}
#    Wait Until Element Is Visible    ${eLoadMainMenu}    10s
    Capture Page Screenshot    Home page.png
#    Tap    ${eLoadMainMenu}
    Wait Until Element Is Visible    //XCUIElementTypeButton[@name="burger_button"]    30s
    Tap   //XCUIElementTypeButton[@name="burger_button"]
    Wait Until Element is visible  //XCUIElementTypeButton[@name="eload_button"]  5s
    Tap     //XCUIElementTypeButton[@name="eload_button"]
    Wait Until Element Is Visible    ${eLoadHeader}   10s
    Capture Page Screenshot    eLoad.png
    Clear text    ${eLoadEditMobile}
    Input Text    ${eLoadEditMobile}    ${eLoadMobile}
    Tap    //XCUIElementTypeButton[@name="Done"]
    #${eLoadChannel}    Get Text    ${LocateChanneleLoad}
    #Should Be Equal    ${eLoadSelectMenu}    ${eLoadChannel}
    #Sleep    3s  
    Wait Until Element Is Visible    ${eLoad${eLoadAmount}MMK}
    Tap    ${eLoad${eLoadAmount}MMK}
    Wait Until Element Is Visible    ${HeadereLoadConfirm}    10
    Capture Page Screenshot    CONFIRMATION.png
    ${ChanneleLoadConfirm}    Get Text    ${LocateMenuConfirm}
    Should Be Equal    eLoad    ${ChanneleLoadConfirm}
    ${AmountConfirm}    Get Text    ${LocaeConfirmeLoadAmount}
    ${AmountConfirm}    Remove String    ${AmountConfirm}    ,    
    ${AmountConfirm}    Convert To Number    ${AmountConfirm}   
    ${eLoadAmount}    Remove String    ${eLoadAmount}    ,    
    ${eLoadAmount}    Convert To Number    ${eLoadAmount}
    ${Fee}    Get Text    ${eLoadFee}
    ${Fee}    Remove String    ${Fee}    MMK
    ${Fee}    Remove String    ${Fee}    ,
    ${Fee}    Convert To Number    ${Fee}
    #${eLoadTotalAmount}    Evaluate    ${eLoadAmount}+${Fee}
    ${ConfirmeLoadTopupMenu}    Get Text    ${LocateChanneleLoadConfirm}
    Should Be Equal    ${eLoadSelectMenu}    ${ConfirmeLoadTopupMenu}
    ${statusConfirmRebate}    Run Keyword And Return Status    Wait Until Element Is Visible    ${eLoadConfirmRebate}
    ${REBATE}    Run Keyword If    "${statusConfirmRebate}"=="True"    Get Text    ${eLoadConfirmRebate}
    Log    ${REBATE}
    ${REBATE}    Remove String    ${REBATE}    MMK
    ${REBATE}    Remove String    ${REBATE}    ,
    ${REBATE}    Remove String    ${REBATE}    +
    ${REBATE}    Convert To Number    ${REBATE}
    ${eLoadTotalAmount}    Evaluate    ${eLoadAmount}+${Fee}
    Log    ${eLoadTotalAmount}
    Should Be Equal    ${AmountConfirm}    ${eLoadTotalAmount}
    Tap    ${eLoadConfirmbutton}
    ENTER PASSCODE
    Allow Permission
    Wait Until Element Is Visible  ${ButtonTRANSFER_TO_MCDC}  10s
    Tap    ${ButtonTRANSFER_TO_MCDC}
    Wait Until Page Contains    TRANSFEROR LIST    10s
    Sleep    3s
    Tap    ${OKButtonTRANSFEROR_LIST}
    #${AmountRedeem}    Get Text    ${REDEEMRebate}
    #${AmountRedeem}    Remove String    ${AmountRedeem}    MMK
    #${AmountRedeem}    Convert To Number    ${AmountRedeem}
    #${REBATE}    Convert To Number    ${REBATE}
    #Should Be Equal    ${AmountRedeem}    ${REBATE}
    Wait Until Element Is Visible    ${eLoadSuccess}    10s
    Capture Page Screenshot    eLoadSuccess.png
    ${AmountSuccess}    Get Text    ${LocateeLoadAmountSuccess}
    ${AmountSuccess}    Remove String    ${AmountSuccess}    ,    
    ${AmountSuccess}    Convert To Number    ${AmountSuccess}
    Should Be Equal    ${AmountConfirm}    ${AmountSuccess}
    ${SuccesseLoadSelectMenu}    Get Text    ${LocateSuccesseLoadSelectMenu}
    Should Be Equal    ${SuccesseLoadSelectMenu}    ${eLoadSelectMenu}
    Scroll    ${LocateSuccesseLoadSelectMenu}    ${eLoadSuccess}
    Tap    ${SHARE}
    Sleep    1s
    Capture Page Screenshot    SHARE.png
    Tap    ${CloseSHARE}
    SLEEP  3s
    Tap  ${eLoadBackToHome}
    ${AmountAfter}    Get wallet amount    ${Mobile}
    ${AmountAfter}    Convert To Number    ${AmountAfter}
    ${AmountTotal}    Evaluate    ${AmountBefore}-${eLoadTotalAmount}
    Should Be Equal    ${AmountTotal}    ${AmountAfter}
    Wait Until Element Is Visible    ${Welcome}     10s
    Capture Page Screenshot    Home page.png
    
To validate Eload Functionality by geting fees on eload transaction
   [Arguments]    ${eLoadSelectMenu}    ${eLoadMobile}    ${eLoadAmount}    ${Mobile}
    ${AmountBefore}    Get wallet amount    ${Mobile}
    ${AmountBefore}    Convert To Number    ${AmountBefore}
    #Wait Until Element Is Visible    ${eLoadMainMenu}    10s
    Capture Page Screenshot    Home page.png
    #Tap    ${eLoadMainMenu}
    Wait Until Element Is Visible    //XCUIElementTypeButton[@name="burger_button"]    30s
    Tap   //XCUIElementTypeButton[@name="burger_button"]
    Wait Until Element is visible  //XCUIElementTypeButton[@name="eload_button"]  5s
    Tap     //XCUIElementTypeButton[@name="eload_button"]
    Wait Until Element Is Visible    ${eLoadHeader}   10s
    Capture Page Screenshot    eLoad.png
    Clear text    ${eLoadEditMobile}
    Input Text    ${eLoadEditMobile}    ${eLoadMobile}
    Tap    //XCUIElementTypeButton[@name="Done"]
    #${eLoadChannel}    Get Text    ${LocateChanneleLoad}
    #Should Be Equal    ${eLoadSelectMenu}    ${eLoadChannel}
    #Sleep    3s  
    Sleep    1s
    Wait Until Element Is Visible    ${eLoad${eLoadAmount}MMK}    10s
    Tap    ${eLoad${eLoadAmount}MMK}
    Wait Until Element Is Visible    ${HeadereLoadConfirm}    10s
    Capture Page Screenshot    CONFIRMATION.png
    ${ChanneleLoadConfirm}    Get Text    ${LocateMenuConfirm}
    Should Be Equal    eLoad    ${ChanneleLoadConfirm}
    ${AmountConfirm}    Get Text    ${LocaeConfirmeLoadAmount}
    ${AmountConfirm}    Remove String    ${AmountConfirm}    ,    
    ${AmountConfirm}    Convert To Number    ${AmountConfirm}   
    ${eLoadAmount}    Remove String    ${eLoadAmount}    ,    
    ${eLoadAmount}    Convert To Number    ${eLoadAmount}
    ${Fee}    Get Text    ${eLoadFee}
    ${Fee}    Remove String    ${Fee}    MMK
    ${Fee}    Remove String    ${Fee}    ,
    ${Fee}    Convert To Number    ${Fee}
    #${eLoadTotalAmount}    Evaluate    ${eLoadAmount}+${Fee}
    ${ConfirmeLoadTopupMenu}    Get Text    ${LocateChanneleLoadConfirm}
    Should Be Equal    ${eLoadSelectMenu}    ${ConfirmeLoadTopupMenu}
    ${statusConfirmRebate}    Run Keyword And Return Status    Wait Until Element Is Visible    ${eLoadConfirmRebate}    10s
    ${REBATE}    Run Keyword If    "${statusConfirmRebate}"=="True"    Get Text    ${eLoadConfirmRebate}
    #Log    ${REBATE}
    #${REBATE}    Remove String    ${REBATE}    MMK
    #${REBATE}    Remove String    ${REBATE}    ,
    #${REBATE}    Remove String    ${REBATE}    +
    #${REBATE}    Convert To Number    ${REBATE}
    ${eLoadTotalAmount}    Evaluate    ${eLoadAmount}+${Fee}
    Log    ${eLoadTotalAmount}
    #Should Be Equal    ${AmountConfirm}    ${eLoadTotalAmount}
    Tap    ${eLoadConfirmbutton}
    ENTER PASSCODE
    Allow Permission
    Wait Until Element Is Visible    ${eLoadSuccess}    10s
    Capture Page Screenshot    eLoadSuccess.png
    ${AmountSuccess}    Get Text    ${LocateeLoadAmountSuccess}
    ${AmountSuccess}    Remove String    ${AmountSuccess}    ,    
    ${AmountSuccess}    Convert To Number    ${AmountSuccess}
    ${FeesSuccess}    Get Text    ${LocateeLoadFeesSuccess}
    ${FeesSuccess}    Remove String    ${FeesSuccess}    ,
    ${FeesSuccess}    Convert To Number    ${FeesSuccess}
    ${SuccessTotalAmount}    Evaluate    ${AmountSuccess}+${FeesSuccess}
    Should Be Equal    ${AmountConfirm}    ${SuccessTotalAmount}
    ${SuccesseLoadSelectMenu}    Get Text    ${LocateSuccesseLoadSelectMenu}
    Should Be Equal    ${SuccesseLoadSelectMenu}    ${eLoadSelectMenu}
    Scroll    ${LocateSuccesseLoadSelectMenu}    ${eLoadSuccess}
    Tap    ${SHARE}
    Sleep    1s
    Capture Page Screenshot    SHARE.png
    Tap    ${CloseSHARE}
    sleep  3s
    Tap    ${eLoadBackToHome}
    ${AmountAfter}    Get wallet amount    ${Mobile}
    ${AmountAfter}    Convert To Number    ${AmountAfter}
    ${AmountTotal}    Evaluate    ${AmountBefore}-${SuccessTotalAmount}
    Log    ${AmountTotal}
    Should Be Equal    ${AmountTotal}    ${AmountAfter}
    Wait Until Element Is Visible    ${Welcome}    10s
    Capture Page Screenshot    Home page.png
    
To validate Eload datapacket Functionality by the Reedem rewards on eload transaction
    [Arguments]    ${eLoadMobile}    ${Mobile}
    ${AmountBefore}    Get wallet amount    ${Mobile}
    ${AmountBefore}    Convert To Number    ${AmountBefore}
    #Wait Until Element Is Visible    ${eLoadMainMenu}    10s
    Capture Page Screenshot    Home page.png
    #Tap    ${eLoadMainMenu}
    Wait Until Element Is Visible    //XCUIElementTypeButton[@name="burger_button"]    30s
    Tap   //XCUIElementTypeButton[@name="burger_button"]
    Wait Until Element is visible  //XCUIElementTypeButton[@name="eload_button"]  5s
    Tap     //XCUIElementTypeButton[@name="eload_button"]
    Wait Until Element Is Visible    ${eLoadHeader}   10s
    Capture Page Screenshot    eLoad.png
    Clear text    ${eLoadEditMobile}
    Input Text    ${eLoadEditMobile}    ${eLoadMobile}
    Tap    //XCUIElementTypeButton[@name="Done"]
    #${eLoadChannel}    Get Text    ${LocateChanneleLoad}
    #Should Be Equal    ${eLoadSelectMenu}    ${eLoadChannel}
    #Sleep    3s
    Wait Until Element Is Visible    ${SelectPacketOoredoo}    10s
    Tap    ${SelectPacketOoredoo}
    Wait Until Element Is Visible    ${HeadereLoadConfirm}    10
    Capture Page Screenshot    CONFIRMATION.png
    ${ChanneleLoadConfirm}    Get Text    ${LocateMenuConfirm}
    Should Be Equal    eLoad    ${ChanneleLoadConfirm}
    ${AmountConfirm}    Get Text    ${LocaeConfirmeLoadAmount}
    ${AmountConfirm}    Remove String    ${AmountConfirm}    ,    
    ${AmountConfirm}    Convert To Number    ${AmountConfirm}   
    ${Fee}    Get Text    ${eLoadFee}
    ${Fee}    Remove String    ${Fee}    MMK
    ${Fee}    Remove String    ${Fee}    ,
    ${Fee}    Convert To Number    ${Fee}
    #${eLoadTotalAmount}    Evaluate    ${eLoadAmount}+${Fee}
    ${ConfirmeLoadTopupMenu}    Get Text    ${LocateChanneleLoadConfirm}
    ${statusConfirmRebate}    Run Keyword And Return Status    Wait Until Element Is Visible    ${eLoadConfirmRebate}
    ${REBATE}    Run Keyword If    "${statusConfirmRebate}"=="True"    Get Text    ${eLoadConfirmRebate}
    Log    ${REBATE}
    ${REBATE}    Remove String    ${REBATE}    MMK
    ${REBATE}    Remove String    ${REBATE}    ,
    ${REBATE}    Remove String    ${REBATE}    +
    ${REBATE}    Convert To Number    ${REBATE}
    Tap    ${eLoadConfirmbutton}
    ENTER PASSCODE
    Allow Permission
    wait until element is visible  ${ButtonREDEEM}  10s
    Tap    ${ButtonREDEEM}
    ${check4}   run keyword and return status    Wait Until Page Contains    Redeem Success    20s
    run keyword if    ${check4}     Capture Page Screenshot    Redeem Success.png
    Capture Page Screenshot    Redeem Success.png
    ${check2}   run keyword and return status    Wait Until Page Contains    Redeem Success    20s
    run keyword if    ${check2}     Tap    ${CloseREDEEMPopup}
    ${AmountRedeem}    Get Text    ${REDEEMRebate}
    ${AmountRedeem}    Remove String    ${AmountRedeem}    MMK
    ${AmountRedeem}    Convert To Number    ${AmountRedeem}
    ${REBATE}    Convert To Number    ${REBATE}
    Should Be Equal    ${AmountRedeem}    ${REBATE}

    Wait Until Element Is Visible    ${eLoadSuccess}    10s
    Capture Page Screenshot    eLoadSuccess.png
    ${AmountSuccess}    Get Text    ${LocateeLoadAmountSuccess}
    ${AmountSuccess}    Remove String    ${AmountSuccess}    ,    
    ${AmountSuccess}    Convert To Number    ${AmountSuccess}
    Should Be Equal    ${AmountConfirm}    ${AmountSuccess}
    ${SuccesseLoadSelectMenu}    Get Text    ${LocateSuccesseLoadSelectMenu}
    Scroll    ${LocateSuccesseLoadSelectMenu}    ${eLoadSuccess}
    Tap    ${SHARE}
    Sleep    1s
    Capture Page Screenshot    SHARE.png
    Tap    ${CloseSHARE}
    Sleep    2s
    Tap    ${eLoadBackToHome}
    ${AmountAfter}    Get wallet amount    ${Mobile}
    ${AmountAfter}    Convert To Number    ${AmountAfter}
    ${AmountTotal}    Evaluate    ${AmountBefore}-${AmountConfirm}+${REBATE}
    #Should Be Equal    ${AmountTotal}    ${AmountAfter}
    Wait Until Element Is Visible    ${Welcome}    10s
    Capture Page Screenshot    Home page.png
    
To validate Eload datapacket Functionality by the Transfering rewards on eload transaction
    [Arguments]    ${eLoadMobile}    ${Mobile}
    ${AmountBefore}    Get wallet amount    ${Mobile}
    ${AmountBefore}    Convert To Number    ${AmountBefore}
    #Wait Until Element Is Visible    ${eLoadMainMenu}    10s
    Capture Page Screenshot    Home page.png
    #Tap    ${eLoadMainMenu}
    Wait Until Element Is Visible    //XCUIElementTypeButton[@name="burger_button"]    30s
    Tap   //XCUIElementTypeButton[@name="burger_button"]
    Wait Until Element is visible  //XCUIElementTypeButton[@name="eload_button"]  5s
    Tap     //XCUIElementTypeButton[@name="eload_button"]
    Wait Until Element Is Visible    ${eLoadHeader}   10s
    Capture Page Screenshot    eLoad.png
    Clear text    ${eLoadEditMobile}
    Input Text    ${eLoadEditMobile}    ${eLoadMobile}
    Tap    //XCUIElementTypeButton[@name="Done"]
    #${eLoadChannel}    Get Text    ${LocateChanneleLoad}
    #Should Be Equal    ${eLoadSelectMenu}    ${eLoadChannel}
    #Sleep    3s  
    Wait Until Element Is Visible    ${SelectPacketOoredoo}    10s
    Tap    ${SelectPacketOoredoo}
    Wait Until Element Is Visible    ${HeadereLoadConfirm}    10
    Capture Page Screenshot    CONFIRMATION.png
    ${ChanneleLoadConfirm}    Get Text    ${LocateMenuConfirm}
    Should Be Equal    eLoad    ${ChanneleLoadConfirm}
    ${AmountConfirm}    Get Text    ${LocaeConfirmeLoadAmount}
    ${AmountConfirm}    Remove String    ${AmountConfirm}    ,    
    ${AmountConfirm}    Convert To Number    ${AmountConfirm}   
    ${Fee}    Get Text    ${eLoadFee}
    ${Fee}    Remove String    ${Fee}    MMK
    ${Fee}    Remove String    ${Fee}    ,
    ${Fee}    Convert To Number    ${Fee}
    #${eLoadTotalAmount}    Evaluate    ${eLoadAmount}+${Fee}
    ${ConfirmeLoadTopupMenu}    Get Text    ${LocateChanneleLoadConfirm}
    ${statusConfirmRebate}    Run Keyword And Return Status    Wait Until Element Is Visible    ${eLoadConfirmRebate}
    ${REBATE}    Run Keyword If    "${statusConfirmRebate}"=="True"    Get Text    ${eLoadConfirmRebate}
    #Log    ${REBATE}
    #${REBATE}    Remove String    ${REBATE}    MMK
    #${REBATE}    Remove String    ${REBATE}    ,
    #${REBATE}    Remove String    ${REBATE}    +
    #${REBATE}    Convert To Number    ${REBATE}
    Tap    ${eLoadConfirmbutton}
    ENTER PASSCODE
    Allow Permission
    wait until element is visible    ${ButtonTRANSFER_TO_MCDC}  10s
    Tap    ${ButtonTRANSFER_TO_MCDC}
    Wait Until Page Contains    TRANSFEROR LIST    10s
    Sleep    3s
    Tap    ${OKButtonTRANSFEROR_LIST}
    Wait Until Element Is Visible    ${eLoadSuccess}    10s
    Capture Page Screenshot    eLoadSuccess.png
    ${AmountSuccess}    Get Text    ${LocateeLoadAmountSuccess}
    ${AmountSuccess}    Remove String    ${AmountSuccess}    ,    
    ${AmountSuccess}    Convert To Number    ${AmountSuccess}
    Should Be Equal    ${AmountConfirm}    ${AmountSuccess}
    ${SuccesseLoadSelectMenu}    Get Text    ${LocateSuccesseLoadSelectMenu}
    Scroll    ${LocateSuccesseLoadSelectMenu}    ${eLoadSuccess}
    Tap    ${SHARE}
    Sleep    1s
    Capture Page Screenshot    SHARE.png
    Tap    ${CloseSHARE}
    Sleep    3s
    Tap    ${eLoadBackToHome}
    #${AmountRedeem}    Get Text    ${REDEEMRebate}
    #${AmountRedeem}    Remove String    ${AmountRedeem}    MMK
    #${AmountRedeem}    Convert To Number    ${AmountRedeem}    
    #${REBATE}    Convert To Number    ${REBATE}
    #Should Be Equal    ${AmountRedeem}    ${REBATE}
    ${AmountAfter}    Get wallet amount    ${Mobile}
    ${AmountAfter}    Convert To Number    ${AmountAfter}
    ${AmountTotal}    Evaluate    ${AmountBefore}-${AmountConfirm}
    Should Be Equal    ${AmountTotal}    ${AmountAfter}
    Wait Until Element Is Visible    ${Welcome}
    Capture Page Screenshot    Home page.png
    
To validate Eload datapacket Functionality by geting fees on eload transaction
   [Arguments]    ${eLoadMobile}    ${Mobile}
    ${AmountBefore}    Get wallet amount    ${Mobile}
    ${AmountBefore}    Convert To Number    ${AmountBefore}
    #Wait Until Element Is Visible    ${eLoadMainMenu}    10s
    Capture Page Screenshot    Home page.png
    #Tap    ${eLoadMainMenu}
    Wait Until Element Is Visible    //XCUIElementTypeButton[@name="burger_button"]    30s
    Tap   //XCUIElementTypeButton[@name="burger_button"]
    Wait Until Element is visible  //XCUIElementTypeButton[@name="eload_button"]  5s
    Tap     //XCUIElementTypeButton[@name="eload_button"]
    Wait Until Element Is Visible    ${eLoadHeader}   10s
    Capture Page Screenshot    eLoad.png
    Clear text    ${eLoadEditMobile}
    Input Text    ${eLoadEditMobile}    ${eLoadMobile}
    Tap    //XCUIElementTypeButton[@name="Done"]
    #${eLoadChannel}    Get Text    ${LocateChanneleLoad}
    #Should Be Equal    ${eLoadSelectMenu}    ${eLoadChannel}
    #Sleep    3s  
    Wait Until Element Is Visible    ${SelectPacketMytel}    10s
    Tap    ${SelectPacketMytel}
    Wait Until Element Is Visible    ${HeadereLoadConfirm}    10s
    Capture Page Screenshot    CONFIRMATION.png
    ${ChanneleLoadConfirm}    Get Text    ${LocateMenuConfirm}
    Should Be Equal    eLoad    ${ChanneleLoadConfirm}
    ${AmountConfirm}    Get Text    ${LocaeConfirmeLoadAmount}
    ${AmountConfirm}    Remove String    ${AmountConfirm}    ,    
    ${AmountConfirm}    Convert To Number    ${AmountConfirm}   
    #${eLoadAmount}    Remove String    ${eLoadAmount}    ,    
    #${eLoadAmount}    Convert To Number    ${eLoadAmount}
    ${Fee}    Get Text    ${eLoadFee}
    ${Fee}    Remove String    ${Fee}    MMK
    ${Fee}    Remove String    ${Fee}    ,
    ${Fee}    Convert To Number    ${Fee}
    #${eLoadTotalAmount}    Evaluate    ${eLoadAmount}+${Fee}
    ${ConfirmeLoadTopupMenu}    Get Text    ${LocateChanneleLoadConfirm}
    #Should Be Equal    ${eLoadSelectMenu}    ${ConfirmeLoadTopupMenu}
    #${eLoadTotalAmount}    Evaluate    ${eLoadAmount}+${Fee}
    #Log    ${eLoadTotalAmount}
    #Should Be Equal    ${AmountConfirm}    ${eLoadTotalAmount}
    Tap    ${eLoadConfirmbutton}
    ENTER PASSCODE
    Allow Permission
    Wait Until Element Is Visible    ${eLoadSuccess}    10s
    Capture Page Screenshot    eLoadSuccess.png
    ${AmountSuccess}    Get Text    ${LocateeLoadAmountSuccess}
    ${AmountSuccess}    Remove String    ${AmountSuccess}    ,    
    ${AmountSuccess}    Convert To Number    ${AmountSuccess}
    ${FeesSuccess}    Get Text    ${LocateeLoadFeesSuccess}
    ${FeesSuccess}    Remove String    ${FeesSuccess}    ,
    ${FeesSuccess}    Convert To Number    ${FeesSuccess}
    ${SuccessTotalAmount}    Evaluate    ${AmountSuccess}+${FeesSuccess}
    Should Be Equal    ${AmountConfirm}   ${SuccessTotalAmount}
    #${SuccesseLoadSelectMenu}    Get Text    ${LocateSuccesseLoadSelectMenu}
    #Should Be Equal    ${SuccesseLoadSelectMenu}    ${eLoadSelectMenu}
    Scroll    ${LocateSuccesseLoadSelectMenu}    ${eLoadSuccess}
    Tap    ${SHARE}
    Sleep    1s
    Capture Page Screenshot    SHARE.png
    Tap    ${CloseSHARE}
    Sleep   3s
    Tap    ${eLoadBackToHome}
    ${AmountAfter}    Get wallet amount    ${Mobile}
    ${AmountAfter}    Convert To Number    ${AmountAfter}
    ${AmountTotal}    Evaluate    ${AmountBefore}-${AmountConfirm}
    #Should Be Equal    ${AmountTotal}    ${AmountAfter}
    Wait Until Element Is Visible    ${Welcome}
    Capture Page Screenshot    Home page.png
    
To validate Eload functionality using insufficient balance user
    [Arguments]    ${Mobile}
    ${AmountBefore}    Get wallet amount    ${Mobile}
    ${AmountBefore}    Convert To Number    ${AmountBefore}
    #Wait Until Element Is Visible    ${eLoadMainMenu}    10s
    Capture Page Screenshot    Home page.png
    #Tap    ${eLoadMainMenu}
    Wait Until Element Is Visible    //XCUIElementTypeButton[@name="burger_button"]    30s
    Tap   //XCUIElementTypeButton[@name="burger_button"]
    Wait Until Element is visible  //XCUIElementTypeButton[@name="eload_button"]  5s
    Tap     //XCUIElementTypeButton[@name="eload_button"]
    Wait Until Element is visible   ${eLoadEditMobile}   5s
    Clear text    ${eLoadEditMobile}
    Input Text    ${eLoadEditMobile}    09691009765
    Tap    //XCUIElementTypeButton[@name="Done"]
    @{amount} =  create list    ${eLoad1,000MMK}    ${eLoad2,000MMK}    ${eLoad3,000MMK}    ${eLoad5,000MMK}    ${eLoad10,000MMK}    ${eLoad30,000MMK}
    :FOR  ${i}  IN    @{amount}
    \   Tap  ${i}
    \   ${Status}=  Run Keyword And Return Status    Wait Until Element Is Visible    ${OKbutton}   10s
    \   ${MessageInsufficientBalance}    Run Keyword If    "${Status}"=="True"     Get Text    ${LocateInsufficientBalance}
    \   Tap    ${OKbutton}
    \   Should Be Equal    ${WordingInsufficientBalance}    ${MessageInsufficientBalance}
    Sleep    1s
    Run Keyword If    "${Status}"=="True"     log to console     eLoad Insufficient Balance
    Tap    ${CloseButton}

To validate Eload functionality when number is selected from phonebook
    Wait Until Element Is Visible   ${Hamburgerbtn}    30s
    #click on hamburger menu
    Tap    ${Hamburgerbtn}
    Wait Until Element is visible  ${Hameload}   5s
    #click on eload option
    Tap     ${Hameload}
    wait until element is visible  ${Phonebook}   4s
    #click on phonebook
    Tap   ${Phonebook}
    #check for the permission popup
    ${popup}   run keyword and return status  wait until element is visible  ${accesspopup}   5s
    run keyword if  ${popup}     tap    ${popupok}
    wait until element is visible  ${EloadNofrombook}   5s
    #click on the number from the phonebook
    Tap   ${EloadNofrombook}
    Wait Until Element Is Visible    ${eLoad1,000MMK}    10s
    #select the amount
    Tap    ${eLoad1,000MMK}
    Wait Until Element Is Visible    ${HeadereLoadConfirm}    10s
    #click on the confirm button
    Tap    ${eLoadConfirmbutton}
    sleep   4s
    #enter passcode
    ENTER PASSCODE
    #permission popup handled in globalkeyword
    Allow Permission
    Wait Until Element Is Visible    ${eLoadSuccess}    10s
    #scroll the success page
    Scroll    ${LocateSuccesseLoadSelectMenu}    ${eLoadSuccess}
    wait until element is visible  ${eLoadBackToHome}   5s
    #click on back to home button on success page
    Tap    ${eLoadBackToHome}

Wrong biller
    Wait Until Element Is Visible   ${Hamburgerbtn}    30s
    #click on hamburger menu
    Tap    ${Hamburgerbtn}
    Wait Until Element is visible  ${Hameload}   5s
    #click on eload option
    Tap     ${Hameload}
    Wait Until Element Is Visible    ${eLoad1,000MMK}    10s
    #select the amount
    Tap    ${eLoad1,000MMK}
    wait until element is visible  ${failedpopup}      5s
    #get the error message
    ${geterrormsg}   get text    ${errortext}
    ${check}   run keyword and return status   should be equal   ${geterrormsg}      ${originalerror}
    run keyword if  ${check}   log to console   Wrong biller number
    #click on OK button error popup
    Tap     ${okbtn}
    wait until element is visible  ${crossbtn}   5s
    #click on cross button on eload page
    Tap   ${crossbtn}







