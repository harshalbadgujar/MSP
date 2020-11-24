*** Settings ***
Library    AppiumLibrary
Library    String
Library	   OperatingSystem
Resource    ../Global Keyword.robot
Resource    ../Connect to DB/db.robot
Resource    ../../Locator/Homepage.resource
Resource    ../../Locator/InternetMenu.resource
Resource    ../../Locator/Insufficient Balance.resource

*** Keywords ***
To verify Ananda internet service provider
    [Arguments]    ${Mobile}
    Wait Until Element Is Visible    ${Welcome}    10s
    Capture Page Screenshot    Home page.png
    #Tap    ${LocateInternet}
    Wait Until Element Is Visible    //XCUIElementTypeButton[@name="burger_button"]    30s
    Tap   //XCUIElementTypeButton[@name="burger_button"]
    Wait Until Element is visible  //XCUIElementTypeButton[@name="internet_button"]  5s
    Tap     //XCUIElementTypeButton[@name="internet_button"]
    Wait Until Element Is Visible    ${Ananda}    10s
    Tap    ${Ananda}
    Wait Until Element Is Visible    ${Biller}
    @{amount} =  create list     ${Ananda20000}   ${Ananda10000}   ${Ananda5000}   ${Ananda35000}
    Check Out of Stock Not have Fee    ${Mobile}    @{amount}
    Capture Page Screenshot    Home page.png
    
To verify Telenor fiber internet service provider
    [Arguments]    ${Mobile}    ${Internetnumber}
    Wait Until Element Is Visible    ${Welcome}    10s
    Capture Page Screenshot    Home page.png
    #Tap    ${LocateInternet}
    Wait Until Element Is Visible    //XCUIElementTypeButton[@name="burger_button"]    30s
    Tap   //XCUIElementTypeButton[@name="burger_button"]
    Wait Until Element is visible  //XCUIElementTypeButton[@name="internet_button"]  5s
    Tap     //XCUIElementTypeButton[@name="internet_button"]
    Wait Until Element Is Visible    ${Telenor Fiber}
    Tap    ${Telenor Fiber}
    Wait Until Element Is Visible    ${Biller}
    Input Text    ${EditnumberTelenor}    ${Internetnumber}
    Tap    ${Next}
    Wait Until Element Is Visible    ${biller_name_button}
    Scroll    id=plan_title_label    ${biller_name_button}
    Tap    ${Next}
    Process Confirm not have fee    ${Mobile}
    
To verify Telenor wireless internet service provider
    [Arguments]    ${Mobile}    ${Internetnumber}
    Wait Until Element Is Visible    ${Welcome}    10s
    Capture Page Screenshot    Home page.png
    #Tap    ${LocateInternet}
    Wait Until Element Is Visible    //XCUIElementTypeButton[@name="burger_button"]    30s
    Tap   //XCUIElementTypeButton[@name="burger_button"]
    Wait Until Element is visible  //XCUIElementTypeButton[@name="internet_button"]  5s
    Tap     //XCUIElementTypeButton[@name="internet_button"]
    Wait Until Element Is Visible    ${Telenor Wireless}
    Tap    ${Telenor Wireless}
    Wait Until Element Is Visible    ${Biller}
    Input Text    ${EditnumberTelenor}    ${Internetnumber}
    Tap    ${Next}
    Wait Until Element Is Visible    ${biller_name_button}
    Scroll    id=plan_title_label    ${biller_name_button}
    Tap    ${Next}
    Process Confirm not have fee    ${Mobile}
    
To verify Hi internet service provider
    [Arguments]    ${Mobile}
    Wait Until Element Is Visible    ${Welcome}    10s
    Capture Page Screenshot    Home page.png
    #Tap    ${LocateInternet}
    Wait Until Element Is Visible    //XCUIElementTypeButton[@name="burger_button"]    30s
    Tap   //XCUIElementTypeButton[@name="burger_button"]
    Wait Until Element is visible  //XCUIElementTypeButton[@name="internet_button"]  5s
    Tap     //XCUIElementTypeButton[@name="internet_button"]
    Wait Until Element Is Visible    ${Hi Internet}
    Tap    ${Hi Internet}
    Wait Until Element Is Visible    ${Biller}    10s
    @{amount} =  create list     ${HiAmount300}   ${HiAmount1000}   ${HiAmount1500}
    Check Out of Stock Not have Fee    ${Mobile}    @{amount}
    Capture Page Screenshot    Home page.png
    
To verify MyanmarNet Prepaid service provider
    [Arguments]    ${Mobile}
    Wait Until Element Is Visible    ${Welcome}    10s
    Capture Page Screenshot    Home page.png
    #Tap    ${LocateInternet}
    Wait Until Element Is Visible    //XCUIElementTypeButton[@name="burger_button"]    30s
    Tap   //XCUIElementTypeButton[@name="burger_button"]
    Wait Until Element is visible  //XCUIElementTypeButton[@name="internet_button"]  5s
    Tap     //XCUIElementTypeButton[@name="internet_button"]
    Wait Until Element Is Visible    ${MyanmarNet Prepaid}
    Tap    ${MyanmarNet Prepaid}
    Wait Until Element Is Visible    ${Biller}    10s
    @{amount} =  create list     ${MyanmarNetPrepaid1000}   ${MyanmarNetPrepaid3000}   ${MyanmarNetPrepaid5000}    ${MyanmarNetPrepaid10000}
    Check Out of Stock Not have Fee    ${Mobile}    @{amount}
    Capture Page Screenshot    Home page.png

To verify MyanmarNet Data service provider
    [Arguments]    ${Mobile}
    Wait Until Element Is Visible    ${Welcome}    10s
    Capture Page Screenshot    Home page.png
    #Tap    ${LocateInternet}
    Wait Until Element Is Visible    //XCUIElementTypeButton[@name="burger_button"]    30s
    Tap   //XCUIElementTypeButton[@name="burger_button"]
    Wait Until Element is visible  //XCUIElementTypeButton[@name="internet_button"]  5s
    Tap     //XCUIElementTypeButton[@name="internet_button"]
    Wait Until Element Is Visible    ${MyanmarNet Data}
    Tap    ${MyanmarNet Data}
    Wait Until Element Is Visible    ${Biller}    10s
    @{amount} =  create list     ${MyanmarNet Data1000}   ${MyanmarNet Data5000}
    Check Out of Stock Not have Fee    ${Mobile}    @{amount}
    Capture Page Screenshot    Home page.png
    
To verify MyanmarNet A-Wa-Thone service provider
    [Arguments]    ${Mobile}
    Wait Until Element Is Visible    ${Welcome}    10s
    Capture Page Screenshot    Home page.png
    #Tap    ${LocateInternet}
    Wait Until Element Is Visible    //XCUIElementTypeButton[@name="burger_button"]    30s
    Tap   //XCUIElementTypeButton[@name="burger_button"]
    Wait Until Element is visible  //XCUIElementTypeButton[@name="internet_button"]  5s
    Tap     //XCUIElementTypeButton[@name="internet_button"]
    Wait Until Element Is Visible    ${MyanmarNet A-Wa-Thone}
    Tap    ${MyanmarNet A-Wa-Thone}
    Wait Until Element Is Visible    ${Biller}    10s
    @{amount} =  create list     ${MyanmarNet A-Wa-Thone1000}   ${MyanmarNet A-Wa-Thone1000}
    Check Out of Stock Not have Fee    ${Mobile}    @{amount}
    Capture Page Screenshot    Home page.png
    
To verify Ooredoo Fiber service provider
    [Arguments]    ${Mobile}    ${CustomerID}    ${CustomerName}    ${InvoiceNumber}    ${Amount}
    Wait Until Element Is Visible    ${Welcome}    10s
    Capture Page Screenshot    Home page.png
    #Tap    ${LocateInternet}
    Wait Until Element Is Visible    //XCUIElementTypeButton[@name="burger_button"]    30s
    Tap   //XCUIElementTypeButton[@name="burger_button"]
    Wait Until Element is visible  //XCUIElementTypeButton[@name="internet_button"]  5s
    Tap     //XCUIElementTypeButton[@name="internet_button"]
    Wait Until Element Is Visible    ${Ooredoo Fiber}
    Tap    ${Ooredoo Fiber}
    Wait Until Element Is Visible    ${BillerName}
    Input Text    ${LocateOoredooCustomerID}    ${CustomerID}
    Input Text    ${LocateOoredooCustomerName}    ${CustomerName}
    Input Text    ${LocateInvoice Number}    ${InvoiceNumber}
    Input Text    ${LocateInvoiceInputAmount}    ${Amount}
    Tap    //XCUIElementTypeButton[@name="Done"]
    Sleep    1s
    Tap    ${Next}
    Process Confirm not have fee    ${Mobile}
    
To validate insufficient balance of Ananda
    [Arguments]    ${Mobile}
    Wait Until Element Is Visible    ${Welcome}    10s
    Capture Page Screenshot    Home page.png
    #Tap    ${LocateInternet}
    #Wait Until Element Is Visible    ${Ananda}    10s
    Wait Until Element Is Visible    //XCUIElementTypeButton[@name="burger_button"]    30s
    Tap   //XCUIElementTypeButton[@name="burger_button"]
    Wait Until Element is visible  //XCUIElementTypeButton[@name="internet_button"]  5s
    Tap     //XCUIElementTypeButton[@name="internet_button"]
    wait until element is visible   ${Ananda}     3s
    Tap    ${Ananda}
    Wait Until Element Is Visible    ${Biller}
    @{amount} =  create list     ${Ananda20000}   ${Ananda10000}   ${Ananda5000}   ${Ananda35000}
    :FOR  ${i}  IN    @{amount}
    \   Tap    ${i}
    \   ${Status}=  Run Keyword And Return Status    Wait Until Element Is Visible    ${OKbutton}   10s
    \   ${MessageInsufficientBalance}    Run Keyword If    "${Status}"=="True"     Get Text    ${LocateInsufficientBalance}
    \   Tap    ${OKbutton}
    \   Should Be Equal    ${WordingInsufficientBalance}    ${MessageInsufficientBalance}
    Run Keyword If    "${Status}"=="False"     log to console     eLoad Insufficient Balance 
    Tap    ${CloseButton}
    Sleep    1s

    
To validate insufficient balance of Telenor fiber
    [Arguments]    ${Mobile}    ${Internetnumber}
    Wait Until Element Is Visible    ${Welcome}    10s
    Capture Page Screenshot    Home page.png
    #Tap    ${LocateInternet}
    Wait Until Element Is Visible    //XCUIElementTypeButton[@name="burger_button"]    30s
    Tap   //XCUIElementTypeButton[@name="burger_button"]
    Wait Until Element is visible  //XCUIElementTypeButton[@name="internet_button"]  5s
    Tap     //XCUIElementTypeButton[@name="internet_button"]
    Wait Until Element Is Visible    ${Telenor Fiber}
    Tap    ${Telenor Fiber}
    Wait Until Element Is Visible    ${Biller}
    Input Text    ${EditnumberTelenor}    ${Internetnumber}
    Tap    ${Next}
    Wait Until Element Is Visible    ${biller_name_button}
    Scroll    id=plan_title_label    ${biller_name_button}
    Tap    ${Next}
    Wait Until Element Is Visible    ${OKbutton}
    ${MessageInsufficientBalance}    Get Text    ${LocateInsufficientBalance}
    Should Be Equal    ${WordingInsufficientBalance}    ${MessageInsufficientBalance}
    Tap    ${OKbutton}
    Sleep    1s
    Tap    ${CloseButton}
    Sleep    1s
    
To validate insufficient balance of Telenor wireless
    [Arguments]    ${Mobile}    ${Internetnumber}
    Wait Until Element Is Visible    ${Welcome}    10s
    Capture Page Screenshot    Home page.png
    #Tap    ${LocateInternet}
    Wait Until Element Is Visible    //XCUIElementTypeButton[@name="burger_button"]    30s
    Tap   //XCUIElementTypeButton[@name="burger_button"]
    Wait Until Element is visible  //XCUIElementTypeButton[@name="internet_button"]  5s
    Tap     //XCUIElementTypeButton[@name="internet_button"]
    Wait Until Element Is Visible    ${Telenor Wireless}
    Tap    ${Telenor Wireless}
    Wait Until Element Is Visible    ${Biller}
    Input Text    ${EditnumberTelenor}    ${Internetnumber}
    Tap    ${Next}
    Wait Until Element Is Visible    ${biller_name_button}
    Scroll    id=plan_title_label    ${biller_name_button}
    Tap    ${Next}
    Wait Until Element Is Visible    ${OKbutton}
    ${MessageInsufficientBalance}    Get Text    ${LocateInsufficientBalance}
    Should Be Equal    ${WordingInsufficientBalance}    ${MessageInsufficientBalance}
    Tap    ${OKbutton}
    Sleep    1s
    Tap    ${CloseButton}
    Sleep    1s
    
To validate insufficient balance of Hi internet
    [Arguments]    ${Mobile}
    Wait Until Element Is Visible    ${Welcome}    10s
    Capture Page Screenshot    Home page.png
    #Tap    ${LocateInternet}
    Wait Until Element Is Visible    //XCUIElementTypeButton[@name="burger_button"]    30s
    Tap   //XCUIElementTypeButton[@name="burger_button"]
    Wait Until Element is visible  //XCUIElementTypeButton[@name="internet_button"]  5s
    Tap     //XCUIElementTypeButton[@name="internet_button"]
    Wait Until Element Is Visible    ${Hi Internet}
    Tap    ${Hi Internet}
    Wait Until Element Is Visible    ${Biller}    10s
    @{amount} =  create list     ${Ananda20000}   ${Ananda10000}   ${Ananda5000}
    :FOR  ${i}  IN    @{amount}
    \   Tap    ${i}
    \   ${Status}=  Run Keyword And Return Status    Wait Until Element Is Visible    ${OKbutton}   10s
    \   ${MessageInsufficientBalance}    Run Keyword If    "${Status}"=="True"     Get Text    ${LocateInsufficientBalance}
    \   Tap    ${OKbutton}
    \   Should Be Equal    ${WordingInsufficientBalance}    ${MessageInsufficientBalance}
    Run Keyword If    "${Status}"=="False"     log to console     eLoad Insufficient Balance 
    Sleep    1s
    Tap    ${CloseButton}
    Sleep    1s

To validate insufficient balance of MyanmarNet Prepaid
    [Arguments]    ${Mobile}
    Wait Until Element Is Visible    ${Welcome}    10s
    Capture Page Screenshot    Home page.png
    #Tap    ${LocateInternet}
    Wait Until Element Is Visible    //XCUIElementTypeButton[@name="burger_button"]    30s
    Tap   //XCUIElementTypeButton[@name="burger_button"]
    Wait Until Element is visible  //XCUIElementTypeButton[@name="internet_button"]  5s
    Tap     //XCUIElementTypeButton[@name="internet_button"]
    Wait Until Element Is Visible    ${MyanmarNet Prepaid}
    Tap    ${MyanmarNet Prepaid}
    Wait Until Element Is Visible    ${Biller}    10s
    @{amount} =  create list     ${MyanmarNetPrepaid1000}   ${MyanmarNetPrepaid3000}   ${MyanmarNetPrepaid5000}    ${MyanmarNetPrepaid10000}
    :FOR  ${i}  IN    @{amount}
    \   Tap    ${i}
    \   ${Status}=  Run Keyword And Return Status    Wait Until Element Is Visible    ${OKbutton}   10s
    \   ${MessageInsufficientBalance}    Run Keyword If    "${Status}"=="True"     Get Text    ${LocateInsufficientBalance}
    \   Tap    ${OKbutton}
    \   Should Be Equal    ${WordingInsufficientBalance}    ${MessageInsufficientBalance}
    Run Keyword If    "${Status}"=="False"     log to console     eLoad Insufficient Balance 
    Tap    ${CloseButton}
    Sleep    1s
    
To validate insufficient balance of MyanmarNet Data
    [Arguments]    ${Mobile}
    Wait Until Element Is Visible    ${Welcome}    10s
    Capture Page Screenshot    Home page.png
    #Tap    ${LocateInternet}
    Wait Until Element Is Visible    //XCUIElementTypeButton[@name="burger_button"]    30s
    Tap   //XCUIElementTypeButton[@name="burger_button"]
    Wait Until Element is visible  //XCUIElementTypeButton[@name="internet_button"]  5s
    Tap     //XCUIElementTypeButton[@name="internet_button"]
    Wait Until Element Is Visible    ${MyanmarNet Data}
    Tap    ${MyanmarNet Data}
    Wait Until Element Is Visible    ${Biller}    10s
    @{amount} =  create list     ${MyanmarNet Data1000}   ${MyanmarNet Data5000}
    :FOR  ${i}  IN    @{amount}
    \   Tap    ${i}
    \   ${Status}=  Run Keyword And Return Status    Wait Until Element Is Visible    ${OKbutton}   10s
    \   ${MessageInsufficientBalance}    Run Keyword If    "${Status}"=="True"     Get Text    ${LocateInsufficientBalance}
    \   Tap    ${OKbutton}
    \   Should Be Equal    ${WordingInsufficientBalance}    ${MessageInsufficientBalance}
    Run Keyword If    "${Status}"=="False"     log to console     eLoad Insufficient Balance 
    Tap    ${CloseButton}
    Sleep    1s
    
To validate insufficient balance of MyanmarNet A-Wa-Thone
    [Arguments]    ${Mobile}
    Wait Until Element Is Visible    ${Welcome}    10s
    Capture Page Screenshot    Home page.png
    #Tap    ${LocateInternet}
    Wait Until Element Is Visible    //XCUIElementTypeButton[@name="burger_button"]    30s
    Tap   //XCUIElementTypeButton[@name="burger_button"]
    Wait Until Element is visible  //XCUIElementTypeButton[@name="internet_button"]  5s
    Tap     //XCUIElementTypeButton[@name="internet_button"]
    Wait Until Element Is Visible    ${MyanmarNet A-Wa-Thone}
    Tap    ${MyanmarNet A-Wa-Thone}
    Wait Until Element Is Visible    ${Biller}    10s
    @{amount} =  create list     ${MyanmarNet A-Wa-Thone1000}   ${MyanmarNet A-Wa-Thone1000}
    :FOR  ${i}  IN    @{amount}
    \   Tap    ${i}
    \   ${Status}=  Run Keyword And Return Status    Wait Until Element Is Visible    ${OKbutton}   10s
    \   ${MessageInsufficientBalance}    Run Keyword If    "${Status}"=="True"     Get Text    ${LocateInsufficientBalance}
    \   Tap    ${OKbutton}
    \   Should Be Equal    ${WordingInsufficientBalance}    ${MessageInsufficientBalance}
    Run Keyword If    "${Status}"=="False"     log to console     eLoad Insufficient Balance 
    Tap    ${CloseButton}
    Sleep    1s
    
To validate insufficient balance of Ooredoo fiber
    [Arguments]    ${Mobile}    ${CustomerID}    ${CustomerName}    ${InvoiceNumber}    ${Amount}
    Wait Until Element Is Visible    ${Welcome}    10s
    Capture Page Screenshot    Home page.png
    #Tap    ${LocateInternet}
    Wait Until Element Is Visible    //XCUIElementTypeButton[@name="burger_button"]    30s
    Tap   //XCUIElementTypeButton[@name="burger_button"]
    Wait Until Element is visible  //XCUIElementTypeButton[@name="internet_button"]  5s
    Tap     //XCUIElementTypeButton[@name="internet_button"]
    Wait Until Element Is Visible    ${Ooredoo Fiber}
    Tap    ${Ooredoo Fiber}
    Wait Until Element Is Visible    ${BillerName}
    Input Text    ${LocateOoredooCustomerID}    ${CustomerID}
    Input Text    ${LocateOoredooCustomerName}    ${CustomerName}
    Input Text    ${LocateInvoice Number}    ${InvoiceNumber}
    Input Text    ${LocateInvoiceInputAmount}    ${Amount}
    Tap    //XCUIElementTypeButton[@name="Done"]
    Sleep    1s
    Tap    ${Next}
    Wait Until Element Is Visible    ${OKbutton}
    ${MessageInsufficientBalance}    Get Text    ${LocateInsufficientBalance}
    Should Be Equal    ${WordingInsufficientBalance}    ${MessageInsufficientBalance}
    Tap    ${OKbutton}
    Sleep    1s
    Tap    ${CloseButton}
    Sleep    1s

To validate Wrong number Telenor Fiber
    Wait Until Element Is Visible    ${Welcome}    10s
    Capture Page Screenshot    Home page.png
    Wait Until Element Is Visible    ${Hamburgerbtn}    30s
    Tap   ${Hamburgerbtn}
    Wait Until Element is visible  ${haminternet}   5s
    # click internet menu
    Tap     ${haminternet}
    Wait Until Element Is Visible    ${Telenor Fiber}
    Tap    ${Telenor Fiber}
    Wait Until Element Is Visible    ${Biller}   4s
    # input invalid viber out number
    Input Text    ${EditnumberTelenor}    0911447709
    Tap    ${Next}
    wait until element is visible  ${errormsg}    10s
    ${geterrormsg}   get text   ${errormsg}
    # verify error message
    ${check}    run keyword and return status  should be equal    ${geterrormsg}    ${interneterror}
    run keyword if  ${check}    log to console   number is incorrect
    tap   ${popupokbtn}
    wait until element is visible  ${intcrossbtn}    4s
    tap   ${intcrossbtn}
    # close  internet page
    wait until element is visible  ${scrolltop}    4s
    scroll   ${scrolltop}     ${scrolldown}

To validate internet by selecting mobile number from phonebook
    Wait Until Element Is Visible    ${Welcome}    10s
    Capture Page Screenshot    Home page.png
    Wait Until Element Is Visible    ${Hamburgerbtn}    30s
    #click on hamburger menu
    Tap   ${Hamburgerbtn}
    Wait Until Element is visible  ${haminternet}  5s
    #click on internet menu
    Tap     ${haminternet}
    Wait Until Element Is Visible    ${Telenor Wireless}
    #click on telenor wireless biller
    Tap    ${Telenor Wireless}
    Wait Until Element Is Visible    ${internetphonebook}
    #click on phonebook icoon
    Tap    ${internetphonebook}
     #check for the permission popup
    ${popup}   run keyword and return status  wait until element is visible  ${accesspopup}   5s
    run keyword if  ${popup}     tap    ${popupok}
    wait until element is visible   ${internetbookno}   4s
    #select the telenor wireless number
    Tap    ${internetbookno}
    wait until element is visible  ${Next}   5s
    #click on next button on telenor wireless page
    Tap    ${Next}
    Wait Until Element Is Visible    ${biller_name_button}
    #scroll the telenor wireless detail page
    Scroll    id=plan_title_label    ${biller_name_button}
    #click on next button on telenor wireless detail page
    Tap    ${Next}
    Wait Until Element Is Visible    ${LocateAmountConfirm}
    Scroll    id=receiver_name_label    ${LocateAmountConfirm}
    wait until element is visible    ${LocateConfirmButton}   4s
    #click on confirm button on confirmation page
    Tap    ${LocateConfirmButton}
    sleep   4s
    #enter passcode
    ENTER PASSCODE
    Allow Permission
    Wait Until Element Is Visible    ${LocateSuccess}    10s
    Scroll    ${LocateSucccessBiller}    ${LocateSuccess}
    wait until element is visible   ${BackToHome}   10s
    #click on back to home button on success page
    Tap    ${BackToHome}

    