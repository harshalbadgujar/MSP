*** Settings ***
Library    AppiumLibrary
Library    String
Library	   OperatingSystem
Resource    Connect to DB/db.robot
Resource    Keyword MSP Function/Confirm.robot
Resource    ../Locator/OTPPage.resource
Resource    ../Locator/HomePage.resource
Resource    ../Locator/HistoryDetail.resource

*** Variables ***
${REMOTE_URL}          http://127.0.0.1:4723/wd/hub      # URL to appium server
${PLATFORM_NAME}       iOS
${PLATFORM_VERSION}    13.5
${DEVICE_NAME}         iPhone 11
#${APP_LOCATION}        /Users/qa-tester/Desktop/mso\ app\ files/simulator/MSP-3.app
${APP_LOCATION}        /Users/administrator/Desktop/MSP.app
${BUNDLE_ID}           com.ccpp.msp
${AppActivity}         com.ccpp.msp.Launcher
*** Keywords ***
Open App
          Open Application    ${REMOTE_URL}
      ...  platformName=${PLATFORM_NAME}
      ...  platformVersion=${PLATFORM_VERSION}
      ...  deviceName=${DEVICE_NAME}
      ...  automationName=appium
      ...  appLocation=${APP_LOCATION}
      ...  bundleId=${BUNDLE_ID}
      ...  appActivity=${AppActivity}


Enter OTP
    Sleep    4s  
    ${OTPPrefix}    Get Text    ${LocateOTPPrefix}
    Log    ${OTPPrefix}
    ${OTP}    Get OTP    ${OTPPrefix}    
    Log    ${OTP}
    Input Text    ${LocateInputOTP}    ${OTP}   
    
Enter Passcode
     wait until element is visible    id=title_label    20s
     Tap   //XCUIElementTypeKey[@name="1"]
     Tap   //XCUIElementTypeKey[@name="1"]
     Tap   //XCUIElementTypeKey[@name="1"]
     Tap   //XCUIElementTypeKey[@name="1"]
     Tap   //XCUIElementTypeKey[@name="1"]
     Tap   //XCUIElementTypeKey[@name="1"]
     ${check}    run keyword and return status  wait until element is visible     ${wrongpasscodemsg}    10s
     run keyword if  ${check}     Continue check

Continue check
     :FOR   ${i}    IN RANGE    1     10
     \     ${check}    run keyword and return status  wait until element is visible     ${wrongpasscodemsg}    5s
     \     run keyword if    ${check}      Tap     ${wrongpasspopupok}
     \     run keyword if    ${check}     Enter Passcode
     \     ${check1}     run keyword and return status  wait until element is visible   ${Welcome}    10s
     \     exit for loop if   ${check1} == True

Enter Passcode Gifts
     wait until element is visible    id=sub_title_label    10s
     Tap   //XCUIElementTypeKey[@name="1"]
     Tap   //XCUIElementTypeKey[@name="1"]
     Tap   //XCUIElementTypeKey[@name="1"]
     Tap   //XCUIElementTypeKey[@name="1"]
     Tap   //XCUIElementTypeKey[@name="1"]
     Tap   //XCUIElementTypeKey[@name="1"] 
     
To check the transaction in transaction history
    [Arguments]    ${Transaction}    ${Amount}
     wait until element is visible    ${Check_Your_Transaction_Here}
     Tap    ${Check_Your_Transaction_Here}
  #   wait until element is visible    //*[@name="Transfer"]   20s
     Wait until element is visible     //*[@value="${Transaction}"][1]    10s
     #Tap    //XCUIElementTypeApplication[@name="MSP-UAT"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell[1]
     Tap    //*[@value="${Transaction}"][1]
     #Tap    //XCUIElementTypeStaticText[@name="${Transaction}"][1]
     Wait until element is visible    ${LocateAmountTransactionDetail}    10s
     ${TransactionDetailMenu}    Get text    ${LocateTransactionDetailMenu}
     Should Be Equal    ${Transaction}    ${TransactionDetailMenu}    
     ${Amount}    Convert To Number    ${Amount}
     ${AmountTransactionDetail}    Get Text    ${LocateAmountTransactionDetail}
     ${AmountTransactionDetail}    Remove String    ${AmountTransactionDetail}    MMK
     ${AmountTransactionDetail}    Remove String    ${AmountTransactionDetail}    ,
     ${AmountTransactionDetail}    Convert To Number    ${AmountTransactionDetail}
     Should Be Equal    ${Amount}    ${AmountTransactionDetail}
     Capture Page Screenshot    ${Transaction}History.png
     Tap   ${detailback}
     wait until element is visible  ${transactionback}   3s
     Tap    ${transactionback}

     
     
Convert to Dicimal 2 digit
    [Arguments]    ${Amout}
    ${availableRemainingDecimal2digit1}=    Convert To Number    ${Amout}    2
    ${Amout}=    Evaluate  "%.2f" % ${availableRemainingDecimal2digit1}
    [Return]    ${Amout}
    
Verify amount
    [Arguments]    ${SenderMobile}    ${amountAbefore}    ${MobileReceiver}    ${amountBbefore}    ${Amount}
    Log    ${Amount}
    ${amountAafter}    Get wallet amount    ${SenderMobile}
    log    ${amountAafter}
    ${amountAafter}    Convert To String    ${amountAafter}
    ${totalAmountA}=    Evaluate    ${amountAbefore}-${Amount}
    ${totalAmountA}    Convert to Dicimal 2 digit    ${totalAmountA}
    Log    ${amountAafter}
    Log    ${totalAmountA}
    Log To Console    Should Be Equal    ${amountAafter}    ${totalAmountA}    
    ${amountBafter}    Get wallet amount    ${MobileReceiver}
    log    ${amountBafter}
    ${amountBafter}    Convert To String    ${amountBafter}
    ${totalAmountB}=    Evaluate    ${amountBbefore}+${Amount}
    ${totalAmountB}    Convert to Dicimal 2 digit    ${totalAmountB}
    Log    ${amountBafter}
    Log    ${totalAmountB}
    Log To Console    Should Be Equal    ${amountBafter}    ${totalAmountB}
    
Allow Permission
    #${status1}    Run Keyword And Return Status    Wait Until Element Is Visible    //XCUIElementTypeAlert[@name="“MSP-UAT” Would Like to Add to your Photos"]    10s
    ${status0}    Run Keyword And Return Status    Wait Until Element Is Visible    id=loading_actInd    10s
    Run Keyword If    "${status0}"=="True"    Wait Until Page Does Not Contain Element    id=loading_actInd    10s
    ${status1}    Run Keyword And Return Status    Wait Until Element Is Visible    xpath=//XCUIElementTypeButton[@name="Don’t Allow"]    10s
    Run Keyword If    "${status1}"=="True"    Tap    xpath=//XCUIElementTypeButton[@name="Don’t Allow"]
    
Get Amount Rebate
    ${REBATE}    Get Text    id=rebate_amount_label
    [Return]    ${REBATE}
    
All amount out of stock
    log to console     all amounts out of stock
    Tap    ${CloseButton}
    Sleep    1s
    Tap    ${CloseGifts}
    
Check Out of Stock Not have Fee
    [Arguments]    ${Mobile}    @{amount}
    #@{amount} =  create list     ${Amount5000}   ${Amount10000}   ${Amount20000}   ${Amount35000}
    :FOR  ${i}  IN  @{amount}
    \   Tap  ${i}
    \   ${Outofstock}=  Run Keyword And Return Status    Wait Until Element Is Visible    id=constructive_button   10s
    \   Run Keyword If    "${Outofstock}"=="True"     Tap  id=constructive_button
    \   ${cnfrm}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${HeaderConfirm}   10s
    \   Run Keyword If    "${cnfrm}"=="True"     Process Confirm not have fee    ${Mobile}
    \   Exit For Loop IF    "${cnfrm}"== "True"
    Run Keyword If    "${cnfrm}"=="False"     log to console     all amounts out of stock
    
Check Out of Stock Not have Fee Not Equel
    [Arguments]    ${Mobile}    @{amount}
    #@{amount} =  create list     ${Amount5000}   ${Amount10000}   ${Amount20000}   ${Amount35000}
    :FOR  ${i}  IN  @{amount}
    \   Tap  ${i}
    \   ${Outofstock}=  Run Keyword And Return Status    Wait Until Element Is Visible    id=constructive_button   10s
    \   Run Keyword If    "${Outofstock}"=="True"     Tap  id=constructive_button
    \   ${cnfrm}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${HeaderConfirm}   10s
    \   Run Keyword If    "${cnfrm}"=="True"     Process Confirm not Equal    ${Mobile}
    \   Exit For Loop IF    "${cnfrm}"== "True"
    Run Keyword If    "${cnfrm}"=="False"     log to console     all amounts out of stock
    
Check Out of Stock Not have Fee (Gifts)
    [Arguments]    ${Mobile}    @{amount}
    #@{amount} =  create list     ${Amount5000}   ${Amount10000}   ${Amount20000}   ${Amount35000}
    :FOR  ${i}  IN  @{amount}
    \   Tap    ${i}
    \   Tap    id=next_button
    \   ${Outofstock}=  Run Keyword And Return Status    Wait Until Element Is Visible    id=constructive_button   10s
    \   Run Keyword If    "${Outofstock}"=="True"     Tap  id=constructive_button
    \   ${cnfrm}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${HeaderConfirm}   10s
    \   Run Keyword If    "${cnfrm}"=="True"     Process Confirm not have fee    ${Mobile}
    \   Exit For Loop IF    "${cnfrm}"== "True"
    Run Keyword If    "${cnfrm}"=="False"     log to console     all amounts out of stock
    
Check Out of Stock Not have Fee Not Equel (Gifts)
    [Arguments]    ${Mobile}    @{amount}
    #@{amount} =  create list     ${Amount5000}   ${Amount10000}   ${Amount20000}   ${Amount35000}
    :FOR  ${i}  IN  @{amount}
    \   Tap  ${i}
    \   Tap    id=next_button
    \   ${Outofstock}=  Run Keyword And Return Status    Wait Until Element Is Visible    id=constructive_button   10s
    \   Run Keyword If    "${Outofstock}"=="True"     Tap  id=constructive_button
    \   ${cnfrm}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${HeaderConfirm}   10s
    \   Run Keyword If    "${cnfrm}"=="True"     Process Confirm not Equal    ${Mobile}
    \   Exit For Loop IF    "${cnfrm}"== "True"
    Run Keyword If    "${cnfrm}"=="False"     log to console     all amounts out of stock
    
Check Out of Stock Not have Fee Not Equel(Movie)
    [Arguments]    ${Mobile}    @{amount}
    #@{amount} =  create list     ${Amount5000}   ${Amount10000}   ${Amount20000}   ${Amount35000}
    :FOR  ${i}  IN  @{amount}
    \   Tap  ${i}
    \   ${Outofstock}=  Run Keyword And Return Status    Wait Until Element Is Visible    id=constructive_button   10s
    \   Run Keyword If    "${Outofstock}"=="True"     Tap  id=constructive_button
    \   ${cnfrm}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${HeaderConfirm}   10s
    \   Run Keyword If    "${cnfrm}"=="True"     Process Confirm not Equal (Movie)    ${Mobile}
    \   Exit For Loop IF    "${cnfrm}"== "True"
    Run Keyword If    "${cnfrm}"=="False"     log to console     all amounts out of stock
    
CheckREBATE 
    ${REBATE}    Get Text    ${LocateREBATEConfirm}
    Log    ${REBATE}
    ${REBATE}    Remove String    ${REBATE}    MMK
    ${REBATE}    Remove String    ${REBATE}    ,
    ${REBATE}    Remove String    ${REBATE}    +
    ${REBATE}    Convert To Number    ${REBATE}
    [Return]    ${REBATE}
    
Logout
    wait until element is visible   id=burger_button       30s
    Tap    id=burger_button
    wait until element is visible   id=signout_button       30s
    Tap    id=signout_button
 
Keyword TearDonwn close app
    Capture Page Screenshot    TearDown.png
    Close application