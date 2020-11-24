*** Settings ***
Library    AppiumLibrary
Library    String
Library	   OperatingSystem
Resource    ../Global Keyword.robot
Resource    ../Connect to DB/db.robot
Resource    ../../Locator/Homepage.resource
Resource    ../../Locator/GiftsMenu.resource
Resource    ../../Locator/Insufficient Balance.resource

*** Keywords ***
To verify that iTunes service provider for gifts
    [Arguments]    ${Mobile}    ${Amount}
    Wait Until Element Is Visible    ${Welcome}    10s
    Capture Page Screenshot    Home page.png
    #Tap    ${LocateGifts}
    Wait Until Element Is Visible    //XCUIElementTypeButton[@name="burger_button"]    30s
    Tap   //XCUIElementTypeButton[@name="burger_button"]
    Wait Until Element is visible  //XCUIElementTypeButton[@name="gift_button"]  5s
    Tap     //XCUIElementTypeButton[@name="gift_button"]
    Wait Until Element Is Visible    ${iTunes}
    Tap    ${iTunes}
    Wait Until Element Is Visible    ${GiftName}
    Tap    ${iTunes${Amount}}
    Tap    ${Next}
    Process Confirm not Equal    ${Mobile}
    
To verify that google play service provider for gifts
    [Arguments]    ${Mobile}    ${Amount}
    Wait Until Element Is Visible    ${Welcome}    10s
    Capture Page Screenshot    Home page.png
    #Tap    ${LocateGifts}
    Wait Until Element Is Visible    //XCUIElementTypeButton[@name="burger_button"]    30s
    Tap   //XCUIElementTypeButton[@name="burger_button"]
    Wait Until Element is visible  //XCUIElementTypeButton[@name="gift_button"]  5s
    Tap     //XCUIElementTypeButton[@name="gift_button"]
    Wait Until Element Is Visible    ${GooglePlay}
    Tap    ${GooglePlay}
    Wait Until Element Is Visible    ${GiftName}
    Tap    ${GooglePlay${Amount}}
    Tap    ${Next}
    Wait until element is visible    	//XCUIElementTypeStaticText[@name="TERMS AND CONDITIONS"]   10s
    Tap    	//XCUIElementTypeButton[@name="check_button"]
    Tap     //XCUIElementTypeButton[@name="next_button"]
    Process Confirm not Equal    ${Mobile}
    
To verify that viberout service provider for gifts
    [Arguments]    ${Mobile}    ${Amount}    ${ViberOutNumber}
    Wait Until Element Is Visible    ${Welcome}    10s
    Capture Page Screenshot    Home page.png
    #Tap    ${LocateGifts}
    Wait Until Element Is Visible    //XCUIElementTypeButton[@name="burger_button"]    30s
    Tap   //XCUIElementTypeButton[@name="burger_button"]
    Wait Until Element is visible  //XCUIElementTypeButton[@name="gift_button"]  5s
    Tap     //XCUIElementTypeButton[@name="gift_button"]
    Wait Until Element Is Visible    ${ViberOut}
    Tap    ${ViberOut}
    Wait Until Element Is Visible    ${GiftName}
    Input Text    ${InputViberNumber}    ${ViberOutNumber}
    Tap    xpath=//XCUIElementTypeButton[@name="Done"]
    Sleep    1s
    Tap    ${ViberOut${Amount}}
    Tap    ${Next}
    Process Confirm not Equal    ${Mobile}
    
To verify that easypoint service provider by selecting amount for gifts
    [Arguments]    ${Mobile}    ${Amount}
    Wait Until Element Is Visible    ${Welcome}    10s
    Capture Page Screenshot    Home page.png
    #Tap    ${LocateGifts}
    Wait Until Element Is Visible    //XCUIElementTypeButton[@name="burger_button"]    30s
    Tap   //XCUIElementTypeButton[@name="burger_button"]
    Wait Until Element is visible  //XCUIElementTypeButton[@name="gift_button"]  5s
    Tap     //XCUIElementTypeButton[@name="gift_button"]
    Wait Until Element Is Visible    ${EasyPoint}
    Tap    ${EasyPoint}
    Wait Until Element Is Visible    ${GiftName}
    Tap    ${EasyPoint${Amount}MMK}
    Tap    ${Next}
    Process Confirm not Equal    ${Mobile}
    
To verify that easypoint service provider by entering custom amount for gifts
    [Arguments]    ${Mobile}    ${Amount}
    Wait Until Element Is Visible    ${Welcome}    10s
    Capture Page Screenshot    Home page.png
    #Tap    ${LocateGifts}
    Wait Until Element Is Visible    //XCUIElementTypeButton[@name="burger_button"]    30s
    Tap   //XCUIElementTypeButton[@name="burger_button"]
    Wait Until Element is visible  //XCUIElementTypeButton[@name="gift_button"]  5s
    Tap     //XCUIElementTypeButton[@name="gift_button"]
    Wait Until Element Is Visible    ${EasyPoint}
    Tap    ${EasyPoint}
    Wait Until Element Is Visible    ${GiftName}
    Tap    ${EasyPointCustomMMK}
    Input Text    ${EasyPointEditAmount}    ${Amount}
    Tap    xpath=//XCUIElementTypeButton[@name="Done"]
    Tap    ${Next}
    Process Confirm not Equal    ${Mobile}
    
Gifts EasyPoint Customer Amount Not between 500-500,000
    [Arguments]    ${Mobile}    ${AmountLower}    ${AmountUpper}
    Wait Until Element Is Visible    ${Welcome}    10s
    Capture Page Screenshot    Home page.png
    #Tap    ${LocateGifts}
    Wait Until Element Is Visible    //XCUIElementTypeButton[@name="burger_button"]    30s
    Tap   //XCUIElementTypeButton[@name="burger_button"]
    Wait Until Element is visible  //XCUIElementTypeButton[@name="gift_button"]  5s
    Tap     //XCUIElementTypeButton[@name="gift_button"]
    Wait Until Element Is Visible    ${EasyPoint}
    Tap    ${EasyPoint}
    Wait Until Element Is Visible    ${GiftName}
    Tap    ${EasyPointCustomMMK}
    Input Text    ${EasyPointEditAmount}    ${AmountLower}
    Tap    xpath=//XCUIElementTypeButton[@name="Done"]
    Tap    ${Next}
    Wait Until Element Is Visible    ${OKbutton}
    ${MessageOverlimit}    Get Text    ${LocateInsufficientBalance}
    Should Be Equal    ${WordingOverlimit}    ${MessageOverlimit}
    Tap    ${OKbutton}
    Sleep    1s
    Clear text    ${EasyPointEditAmount}
    Input Text    ${EasyPointEditAmount}    ${AmountUpper}
    Tap    xpath=//XCUIElementTypeButton[@name="Done"]
    Tap    ${Next}
    Wait Until Element Is Visible    ${OKbutton}
    ${MessageOverlimit}    Get Text    ${LocateInsufficientBalance}
    Should Be Equal    ${WordingOverlimit}    ${MessageOverlimit}
    Tap    ${OKbutton}
    Sleep    1s
    Tap    ${CloseButton}
    Sleep    1s
    Tap    ${CloseGifts}
    
To verify that steamwallet service provider for gifts
    [Arguments]    ${Mobile}
    Wait Until Element Is Visible    ${Welcome}    10s
    Capture Page Screenshot    Home page.png
    #Tap    ${LocateGifts}
    Wait Until Element Is Visible    //XCUIElementTypeButton[@name="burger_button"]    30s
    Tap   //XCUIElementTypeButton[@name="burger_button"]
    Wait Until Element is visible  //XCUIElementTypeButton[@name="gift_button"]  5s
    Tap     //XCUIElementTypeButton[@name="gift_button"]
    Wait Until Element Is Visible    ${Steamwallet}
    Tap    ${Steamwallet}
    Wait Until Element Is Visible    ${GiftName}
    @{amount} =  create list     ${SteamwalletUSD5}   ${SteamwalletUSD10}   ${SteamwalletUSD15}   ${SteamwalletUSD20}    ${SteamwalletUSD50}
    Check Out of Stock Not have Fee Not Equel (Gifts)    ${Mobile}    @{amount}
    Capture Page Screenshot    Home page.png
    
    
To verify that Steamwallet SGD service provider for gifts
    [Arguments]    ${Mobile}
    Wait Until Element Is Visible    ${Welcome}    10s
    Capture Page Screenshot    Home page.png
    #Tap    ${LocateGifts}
    Wait Until Element Is Visible    //XCUIElementTypeButton[@name="burger_button"]    30s
    Tap   //XCUIElementTypeButton[@name="burger_button"]
    Wait Until Element is visible  //XCUIElementTypeButton[@name="gift_button"]  5s
    Tap     //XCUIElementTypeButton[@name="gift_button"]
    Wait Until Element Is Visible    ${SteamwalletSGD}
    Tap    ${SteamwalletSGD}
    Wait Until Element Is Visible    ${GiftName}
    @{amount} =  create list     ${SteamwalletSGD5}   ${SteamwalletSGD10}   ${SteamwalletSGD20}   ${SteamwalletSGD30}    ${SteamwalletSGD50}
    Check Out of Stock Not have Fee Not Equel (Gifts)    ${Mobile}    @{amount}
    Capture Page Screenshot    Home page.png
    
To verify that vakok service provider for gifts
    [Arguments]    ${Mobile}
    Wait Until Element Is Visible    ${Welcome}    10s
    Capture Page Screenshot    Home page.png
    #Tap    ${LocateGifts}
    Wait Until Element Is Visible    //XCUIElementTypeButton[@name="burger_button"]    30s
    Tap   //XCUIElementTypeButton[@name="burger_button"]
    Wait Until Element is visible  //XCUIElementTypeButton[@name="gift_button"]  5s
    Tap     //XCUIElementTypeButton[@name="gift_button"]
    Wait Until Element Is Visible    ${Vakok}
    Tap    ${Vakok}
    Wait Until Element Is Visible    ${GiftName}
    @{amount} =  create list     ${Vakok3000MMK}   ${Vakok5000MMK}   ${Vakok10000MMK}
    Check Out of Stock Not have Fee Not Equel (Gifts)    ${Mobile}    @{amount}
    Capture Page Screenshot    Home page.png
    
To Validate that insufficient balance of itunes
    [Arguments]    ${Mobile}    ${Amount}
    Wait Until Element Is Visible    ${Welcome}    10s
    Capture Page Screenshot    Home page.png
    #Tap    ${LocateGifts}
    Wait Until Element Is Visible    //XCUIElementTypeButton[@name="burger_button"]    30s
    Tap   //XCUIElementTypeButton[@name="burger_button"]
    Wait Until Element is visible  //XCUIElementTypeButton[@name="gift_button"]  5s
    Tap     //XCUIElementTypeButton[@name="gift_button"]
    Wait Until Element Is Visible    ${iTunes}
    Tap    ${iTunes}
    Wait Until Element Is Visible    ${GiftName}
    Tap    ${iTunes${Amount}}
    Tap    ${Next}
    Process Confirm Insufficient Balance    ${Mobile}
    Sleep    1s
    
To Validate that insufficient balance of googleplay
    [Arguments]    ${Mobile}    ${Amount}
    Wait Until Element Is Visible    ${Welcome}    10s
    Capture Page Screenshot    Home page.png
    #Tap    ${LocateGifts}
    Wait Until Element Is Visible    //XCUIElementTypeButton[@name="burger_button"]    30s
    Tap   //XCUIElementTypeButton[@name="burger_button"]
    Wait Until Element is visible  //XCUIElementTypeButton[@name="gift_button"]  5s
    Tap     //XCUIElementTypeButton[@name="gift_button"]
    Wait Until Element Is Visible    ${GooglePlay}
    Tap    ${GooglePlay}
    Wait Until Element Is Visible    ${GiftName}
    Tap    ${GooglePlay${Amount}}
    Tap    ${Next}
    Wait until element is visible    	//XCUIElementTypeStaticText[@name="TERMS AND CONDITIONS"]   10s
    Tap    	//XCUIElementTypeButton[@name="check_button"]
    Tap     //XCUIElementTypeButton[@name="next_button"]
    Process Confirm Insufficient Balance    ${Mobile}
    Sleep    1s

To Validate that insufficient balance of viberout
    [Arguments]    ${Mobile}    ${Amount}    ${ViberOutNumber}
    Wait Until Element Is Visible    ${Welcome}    10s
    Capture Page Screenshot    Home page.png
    #Tap    ${LocateGifts}
    Wait Until Element Is Visible    //XCUIElementTypeButton[@name="burger_button"]    30s
    Tap   //XCUIElementTypeButton[@name="burger_button"]
    Wait Until Element is visible  //XCUIElementTypeButton[@name="gift_button"]  5s
    Tap     //XCUIElementTypeButton[@name="gift_button"]
    Wait Until Element Is Visible    ${ViberOut}
    Tap    ${ViberOut}
    Wait Until Element Is Visible    ${GiftName}
    Input Text    ${InputViberNumber}    ${ViberOutNumber}
    Tap    xpath=//XCUIElementTypeButton[@name="Done"]
    Sleep    1s
    Tap    ${ViberOut${Amount}}
    Tap    ${Next}
    Process Confirm Insufficient Balance    ${Mobile}
    Sleep    1s
    
To Validate that insufficient balance of easypoint select amount
    [Arguments]    ${Mobile}    ${Amount}
    Wait Until Element Is Visible    ${Welcome}    10s
    Capture Page Screenshot    Home page.png
    #Tap    ${LocateGifts}
    Wait Until Element Is Visible    //XCUIElementTypeButton[@name="burger_button"]    30s
    Tap   //XCUIElementTypeButton[@name="burger_button"]
    Wait Until Element is visible  //XCUIElementTypeButton[@name="gift_button"]  5s
    Tap     //XCUIElementTypeButton[@name="gift_button"]
    Wait Until Element Is Visible    ${EasyPoint}
    Tap    ${EasyPoint}
    Wait Until Element Is Visible    ${GiftName}
    Tap    ${EasyPoint${Amount}MMK}
    Tap    ${Next}
    Wait Until Element Is Visible    ${OKbutton}
    ${MessageInsufficientBalance}    Get Text    ${LocateInsufficientBalance}
    Should Be Equal    ${WordingInsufficientBalance}    ${MessageInsufficientBalance}
    Tap    ${OKbutton}
    Sleep    1s
    Tap    ${CloseButton}
    Sleep    1s
    
To Validate that insufficient balance of easypoint custom amount
    [Arguments]    ${Mobile}    ${Amount}
    Wait Until Element Is Visible    ${Welcome}    10s
    Capture Page Screenshot    Home page.png
    #Tap    ${LocateGifts}
    Wait Until Element Is Visible    //XCUIElementTypeButton[@name="burger_button"]    30s
    Tap   //XCUIElementTypeButton[@name="burger_button"]
    Wait Until Element is visible  //XCUIElementTypeButton[@name="gift_button"]  5s
    Tap     //XCUIElementTypeButton[@name="gift_button"]
    Wait Until Element Is Visible    ${EasyPoint}
    Tap    ${EasyPoint}
    Wait Until Element Is Visible    ${GiftName}
    Tap    ${EasyPointCustomMMK}
    Input Text    ${EasyPointEditAmount}    ${Amount}
    Tap    xpath=//XCUIElementTypeButton[@name="Done"]
    Tap    ${Next}
    Wait Until Element Is Visible    ${OKbutton}
    ${MessageInsufficientBalance}    Get Text    ${LocateInsufficientBalance}
    Should Be Equal    ${WordingInsufficientBalance}    ${MessageInsufficientBalance}
    Tap    ${OKbutton}
    Sleep    1s
    Tap    ${CloseButton}
    Sleep    1s
    
To Validate that insufficient balance of steamwallet
    [Arguments]    ${Mobile}    ${Amount}
    Wait Until Element Is Visible    ${Welcome}    10s
    Capture Page Screenshot    Home page.png
    #Tap    ${LocateGifts}
    Wait Until Element Is Visible    //XCUIElementTypeButton[@name="burger_button"]    30s
    Tap   //XCUIElementTypeButton[@name="burger_button"]
    Wait Until Element is visible  //XCUIElementTypeButton[@name="gift_button"]  5s
    Tap     //XCUIElementTypeButton[@name="gift_button"]
    Wait Until Element Is Visible    ${Steamwallet}
    Tap    ${Steamwallet}
    Wait Until Element Is Visible    ${GiftName}
    Tap    ${SteamwalletUSD${Amount}}
    Tap    ${Next}
    Process Confirm Insufficient Balance    ${Mobile}
    Sleep    1s
    
    
To Validate that insufficient balance of steamwallet SGD
   [Arguments]    ${Mobile}    ${Amount}
    Wait Until Element Is Visible    ${Welcome}    10s
    Capture Page Screenshot    Home page.png
    #Tap    ${LocateGifts}
    Wait Until Element Is Visible    //XCUIElementTypeButton[@name="burger_button"]    30s
    Tap   //XCUIElementTypeButton[@name="burger_button"]
    Wait Until Element is visible  //XCUIElementTypeButton[@name="gift_button"]  5s
    Tap     //XCUIElementTypeButton[@name="gift_button"]
    Wait Until Element Is Visible    ${SteamwalletSGD}
    Tap    ${SteamwalletSGD}
    Wait Until Element Is Visible    ${GiftName}
    Tap    ${SteamwalletSGD${Amount}}
    Tap    ${Next}
    Process Confirm Insufficient Balance    ${Mobile}
    Sleep    1s
    
To Validate that insufficient balance of vakok
    [Arguments]    ${Mobile}
    Wait Until Element Is Visible    ${Welcome}    10s
    Capture Page Screenshot    Home page.png
    #Tap    ${LocateGifts}
    Wait Until Element Is Visible    //XCUIElementTypeButton[@name="burger_button"]    30s
    Tap   //XCUIElementTypeButton[@name="burger_button"]
    Wait Until Element is visible  //XCUIElementTypeButton[@name="gift_button"]  5s
    Tap     //XCUIElementTypeButton[@name="gift_button"]
    Wait Until Element Is Visible    ${Vakok}
    Tap    ${Vakok}
    Wait Until Element Is Visible    ${GiftName}
    @{amount} =  create list     ${Vakok3000MMK}   ${Vakok5000MMK}   ${Vakok10000MMK}
    :FOR  ${i}  IN    @{amount}
    \   Tap    ${i}
    \   Tap    ${NextButton}
    \   ${Status}=  Run Keyword And Return Status    Wait Until Element Is Visible    ${OKbutton}   10s
    \   ${MessageInsufficientBalance}    Run Keyword If    "${Status}"=="True"     Get Text    ${LocateInsufficientBalance}
    \   Tap    ${OKbutton}
    \   Should Be Equal    ${WordingInsufficientBalance}    ${MessageInsufficientBalance}
    Run Keyword If    "${Status}"=="False"     log to console     eLoad Insufficient Balance 
    Sleep    1s
    Tap    ${CloseButton}
    Sleep    1s

To verify gifts by selecting mobile number from phonebook
    [Arguments]       ${Amount}
    Wait Until Element Is Visible     ${Hamburgerbtn}   30s
    #click on hamburger menu
    Tap   ${Hamburgerbtn}
    Wait Until Element is visible  ${giftham}  5s
    #click on gifts menu
    Tap     ${giftham}
    Wait Until Element Is Visible    ${ViberOut}
    #click on viberout biller
    Tap    ${ViberOut}
    Wait Until Element Is Visible    ${GiftName}
    #click on phonebook icon
    Tap    ${phonebook}
     #check for the permission popup
    ${popup}   run keyword and return status  wait until element is visible  ${accesspopup}   5s
    run keyword if  ${popup}     tap    ${popupok}
    Wait until element is visible     ${giftnofrombook}    4s
    #click on number from phonebook
    Tap    ${giftnofrombook}
    wait until element is visible     ${phonebook}    4s
    #select the amount
    Tap    ${ViberOut${Amount}}
    wait until element is visible     ${Next}
    #click on the next button
    Tap    ${Next}
    wait until element is visible   ${LocateConfirmButton}   4s
    #click on the confirm button on confirmation page
    Tap    ${LocateConfirmButton}
    #navigate to enter passcode
    Enter Passcode Gifts
    #accept permission
    Allow Permission
    Wait Until Element Is Visible    ${BackToHome}    10s
    #click on the back to home button on success page
    Tap    ${BackToHome}

To verify gifts without entering mobile number
     [Arguments]    ${Amount}
    Wait Until Element Is Visible    ${Welcome}    10s
    Capture Page Screenshot    Home page.png

    Wait Until Element Is Visible   ${Hamburgerbtn}     30s
    Tap   ${Hamburgerbtn}
    Wait Until Element is visible  ${giftham}   5s
    Tap     ${giftham}
    Wait Until Element Is Visible    ${ViberOut}
    Tap    ${ViberOut}
    Wait Until Element Is Visible    ${GiftName}
    Input Text    ${InputViberNumber}    0941214555
    Tap    ${donekeypad}
    Sleep    1s
    Tap    ${ViberOut${Amount}}
    Tap    ${Next}
    Wait Until Element Is Visible    ${LocateAmountConfirm}    10s
    Scroll    id=receiver_name_label    ${LocateAmountConfirm}
    Tap    ${LocateConfirmButton}
    Enter Passcode Gifts
    wait until element is visible    ${vibererror}   5s
    ${Ovibererror}   get text    ${vibererror}
    ${check}   run keyword and return status    should be equal   ${actualerror}     ${Ovibererror}
    run keyword if   ${check}     log to console    not a viberout number
    wait until element is visible   ${giftpopupok}     5s
    tap    ${giftpopupok}