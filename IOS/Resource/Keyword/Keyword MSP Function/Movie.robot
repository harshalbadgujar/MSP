*** Settings ***
Library    AppiumLibrary
Library    String
Library	   OperatingSystem
Resource    ../Global Keyword.robot
Resource    ../Connect to DB/db.robot
Resource    ../../Locator/Homepage.resource
Resource    ../../Locator/MovieMenu.resource
Resource    ../../Locator/Insufficient Balance.resource

*** Keywords ***

To verify that Canal+ Package Renewal functionliaty
    [Arguments]    ${Mobile}    ${CardNumber}
    Wait Until Element Is Visible    ${Welcome}    10s
    #Tap    ${LocateMovie}
    Wait Until Element Is Visible    //XCUIElementTypeButton[@name="burger_button"]    30s
    Tap   //XCUIElementTypeButton[@name="burger_button"]
    Wait Until Element is visible  //XCUIElementTypeButton[@name="movie_button"]  5s
    Tap     //XCUIElementTypeButton[@name="movie_button"]
    Wait Until Element Is Visible    ${Canal+}
    Tap    ${Canal+}
    Wait Until Element Is Visible    ${BillerNameMovie}
    Tap    ${SelectPacket Renewal}   
    Input Text    ${LocateMovieCardNumber}    ${CardNumber}  
    Tap    xpath=//XCUIElementTypeButton[@name="Done"]
    Tap    ${MovieNextButton}
    Process Confirm not Equal (Movie)    ${Mobile}
    
To verify that Canal+ Package Upgrade functionliaty
    [Arguments]    ${Mobile}    ${CardNumber}
    Wait Until Element Is Visible    ${Welcome}    10s
    #Tap    ${LocateMovie}
    Wait Until Element Is Visible    //XCUIElementTypeButton[@name="burger_button"]    30s
    Tap   //XCUIElementTypeButton[@name="burger_button"]
    Wait Until Element is visible  //XCUIElementTypeButton[@name="movie_button"]  5s
    Tap     //XCUIElementTypeButton[@name="movie_button"]
    Wait Until Element Is Visible    ${Canal+}
    Tap    ${Canal+}
    Wait Until Element Is Visible    ${BillerNameMovie}
    Tap    ${SelectPacket Upgarde} 
    Input Text    ${LocateMovieCardNumber}    ${CardNumber}  
    Tap    xpath=//XCUIElementTypeButton[@name="Done"]
    Tap    ${MovieNextButton}
    Wait Until Page Does Not Contain Element    id=loading_actInd
    Tap    ${MovieNextButton}
    Process Confirm not Equal (Movie)    ${Mobile}

To verify that Viu functionliaty
    [Arguments]    ${Mobile}
    Wait Until Element Is Visible    ${Welcome}    10s
    Capture Page Screenshot    Home page.png
    #Tap    ${LocateMovie}
    Wait Until Element Is Visible    //XCUIElementTypeButton[@name="burger_button"]    30s
    Tap   //XCUIElementTypeButton[@name="burger_button"]
    Wait Until Element is visible  //XCUIElementTypeButton[@name="movie_button"]  5s
    Tap     //XCUIElementTypeButton[@name="movie_button"]
    Wait Until Element Is Visible    ${VIU}
    Tap    ${VIU}
    Wait Until Element Is Visible    ${BillerNameMovie}
    @{amount} =  create list     ${VIU1500MMK}   ${VIU5000MMK}   ${VIU12000MMK}    ${VIU40000MMK}
    Check Out of Stock Not have Fee Not Equel(Movie)    ${Mobile}    @{amount}
    Capture Page Screenshot    Home page.png

To verify that Mahar Mobile functionliaty
    [Arguments]    ${Mobile}
    Wait Until Element Is Visible    ${Welcome}    10s
    Capture Page Screenshot    Home page.png
    #Tap    ${LocateMovie}
    Wait Until Element Is Visible    //XCUIElementTypeButton[@name="burger_button"]    30s
    Tap   //XCUIElementTypeButton[@name="burger_button"]
    Wait Until Element is visible  //XCUIElementTypeButton[@name="movie_button"]  5s
    Tap     //XCUIElementTypeButton[@name="movie_button"]
    Wait Until Element Is Visible    ${Mahar Mobile}
    Tap    ${Mahar Mobile}
    Wait Until Element Is Visible    ${BillerNameMovie}
    @{amount} =  create list     ${MaharMobile1999MMK}
    Check Out of Stock Not have Fee Not Equel(Movie)    ${Mobile}    @{amount}
    Tap    ${CloseButton}
    Sleep     1s
    Tap    ${CloseMovie}
    Capture Page Screenshot    Home page.png
   
To verify that La La Kyi functionliaty
    [Arguments]    ${Mobile}
    Wait Until Element Is Visible    ${Welcome}    10s
    Capture Page Screenshot    Home page.png
    #Tap    ${LocateMovie}
    Wait Until Element Is Visible    //XCUIElementTypeButton[@name="burger_button"]    30s
    Tap   //XCUIElementTypeButton[@name="burger_button"]
    Wait Until Element is visible  //XCUIElementTypeButton[@name="movie_button"]  5s
    Tap     //XCUIElementTypeButton[@name="movie_button"]
    Wait Until Element Is Visible    ${La La Kyi ePin}
    Tap    ${La La Kyi ePin}
    Wait Until Element Is Visible    ${BillerNameMovie}
    @{amount} =  create list     ${La La Kyi ePin500MMK}    ${La La Kyi ePin500MMK}
    Check Out of Stock Not have Fee Not Equel(Movie)    ${Mobile}    @{amount}
    Capture Page Screenshot    Home page.png
    
To verify Canal+ Package Renewal with insufficient balance
    [Arguments]    ${Mobile}    ${CardNumber}
    Wait Until Element Is Visible    ${Welcome}    10s
    #Tap    ${LocateMovie}
    Wait Until Element Is Visible    //XCUIElementTypeButton[@name="burger_button"]    30s
    Tap   //XCUIElementTypeButton[@name="burger_button"]
    Wait Until Element is visible  //XCUIElementTypeButton[@name="movie_button"]  5s
    Tap     //XCUIElementTypeButton[@name="movie_button"]
    Wait Until Element Is Visible    ${Canal+}
    Tap    ${Canal+}
    Wait Until Element Is Visible    ${BillerNameMovie}
    Tap    ${SelectPacket Renewal}   
    Input Text    ${LocateMovieCardNumber}    ${CardNumber}  
    Tap    xpath=//XCUIElementTypeButton[@name="Done"]
    Tap    ${MovieNextButton}
    Process Confirm Insufficient Balance    ${Mobile}
    Sleep    1s
    
To verify Canal+ Package Upgrade with insufficient balance
    [Arguments]    ${Mobile}    ${CardNumber}
    Wait Until Element Is Visible    ${Welcome}    10s
    #Tap    ${LocateMovie}
    Wait Until Element Is Visible    //XCUIElementTypeButton[@name="burger_button"]    30s
    Tap   //XCUIElementTypeButton[@name="burger_button"]
    Wait Until Element is visible  //XCUIElementTypeButton[@name="movie_button"]  5s
    Tap     //XCUIElementTypeButton[@name="movie_button"]
    Wait Until Element Is Visible    ${Canal+}
    Tap    ${Canal+}
    Wait Until Element Is Visible    ${BillerNameMovie}
    Tap    ${SelectPacket Upgarde} 
    Input Text    ${LocateMovieCardNumber}    ${CardNumber}  
    Tap    xpath=//XCUIElementTypeButton[@name="Done"]
    Tap    ${MovieNextButton}
    Wait Until Page Does Not Contain Element    id=loading_actInd
    Tap    ${MovieNextButton}
    Process Confirm Insufficient Balance    ${Mobile}
    Sleep    1s
    
To verify VIU with insufficient balance
    [Arguments]    ${Mobile}
    Wait Until Element Is Visible    ${Welcome}    10s
    Capture Page Screenshot    Home page.png
    #Tap    ${LocateMovie}
    Wait Until Element Is Visible    //XCUIElementTypeButton[@name="burger_button"]    30s
    Tap   //XCUIElementTypeButton[@name="burger_button"]
    Wait Until Element is visible  //XCUIElementTypeButton[@name="movie_button"]  5s
    Tap     //XCUIElementTypeButton[@name="movie_button"]
    Wait Until Element Is Visible    ${VIU}
    Tap    ${VIU}
    Wait Until Element Is Visible    ${BillerNameMovie}
    @{amount} =  create list     ${VIU1500MMK}   ${VIU5000MMK}   ${VIU12000MMK}    ${VIU40000MMK}
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

To verify Mahar mobile with insufficient balance
    [Arguments]    ${Mobile}
    Wait Until Element Is Visible    ${Welcome}    10s
    Capture Page Screenshot    Home page.png
    #Tap    ${LocateMovie}
    Wait Until Element Is Visible    //XCUIElementTypeButton[@name="burger_button"]    30s
    Tap   //XCUIElementTypeButton[@name="burger_button"]
    Wait Until Element is visible  //XCUIElementTypeButton[@name="movie_button"]  5s
    Tap     //XCUIElementTypeButton[@name="movie_button"]
    Wait Until Element Is Visible    ${Mahar Mobile}
    Tap    ${Mahar Mobile}
    Wait Until Element Is Visible    ${BillerNameMovie}
    @{amount} =  create list     ${MaharMobile1999MMK}
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
   
To verify La La Kyi with insufficient balance
    [Arguments]    ${Mobile}
    Wait Until Element Is Visible    ${Welcome}    10s
    Capture Page Screenshot    Home page.png
    #Tap    ${LocateMovie}
    Wait Until Element Is Visible    //XCUIElementTypeButton[@name="burger_button"]    30s
    Tap   //XCUIElementTypeButton[@name="burger_button"]
    Wait Until Element is visible  //XCUIElementTypeButton[@name="movie_button"]  5s
    Tap     //XCUIElementTypeButton[@name="movie_button"]
    Wait Until Element Is Visible    ${La La Kyi ePin}
    Tap    ${La La Kyi ePin}
    Wait Until Element Is Visible    ${BillerNameMovie}
    @{amount} =  create list     ${La La Kyi ePin500MMK}    ${La La Kyi ePin500MMK}
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