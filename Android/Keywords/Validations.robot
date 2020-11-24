*** Settings ***
Resource     ../Setting.robot
*** Variable ***
${Invalid_Number} =     999999999
${valid_Number} =       091254904
${eLoad_Number} =       09964233241
${Gift_MobileP_No} =    09450002831
*** Keywords ***
Validation.Login to MSP for Validation with Minimum Balance wallet
    Open Application
    ...    http://localhost:4723/wd/hub
    ...    alias=Myapp1
    ...    platformName=Android
    ...    deviceName=MA
    ...    appPackage=com.ccpp.msp.uat
    ...    appActivity=com.ccpp.msp.Launcher
    Allow_Pop-up
    ${Skip}=  Run Keyword And Return Status    Wait Until Element Is Visible    ${Skipbtn}    10s
    Run Keyword If    ${Skip}   Tap  ${Skipbtn}
    Wait Until Element Is Visible    ${Registerbtn}  30s
    Tap    ${SignInBtn}
Validation.To verify Wrong_Mobile Number for login
    Wait Until Element Is Visible    ${Enter_Mo_text}   30s
    Input Text    ${Mo_TextToEnter}    ${Invalid_Number}
    Tap    ${SignInCnf}
    Wait Until Element Is Visible    ${Val_Popup}     30s
    ${Mo_Popup_Header} =   Get Text    ${Val_Popup}
    ${Wrong_NumText} =     Get Text    ${Val_Msg}
    Log to console     Wrong_Mobile Number=${Mo_Popup_Header}
    Log to console     Wrong_Mobile Number=${Wrong_NumText}
    Tap  ${Val_Okbtn}
    Clear Text    ${Mo_TextToEnter}
    Input Text    ${Mo_TextToEnter}    ${valid_Number}
    Tap    ${SignInCnf}
Validation.To verify Wrong Passcode for login
    Wait Until Element Is Visible    ${EnterPass}  60s
    Tap    ${Wrong_Pass}
    Tap    ${Wrong_Pass}
    Tap    ${Wrong_Pass}
    Tap    ${Wrong_Pass}
    Tap    ${Wrong_Pass}
    Tap    ${Wrong_Pass}
    Wait Until Element Is Visible    ${Val_Popup}     30s
    ${Pass_Popup_Header} =   Get Text    ${Val_Popup}
    ${Wrong_Passcode} =   Get Text    ${Val_Msg}
    Log to console   Wrong Passcode=${Pass_Popup_Header}
    Log to console   Wrong Passcode=${Wrong_Passcode}
    Tap  ${Val_Okbtn}
    ENTER PASSCODE
Validation.To verify Phone number from phonebook for transfer
   Wait Until Element Is Visible    ${TransferButton}  30s
   Tap    ${TransferButton}
    Wait Until Element Is Visible    ${MSP}  30s
    Tap    ${Trans_Contact}
    Allow_Pop-up
    Wait Until Element Is Visible    ${MCT}  30s
    Tap   ${MCT}
Validation.To verify insufficient Balance of Transfer
    Wait Until Element Is Visible    ${MMK}  20s
    Input Text    ${Amount}    222222
    Input Text    ${Note}    Robot Test
    Swipe	1046	1643	593	 1003	2000
    Tap    ${Next}
    Wait Until Element Is Visible    ${Val_Popup}    30s
    ${Insuff_Popup_Header} =   Get Text    ${Val_Popup}
    ${Insufficient_Bal} =   Get Text    ${Val_Msg}
    Log to console   Transfer=${Insuff_Popup_Header}
    Log to console  Transfer=${Insufficient_Bal}
    Tap  ${Val_Okbtn}
Validation.To verify Phone number from phonebook for eload
    Wait Until Element Is Visible    ${Val_Eload}  30s
    Tap    ${Val_Eload}
    Wait Until Element Is Visible    ${Eload_Icn}  30s
    Tap    ${Trans_Contact}
    Allow_Pop-up
    Wait Until Element Is Visible    ${Elodnum}  30s
    Tap   ${Elodnum}
Validation.To verify Eload Insufficient Balance
    Wait Until Element Is Visible    ${CDP}  30s
    Tap    ${Tap30000}
     Wait Until Element Is Visible    ${Val_Popup}     30s
    ${Eload_Popup_Header} =   Get Text    ${Val_Popup}
    ${Insufficient_Bal_Eload} =   Get Text    ${Val_Msg}
    Log to console   Eload=${Eload_Popup_Header}
    Log to console   Eload=${Insufficient_Bal_Eload}
    Tap  ${Val_Okbtn}
Validation.To verify Eload data package Insufficient Balance
    Wait Until Element Is Visible    ${TransferButton}  40s
    Tap    ${Val_Eload}
    Wait Until Element Is Visible    ${Eload_Icn}
    sleep  2s
    Input Text    ${Mobile_Number}    ${eLoad_Number}
    sleep  2s
    Wait Until Element Is Visible    ${Tap999}  30s
    Tap    ${Tap999}
     Wait Until Element Is Visible    ${Val_Popup}     30s
    ${Eload_Popup_Header} =   Get Text    ${Val_Popup}
    ${Insufficient_Bal_Eload} =   Get Text    ${Val_Msg}
    Log to console   Eload DataPack=${Eload_Popup_Header}
    Log to console   Eload Datapack=${Insufficient_Bal_Eload}
    Tap  ${Val_Okbtn}
Validation.To verify wrong number of biller for Eload functionlaity
    Wait Until Element Is Visible    ${TransferButton}  40s
    Tap    ${Val_Eload}
    Input Text    ${Mobile_Number}   123
    Tap    ${Tap30000}
    Wait Until Element Is Visible    ${Val_Popup}     30s
    ${Eload_Popup_Header} =   Get Text    ${Val_Popup}
    ${Insufficient_Bal_Eload} =   Get Text    ${Val_Msg}
    Log to console   Eload Wrong Biller=${Eload_Popup_Header}
    Log to console   Eload Wrog Biller=${Insufficient_Bal_Eload}
    Tap  ${Val_Okbtn}
    sleep  2s
    Press Keycode                 4
Validation.To verify Gift Insufficient Balance of iTune
    Wait Until Element Is Visible    ${Val_GiftIcon}  30s
    Tap    ${Val_GiftIcon}
    Wait Until Element Is Visible    ${Val_gift_icn}   30s
    Tap    ${Val_Itunes}
    Wait Until Element Is Visible    ${Val_Itunes}  30s
    Tap    ${Tap100}
    sleep  2s
    Wait Until Element Is Visible    ${Val_Conf}   30s
    Tap  ${Val_Conf}
     Wait Until Element Is Visible    ${Val_Popup}     30s
    ${GIft_Popup_Header} =   Get Text    ${Val_Popup}
    ${Insufficient_Bal_Gift} =   Get Text    ${Val_Msg}
    Log to console   Gift iTune=${GIft_Popup_Header}
    Log to console   Gift iTune=${Insufficient_Bal_Gift}
    Tap  ${Val_Okbtn}
     Wait Until Element Is Visible    ${Add_page}  60s
    ${Get_Balance} =   Get Text    ${Val_WBal}
    Log to console   ${Get_Balance}
    Swipe  600   744   147   1654
Validation.To verify Gift Insufficient Balance of ViberOut by entering number
    Wait Until Element Is Visible    ${Val_GiftIcon}  30s
    Tap    ${Val_GiftIcon}
    Wait Until Element Is Visible    ${Val_gift_icn}   30s
    Tap    ${Val_Viber}
    Wait Until Element Is Visible    ${Val_Viber}  30s
    Tap    ${Tap1}
    Input Text    ${Mobile_Number}     ${Gift_MobileP_No}
    Tap   ${Next}
    Wait Until Element Is Visible    ${Val_Conf}   30s
    Tap  ${Val_Conf}
    Wait Until Element Is Visible    ${Val_Popup}     30s
    ${GIft_Popup_Viberout} =   Get Text    ${Val_Popup}
    ${Insufficient_Bal_Viber} =   Get Text    ${Val_Msg}
    Log to console   Gift ViberOut=${GIft_Popup_Viberout}
    Log to console   Gift ViberOut=${Insufficient_Bal_Viber}
    Tap  ${Val_Okbtn}
     Wait Until Element Is Visible    ${Add_page}  60s
    ${Get_Balance_Viber} =   Get Text    ${Val_WBal}
    Log to console   ${Get_Balance_Viber}
    Swipe  600   744   147   1654
Validation.To verify Gift Insufficient Balance of Vakkok
    Wait Until Element Is Visible    ${Val_GiftIcon}  30s
    Tap    ${Val_GiftIcon}
    Wait Until Element Is Visible    ${Val_gift_icn}   30s
    Tap    ${val_vakok}
    Wait Until Element Is Visible    ${val_vakok}  30s
    Tap    ${Val_Tap3000}
    Wait Until Element Is Visible    ${Val_Popup}     30s
    ${GIft_Popup_Vakkok} =   Get Text    ${Val_Popup}
    ${Insufficient_Bal_Vakok} =   Get Text    ${Val_Msg}
    Log to console  Gift Vakkok=${GIft_Popup_Vakkok}
    Log to console  Gift Vakkok=${Insufficient_Bal_Vakok}
    Tap  ${Val_Okbtn}
    Wait Until Element Is Visible    ${val_vakok}  30s
    Swipe  600   744   147   1654
Validation.To verify Gift Insufficient Balance of EasyPoint
    Wait Until Element Is Visible    ${Val_GiftIcon}  30s
    Tap    ${Val_GiftIcon}
    Wait Until Element Is Visible    ${Val_gift_icn}   30s
    Tap    ${Val_EP}
    Wait Until Element Is Visible    ${Val_tap2000}   30s
    Tap  ${Val_tap2000}
    Tap   ${Next}
    Wait Until Element Is Visible    ${Val_Popup}     30s
    ${GIft_Popup_EasyPoint} =   Get Text    ${Val_Popup}
    ${Insufficient_Bal_EasyPoint} =   Get Text    ${Val_Msg}
    Log to console   EasyPoint=${GIft_Popup_EasyPoint}
    Log to console   EasyPoint=${Insufficient_Bal_EasyPoint}
    Tap  ${Val_Okbtn}
    Wait Until Element Is Visible    ${Val_EP}  10s
    Press Keycode                 4
Validation.To verify Gift Insufficient Balance of GooglePlay
    Wait Until Element Is Visible    ${Val_GiftIcon}  30s
    Tap    ${Val_GiftIcon}
    Wait Until Element Is Visible    ${Val_gift_icn}   30s
    Tap    ${Val_GP}
    Wait Until Element Is Visible    ${Val_tap100}   30s
    Tap  ${Val_tap100}
    #Tap   ${Next}
    Wait Until Element Is Visible    ${CheckBox}   30s
    Tap   ${CheckBox}
    Tap   ${Val_GP_Nxt}
    Wait Until Element Is Visible    ${Next}    30s
    Tap    ${Next}
    Wait Until Element Is Visible    ${Val_Popup}     30s
    ${GIft_Popup_GooglePlay} =   Get Text    ${Val_Popup}
    ${Insufficient_Bal_GooglePlay} =   Get Text    ${Val_Msg}
    Log to console   GooglePlay=${GIft_Popup_GooglePlay}
    Log to console   GooglePlay=${Insufficient_Bal_GooglePlay}
    Tap  ${Val_Okbtn}
    sleep  2s
    Wait Until Element Is Visible    ${CheckBox}    30s
    Tap    ${VAlTranbackcheck}
    Wait Until Element Is Visible    ${Val_GP}   10s
    Press Keycode                 4
Validation.To verify Gift Insufficient Balance of Steamwallet
    Wait Until Element Is Visible    ${Val_GiftIcon}  30s
    Tap    ${Val_GiftIcon}
    Wait Until Element Is Visible    ${Val_gift_icn}   30s
    Tap    ${Val_Stem}
    Wait Until Element Is Visible    ${val_tap50}   30s
    Tap  ${val_tap50}
    Wait Until Element Is Visible    ${Val_Conf}    30s
    Tap    ${Val_Conf}
    Wait Until Element Is Visible    ${Val_Popup}     30s
    ${GIft_Popup_Steamwallet} =   Get Text    ${Val_Popup}
    ${Insufficient_Bal_Steamwallet} =   Get Text    ${Val_Msg}
    Log to console   Steamwallet ${GIft_Popup_Steamwallet}
    Log to console   Steamwallet ${Insufficient_Bal_Steamwallet}
    Tap  ${Val_Okbtn}
    Wait Until Element Is Visible    ${Add_page}  10s
    Press Keycode                 4
Validation.To verify Insufficient Balance Ananda internet service
    Tap    ${Internet_btn}
    Wait Until Element Is Visible    ${Ananda}  30s
    Tap  ${Ananda}    30
    Wait Until Element Is Visible    ${Ananda}  30s
    Tap  ${Val_tap5000}
    Wait Until Element Is Visible    ${Val_Popup}     30s
    ${Popup_Ananda} =   Get Text    ${Val_Popup}
    ${Insuff_Bal_Ananda} =   Get Text    ${Val_Msg}
    Log to console  Ananda=${Popup_Ananda}
    Log to console  Ananda=${Insuff_Bal_Ananda}
    Tap  ${Val_Okbtn}
    Wait Until Element Is Visible    ${Ananda}  30s
    Press Keycode                 4
Validation.To verify Insufficient Balance for Telenor Fiber internet service
    Wait Until Element Is Visible    ${TransferButton}  10
    Tap    ${Internet_btn}
    Wait Until Element Is Visible    ${Telenor_Fiber}  30s
    Tap  ${Telenor_Fiber}    30
    Wait Until Element Is Visible    ${Telenor_Fiber}  30s
    Input text  ${Mobile_Number}    09791001059
    Tap   ${NextBtn}
    Wait Until Element Is Visible    ${CustomerAmt}  30s
    ${Telenor} =   Get text  ${CustomerAmt}
    Log to console   ${Telenor}
    Swipe   52  1607  60  1381  4000
    Tap     ${NextBtn}  30s
    ${Popup_Telenor_Fiber} =   Get Text    ${Val_Popup}
    ${Insuff_Bal_Telenor_Fiber} =   Get Text    ${Val_Msg}
    Log to console   Telenor Fiber=${Popup_Telenor_Fiber}
    Log to console   Telenor Fiber=${Insuff_Bal_Telenor_Fiber}
    Tap  ${Val_Okbtn}
    Wait Until Element Is Visible    ${CustomerAmt}   30s
    Press Keycode                 4
Validation.To verify Telenor Fiber Number from Phonebook
    Wait Until Element Is Visible    ${TransferButton}  10
    Tap    ${Internet_btn}
    Wait Until Element Is Visible    ${Telenor_Fiber}  30s
    Tap  ${Telenor_Fiber}    30
    Wait Until Element Is Visible    ${Telenor_Fiber}  30s
    Tap    ${Trans_Contact}
    Allow_Pop-up
    Wait Until Element Is Visible    ${Telenor_Fiber}  30s
    Tap   ${Telenor_Fiber}
    Wait Until Element Is Visible    ${NextBtn}   30s
    Tap   ${NextBtn}
    Wait Until Element Is Visible    ${CustomerAmt}  30s
    Press Keycode                 4
Validation.To verify Insufficient Balance Hi Internet
    Wait Until Element Is Visible    ${TransferButton}  10
    Tap    ${Internet_btn}
    Wait Until Element Is Visible    ${Hi_Internet}  30s
    Tap  ${Hi_Internet}    30
    Wait Until Element Is Visible    ${Hi_Internet}  30s
    Tap  ${Val_tap1500}
    Wait Until Element Is Visible    ${Val_Popup}     30s
    ${Popup_HiInternet} =   Get Text    ${Val_Popup}
    ${Insuff_Bal_HiInternet} =   Get Text    ${Val_Msg}
    Log to console   Hi Internet=${Popup_HiInternet}
    Log to console   Hi Internet=${Insuff_Bal_HiInternet}
    Tap  ${Val_Okbtn}
    Wait Until Element Is Visible    ${Hi_Internet}  30s
    Press Keycode                 4
Validation.To verify Insufficient Balance MyanmarNet Prepaid
   Wait Until Element Is Visible    ${TransferButton}  10
    Tap    ${Internet_btn}
    Wait Until Element Is Visible    ${Mynmr_int}  30s
    Tap  ${Mynmr_int}    30
    Wait Until Element Is Visible    ${Mynmr_int}  30s
    Tap  ${Val_tap1000}
    Wait Until Element Is Visible    ${Val_Popup}     30s
    ${GIft_Popup_Vakkok} =   Get Text    ${Val_Popup}
    ${Insufficient_Bal_Vakok} =   Get Text    ${Val_Msg}
    Log to console   MyanmarNet Prepaid=${GIft_Popup_Vakkok}
    Log to console   MyanmarNet Prepaid=${Insufficient_Bal_Vakok}
    Tap  ${Val_Okbtn}
    Wait Until Element Is Visible    ${Mynmr_int}  30s
    Press Keycode                 4
Validation.To verify Insufficient Balance MyanmarNet Ooredoo Fiber
    Wait Until Element Is Visible    ${TransferButton}  10
    Tap    ${Internet_btn}
    Wait Until Element Is Visible    ${Ooredo}  30s
    Tap  ${Ooredo}    30
    Wait Until Element Is Visible    ${Ooredo}  30s
    Input text  ${CustomerId}    1231
    Input text  ${CustomerNm}    harshal badgujar
    Input text  ${CustomerInvc}    54321777
    Input text  ${CustomerAmt}    6,000
    Tap  ${NextBtn}
    ${GIft_Popup_Vakkok} =   Get Text    ${Val_Popup}
    ${Insufficient_Bal_Vakok} =   Get Text    ${Val_Msg}
    Log to console   MyanmarNet Ooredoo Fiber=${GIft_Popup_Vakkok}
    Log to console   MyanmarNet Ooredoo Fiber=${Insufficient_Bal_Vakok}
    Tap  ${Val_Okbtn}
    Wait Until Element Is Visible    ${Ooredo}  30s
    Press Keycode                 4
Validation.To verify Insufficient Balance Canal+ Package
    Wait Until Element Is Visible    ${WaitMBtn}   10s
    Tap    ${WaitMBtn}
    Wait Until Element Is Visible    ${Micon}  10
    Tap  ${canalicon}    30
    Input Text  ${CanalTextB}    014502763789
    Tap   ${CanalNext}
    Wait Until Element Is Visible    ${Val_Conf}  10s
    Tap  ${Val_Conf}
    ${GIft_Popup_Vakkok} =   Get Text    ${Val_Popup}
    ${Insufficient_Bal_Vakok} =   Get Text    ${Val_Msg}
    Log to console   Canal+ Package=${GIft_Popup_Vakkok}
    Log to console   Canal+ Package=${Insufficient_Bal_Vakok}
    Tap  ${Val_Okbtn}
    Wait Until Element Is Visible    ${Micon}  30s
    Press Keycode                 4
Validation.To verify Insufficient Balance VIU
    Tap    ${WaitMBtn}
    Wait Until Element Is Visible    ${VIUIcon}  10s
    Tap  ${VIUIcon}    30
    Wait Until Element Is Visible    ${Val_tap1500}   30s
    Tap  ${Val_tap1500}
    Wait Until Element Is Visible    ${Val_Popup}     30s
    ${GIft_Popup_Vakkok} =   Get Text    ${Val_Popup}
    ${Insufficient_Bal_Vakok} =   Get Text    ${Val_Msg}
    Log to console   VIU=${GIft_Popup_Vakkok}
    Log to console  VIU=${Insufficient_Bal_Vakok}
    Tap  ${Val_Okbtn}
    Wait Until Element Is Visible    ${VIUIcon}  10s
    Press Keycode                 4
Validation.To verify Insufficient Balance Mahar Mobile
    Tap    ${WaitMBtn}
    Wait Until Element Is Visible    ${MaharIcon}    30s
    Tap  ${MaharIcon}
    Wait Until Element Is Visible    ${Val_tap1999}    30s
    Tap  ${Val_tap1999}
    Wait Until Element Is Visible    ${Val_Popup}     30s
    ${GIft_Popup_Vakkok} =   Get Text    ${Val_Popup}
    ${Insufficient_Bal_Vakok} =   Get Text    ${Val_Msg}
    Log to console   Mahar Mobile=${GIft_Popup_Vakkok}
    Log to console   Mahar Mobile=${Insufficient_Bal_Vakok}
    Tap  ${Val_Okbtn}
    Wait Until Element Is Visible    ${MaharIcon}  10s
    Press Keycode                 4
Validation.To verify Insufficient Balance La La Kyi ePin
    Tap    ${WaitMBtn}
    Wait Until Element Is Visible    ${Lalakyi}  30s
    Tap  ${Lalakyi}
    Wait Until Element Is Visible    ${Wlalakyi}   30s
    Tap  ${Wlalakyi}
    Wait Until Element Is Visible    ${Val_Popup}     30s
    ${GIft_Popup_Vakkok} =   Get Text    ${Val_Popup}
    ${Insufficient_Bal_Vakok} =   Get Text    ${Val_Msg}
    Log to console   La La Kyi ePin=${GIft_Popup_Vakkok}
    Log to console   La La Kyi ePin=${Insufficient_Bal_Vakok}
    Tap  ${Val_Okbtn}
    Wait Until Element Is Visible    ${Lalakyi}  10s
    Press Keycode                 4
Validation.To verify Phone number from phonebook for RTP
    Tap    ${RTPIcon}
    Wait Until Element Is Visible    ${WRTPpag}  40s
    Tap    ${Trans_Contact}
    Allow_Pop-up
    Wait Until Element Is Visible    ${MCT}  30s
    Tap   ${MCT}
    sleep  3s
    Press Keycode  4
Validation.To verify Wrong RTP Number
     Wait Until Element Is Visible    ${Val_RTP}  40s
     Tap    ${RTPIcon}
     Wait Until Element Is Visible    ${WRTPpag}  40s
     Input Text    ${Mobile_Number}    09409409444
     Tap    ${Mobile_Number}
     Press Keycode                 4
     Input Text    ${RTPAmt}   40
     Tap    ${Dateselct}
     Wait Until Element Is Visible    ${Calender}  40s
     Tap    ${date28}
     Tap    ${Val_Okbtn}
     Input Text    ${Note}     Wrong RTP number
     sleep  2s
     Element Should Be Disabled    ${Next}
     Press Keycode  4
Validation.To verify Goods and services Insufficient Balance
    Wait Until Element Is Visible    ${GND}   10s
    Tap   ${GND}
    sleep  5s
    Tap   ${Search}
    Input text  ${Search}    Merchant
    sleep  2s
    Click Element At Coordinates     986  1701
    Wait Until Keyword Succeeds    1 min    1 sec    Element Should Be Visible    ${SelectFR}
    Tap    ${SelectFR}
    Wait Until Element Is Visible    ${MSP}  50s
    Input Text    ${Amount}     50000
    Input Text    ${Note}    Robot Test
    Tap    ${Next}
    Wait Until Element Is Visible    ${Val_Popup}     30s
    ${GIft_Popup_Vakkok} =   Get Text    ${Val_Popup}
    ${Insufficient_Bal_Vakok} =   Get Text    ${Val_Msg}
    Log to console   GND=${GIft_Popup_Vakkok}
    Log to console   GND=${Insufficient_Bal_Vakok}
    Tap  ${Val_Okbtn}