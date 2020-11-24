*** Settings ***
Library    AppiumLibrary
Library    String
Library	   OperatingSystem
Resource    ../Global Keyword.robot
Resource    ../Connect to DB/db.robot
Resource    ../../Locator/ReloadMenu.resource

*** Keywords ***
To validate addmoney by selecting amount with 123 service
    [Arguments]    ${SelectAmount}    ${ReloadOption}
    Wait Until Element Is Visible    ${Welcome}    10s
    Capture Page Screenshot    Home Page.png
    #Tap    ${LocateMenuReload}    10s
    Wait Until Element Is Visible    //XCUIElementTypeButton[@name="burger_button"]    30s
    Tap   //XCUIElementTypeButton[@name="burger_button"]
    Wait Until Element is visible   ${Hamreload}    5s
    Tap     ${Hamreload}
    Wait Until Element Is Visible    ${ReloadMainMenu}    10s
    Capture Page Screenshot    Reload.png
    Tap    ${Reload${SelectAmount}MMK}
    #${Amount}    Get Text    //XCUIElementTypeStaticText[@name="${SelectAmount}"]
    #Wait Until Element Is Visible   //XCUIElementTypeStaticText[@name="MPU"]
    Wait Until Element Is Visible   ${AmountPageOption}
    ${Amount}    Get Text    ${CurrentBalance}
    Tap    ${123 ServiceOption}
    Wait Until Element Is Visible    ${HeaderReloadConfirm}
    ${ConfirmAmount}    Get Text    ${ReloadAmount}
    ${ConfirmAmount}    Remove String    ${ConfirmAmount}    ,
    ${ConfirmAmount}    Convert To Number    ${ConfirmAmount}    
    ${Amount}    Remove String    ${Amount}    ,
    ${Amount}    Convert To Number    ${Amount}
    Should Be Equal    ${ConfirmAmount}    ${Amount}
    sleep  5s
    ${Fee}    Get Text    ${ReloadFeeAmount}
    ${Fee}    Remove String    ${Fee}    MMK
    ${Fee}    Remove String    ${Fee}    ,
    ${Fee}    Convert To Number    ${Fee}
    ${TotalAmount}    Get Text    ${ReloadTotalAmount}
    ${RTotalAmount}    Remove String    ${TotalAmount}    ,
    ${TotalAmount}    Convert To Number    ${RTotalAmount}
    ${AmountFee}    Evaluate    ${Amount}+${Fee}
    Should Be Equal    ${TotalAmount}    ${AmountFee}
    ${CheckOption}    Get Text    ${ReloadOptionConfirm}
    Should Be Equal    ${ReloadOption}    ${CheckOption}
    scroll    id=option_title_label      ${ReloadAmount}
    wait until element is visible   ${ReloadConfirmButton}     30s
    Tap     //XCUIElementTypeButton[@name="confirm_button"]
    Wait Until Page Does Not Contain    ${ReloadLoading}
    Wait Until Element Is Visible    ${HeaderSamtPay}    20s
    ${Ref1}    Get text    ${ReloadRef1}
    ${AmountPay}    Get text    	//XCUIElementTypeStaticText[@name="50,300"]
    ${RAmountPay}    Remove String    ${AmountPay}    ,
    Log    ${RAmountPay}
   # ${AmountPay}    Convert To Number    ${AmountPay}
    Should Be Equal    ${RTotalAmount}    ${RAmountPay}
    Capture Page Screenshot    MANDALAY SMART PAY.png
    [Return]   ${Ref1}    ${AmountPay}
    Tap    ${CloseFormReloadLastPage}
    Sleep    3s
    
To validate addmoney by entering custom amount with 123 service
   [Arguments]    ${InputAmount}    ${ReloadOption}
    Wait Until Element Is Visible    ${Welcome}    10s
    Capture Page Screenshot    Home Page.png
    #Tap    ${LocateMenuReload}
    Wait Until Element Is Visible    //XCUIElementTypeButton[@name="burger_button"]    30s
    Tap   //XCUIElementTypeButton[@name="burger_button"]
    Wait Until Element is visible   ${Hamreload}    5s
    Tap     ${Hamreload}
    Wait Until Element Is Visible    ${ReloadMainMenu}    10s
    Capture Page Screenshot    Reload.png
    Tap    ${Custom}
    Input Text    ${EditAmount}    ${InputAmount}
    Tap    //XCUIElementTypeButton[@name="Done"]
    Tap    ${ConfirmEditAmount}
    Wait Until Element Is Visible   ${AmountPageOption}
    ${Amount}    Get Text    ${CurrentBalance}
    Tap    ${${ReloadOption}Option}
    ${ConfirmAmount}    Get Text    ${ReloadAmount}
    ${ConfirmAmount}    Remove String    ${ConfirmAmount}    ,
    ${ConfirmAmount}    Convert To Number    ${ConfirmAmount}    
    ${Amount}    Remove String    ${Amount}    ,
    ${Amount}    Convert To Number    ${Amount}
    Should Be Equal    ${ConfirmAmount}    ${Amount}
    sleep   5s
    ${Fee}    Get Text    ${ReloadFeeAmount}
    ${Fee}    Remove String    ${Fee}    MMK
    ${Fee}    Remove String    ${Fee}    ,
    ${Fee}    Convert To Number    ${Fee}
    ${TotalAmount}    Get Text    ${ReloadTotalAmount}
    ${CRTotalAmount}    Remove String    ${TotalAmount}    ,
    ${TotalAmount}    Convert To Number    ${CRTotalAmount}
    ${AmountFee}    Evaluate    ${Amount}+${Fee}
    Should Be Equal    ${TotalAmount}    ${AmountFee}
    ${CheckOption}    Get Text    ${ReloadOptionConfirm}
    Should Be Equal    ${ReloadOption}    ${CheckOption}
    Tap    ${ReloadConfirmButton}
    Wait Until Page Does Not Contain    ${ReloadLoading}
    Wait Until Element Is Visible    ${HeaderSamtPay}    20
    ${Ref1}    Get text    ${ReloadRef1}
    ${AmountPay}    Get text    //XCUIElementTypeStaticText[@name="1,300"]
    ${AmountPay}    Remove String    ${AmountPay}    ,
    Log    ${AmountPay}
    #${AmountPay}    Convert To Number    ${AmountPay}
    Should Be Equal    ${CRTotalAmount}    ${AmountPay}
    Capture Page Screenshot    MANDALAY SMART PAY.png
    [Return]   ${Ref1}    ${AmountPay}
    Tap    ${CloseFormReloadLastPage} 
    Sleep    3s