*** Settings ***
Library    AppiumLibrary
Library    String
Library	   OperatingSystem
Resource    ../Global Keyword.robot
Resource    ../Connect to DB/db.robot
Resource    ../../Locator/GoodandService.resource
Resource    ../../Locator/HomePage.resource


*** Keywords ***
To validate goods and service functionality by searching the merchant
    [Arguments]    ${CustomerMobile}   ${Amount}
    #get wallet amount from db
    ${amountbefore}    Get wallet amount    ${CustomerMobile}
    #display amount in logs
    log   ${amountbefore}
    Wait Until Element Is Visible    ${Welcome}    10s
    Capture Page Screenshot    Home Page.png
    Wait Until Element Is Visible    ${Hamburgerbtn}    20s
    #click on hamburger menu
    Tap   ${Hamburgerbtn}
    Wait Until Element is visible  ${hamgoods}  5s
    #click on goods and service menu
    Tap     ${hamgoods}
    Wait Until Element Is Visible    ${ServiceMainMenu}    10s
    capture page screenshot  Good and service.png
    wait until element is visible  ${searchfield}    5s
    #tap on search field
    tap   ${searchfield}
    #input text in search field
    input text  ${searchfield}     Merchant
    wait until element is visible  ${searchbtn}   5s
    #click on search button
    tap    ${searchbtn}
    wait until element is visible  ${selectfirst}    10s
    #select the first merchant displayed
    tap    ${selectfirst}
#    Scroll    ${Travelmenu}     ${ServiceMainMenu}
#    Wait Until Element Is Visible    ${clickmiscellaneous}      3s
#    Tap   ${clickmiscellaneous}
    #Wait Until Element Is Visible    ${clickbasmerchant}    10s
#    Tap   ${clickbasmerchant}
    Wait Until Element Is Visible    ${TransferMainMenu}    20s
    #tap on the amount field on transfer page
    Tap   ${Amountfield}
    #enter amount in the amount field
    Input Text    ${Amountfield}    ${Amount}
    #tap on the done key on keypad
    Tap    ${donekeypad}
    Wait Until Element Is Visible   ${Notefield}   3s
    #tap on note field
    Tap   ${Notefield}
    #input note in note field
    Input Text    ${Notefield}    Test
    #tap on the done key on keypad
    Tap    ${donekeypad}
    Wait Until Element Is Visible     ${NEXTbutton}  3s
    #click on next button on transfer page
    Tap   ${NEXTbutton}
    Wait Until Element Is Visible     ${Confirmationtitle}  3s
    #scroll on confirmation page
    Scroll    ${Receivername}    ${Confirmationtitle}
    sleep   4s
    #click on confirm button on confirmation page
    Tap    id=confirm_buttton
    #enter passcode
    ENTER PASSCODE
    #accept permission popup
    Allow Permission
    Wait Until Element Is Visible    ${Successpage}    20
    Capture Page Screenshot    TransferSUCCESS.png
     #convert string to number
    ${Amount}    Convert To Number    ${Amount}
     #getting amount from success page
    ${SUCCESSTransferAmount}    Get Text    ${Successamount}
    #removing , and MMK from the string
    ${SUCCESSTransferAmount}    Remove String    ${SUCCESSTransferAmount}    ,
    #convertt string to number
    ${SUCCESSTransferAmount}    Convert To Number    ${SUCCESSTransferAmount}
    #getting fee amount
    ${Fee}    Get Text    ${SuccessFee}
    #removing , and MMK from the string and converting to integer
    ${Fee}    Remove String    ${Fee}    MMK
    ${Fee}    Remove String    ${Fee}    ,
    ${Fee}    Convert To Number    ${Fee}
    # addition of amount and fee
    ${TransferTotalAmount}    Evaluate    ${SUCCESSTransferAmount}+${Fee}
    # scroll on success page
    Scroll    ${receivernumber}    ${Successamount}
    # click on back to home button on success page
    Tap   ${backtohome}
#    Wait Until Element Is Visible    ${LocateMenuTransfer}    10
    Capture Page Screenshot    buttonBackToHome.png
    ${amountafter}    Get wallet amount    ${CustomerMobile}
    log    ${amountafter}
    ${amountafter}    Convert To String    ${amountafter}
    ${totalAmountA}=    Evaluate     ${amountbefore}-${Amount}
    ${totalAmountA}    Convert to Dicimal 2 digit    ${totalAmountA}
    Log    ${amountafter}
    Log    ${totalAmountA}
    Log To Console    Should Be Equal    ${amountafter}    ${totalAmountA}

To validate goods and service functionality with user having insufficient user and no receiver
         [Arguments]       ${Amount}
    Wait Until Element Is Visible    ${Welcome}    10s
    Capture Page Screenshot    Home Page.png
    Wait Until Element Is Visible    ${Hamburgerbtn}    20s
    Tap   ${Hamburgerbtn}
    Wait Until Element is visible  ${hamgoods}  5s
    Tap     ${hamgoods}
    Wait Until Element Is Visible    ${ServiceMainMenu}    10s
    capture page screenshot  Good and service.png
    wait until element is visible  ${searchfield}    5s
    tap   ${searchfield}
    input text  ${searchfield}     Merchant
    wait until element is visible  ${searchbtn}   5s
    tap    ${searchbtn}
    wait until element is visible  ${selectfirst}    10s
    tap    ${selectfirst}
    Wait Until Element Is Visible    ${TransferMainMenu}    20s
    Tap   ${Amountfield}
    Input Text    ${Amountfield}    ${Amount}
    Tap    ${donekeypad}
    Wait Until Element Is Visible   ${Notefield}   3s
    Tap   ${Notefield}
    Input Text    ${Notefield}    Test
    Tap    ${donekeypad}
    Wait Until Element Is Visible     ${NEXTbutton}  3s
    Tap   ${NEXTbutton}
    ${geterrormsg}   get text  ${goodserror}
    # verify error message
    ${check}   run keyword and return status  should be equal  ${geterrormsg}     ${actuallerror}
    run keyword if  ${check}     log to console  insufficient balance
    run keyword if  ${check}      log     insufficient balance
    tap  ${goodspopupok}

    # no receiver
    wait until element is visible  ${phonenofield}     5s
    tap  ${phonenofield}
    clear text  ${phonenofield}
    tap   ${donekeypad}
    wait until element is visible  ${notefield}    4s
    Tap    ${notefield}
    input text  ${notefield}     Robot test
    tap   ${donekeypad}
    # verify if next button is disabled which means receiver is absent
    ${check}    run keyword and return status  element should be disabled   ${NEXTbutton}    5s
    run keyword if  ${check}   log to console    Receiver is absent
    run keyword if  ${check}    log    Receiver is absent
    #check if merchant then scroll
    ${checkifmer}    run keyword and return status   wait until page does not contain element     ${goodscrossbtn}  5s
    run keyword if  ${checkifmer}    scroll   ${Gmerscrollup}      ${Gmerscrolldown}
    #check if customer then tap cross btn
    ${checkifcus}    run keyword and return status  wait until element is visible   ${goodscrossbtn}   5s
    run keyword if  ${checkifcus}    tap   ${goodscrossbtn}









