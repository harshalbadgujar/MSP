*** Settings ***
Library    AppiumLibrary
Library    String
Library	   OperatingSystem
Resource    Resource/Keyword/Global Keyword.robot
Resource    Resource/Keyword/Keyword MSP Function/Login.robot
Resource    Resource/Keyword/Keyword MSP Function/Reload.robot
Resource    Resource/Keyword/Keyword MSP Function/Transfer.robot
Resource    Resource/Keyword/Keyword MSP Function/eLoad.robot
Resource    Resource/Keyword/Keyword MSP Function/Internet.robot
Resource    Resource/Keyword/Keyword MSP Function/Gifts.robot
Resource    Resource/Keyword/Keyword MSP Function/Movie.robot
Resource    Resource/Keyword/Keyword MSP Function/Registration.robot
Resource    Resource/Keyword/Keyword MSP Function/Forgot Passcode.robot
Resource    Resource/Keyword/Keyword MSP Function/Change Passcode.robot
Resource    Resource/Keyword/Keyword MSP Function/GoodandService.robot
Resource    Resource/Keyword/Keyword MSP Function/RTP.robot
Resource    Resource/Keyword/Keyword MSP Function/Homepage.robot
Resource    Resource/Keyword/Keyword MSP Function/QRscan.robot
Resource    Resource/Keyword/Keyword MSP Function/Bills.robot
Resource    Resource/Locator/HomePage.resource


*** Variables ***
${Mobile}    094094094
${TransferMobile}    09405175245
@{eLoadTelenor}    Telenor eLoad    09799459562
@{eLoadMPTe}    MPT eLoad    09421175842
@{eLoadMecTele}    MecTel eLoad   0933072010
@{eLoadMyTeleLoad}    MyTel eLoad    09691009765
${OoredooDataPack}    09972649400
${MyTelDataPackFee}    09694504895
${InternetnumberTelenorFiber}    09791001059
${InternetnumberTelenorWireless}    09791001086
${ViberOutNumber}    09450002831
@{ChangePassCode}    0911227777    insufi
${CardNumberCanal+}    014502763789

*** Test Cases ***
#To verify registration Process
#    Open App
#    ${Gen_Mo}   To verify Register with valid passport number and name
#    To Verify users name and number is same under setting and homepage
#    Logout
#    To verify register with relogin    09${Gen_Mo}
#    To verify Change passcode    09${Gen_Mo}

#To verify validation for blank name, NRC and passport
#     open app
#     Validate register functionality if user keeps name, NRC and passport blank
#
#To verify register functionality if passcode is not set
#     open app
#     Validate register functionality when user do not set passcode

#To verify Transfer Functionality by sending money to the MSP user
#      Open App
#     Login    ${Mobile}
#     To validate transfer by sending money from one user to other    ${Mobile}    ${TransferMobile}    1000
#     To check the transaction in transaction history     Transfer      1000
#      To check transfer without entering receiver
#      To check transfer by selecting number from phonebook
#      logout
#      login   @{ChangePassCode}[0]
#      To validate transfer with insufficient balance user       @{ChangePassCode}[0]    ${Mobile}    1000

#To verify Add Money Functionlaity for Add Money in Wallet
#     open app
#     Login    ${Mobile}
#     ${Ref1}    ${AmountPay}    To validate addmoney by selecting amount with 123 service     50,000    123 Service
#     ${Ref1}    ${AmountPay}    To validate addmoney by entering custom amount with 123 service     1000    123 Service

#To verify that QR scan functionlaity
#     open app
#     Login    098855228
#     To verify QR receive page
#     To generate QR by setting amount
#     To verify pay QR page
#
#To verify Eload Functionality
#      open app
#      Login    ${Mobile}
#      To validate Eload Functionality by the Reedem rewards on eload transaction      @{eLoadTelenor}[0]    @{eLoadTelenor}[1]    1,000    ${Mobile}
#      To validate Eload Functionality by the Transfering rewards on eload transaction     @{eLoadTelenor}[0]    @{eLoadTelenor}[1]    1,000    ${Mobile}
#      To validate Eload Functionality by geting fees on eload transaction       @{eLoadMyTeleLoad}[0]    @{eLoadMyTeleLoad}[1]    1,000    ${Mobile}
#       To validate Eload functionality when number is selected from phonebook
#       logout
#       Login    @{ChangePassCode}[0]
#       To validate Eload functionality using insufficient balance user        @{ChangePassCode}[0]
##
To verify Eload datapacket Functionality
      open app
      Login    ${Mobile}
      To validate Eload datapacket Functionality by the Reedem rewards on eload transaction     ${OoredooDataPack}    ${Mobile}
      To validate Eload datapacket Functionality by the Transfering rewards on eload transaction      ${OoredooDataPack}    ${Mobile}
      To validate Eload datapacket Functionality by geting fees on eload transaction       ${MyTelDataPackFee}    ${Mobile}

#To Verify Internet Functionlaity for pay Ineternet Bills
#       open app
#       Login    ${Mobile}
#       To verify Ananda internet service provider     ${Mobile}
#       To verify Telenor fiber internet service provider      ${Mobile}    ${InternetnumberTelenorFiber}
#       To verify Telenor wireless internet service provider     ${Mobile}    ${InternetnumberTelenorWireless}
#       To verify Hi internet service provider     ${Mobile}
#       To verify MyanmarNet Prepaid service provider      ${Mobile}
#       To verify MyanmarNet Data service provider       ${Mobile}
#       To verify MyanmarNet A-Wa-Thone service provider       ${Mobile}
#       To verify Ooredoo Fiber service provider      ${Mobile}    CusID    CustomerName    12345    5000
#       To validate Wrong number Telenor Fiber
#       To validate internet by selecting mobile number from phonebook
#       Logout
#       Login   @{ChangePassCode}[0]
#       To validate insufficient balance of Ananda      @{ChangePassCode}[0]
#       Tap    ${CloseInternet}
#       To validate insufficient balance of Telenor fiber     @{ChangePassCode}[0]    ${InternetnumberTelenorFiber}
#       Tap    ${CloseInternet}
#       To validate insufficient balance of Telenor wireless     @{ChangePassCode}[0]    ${InternetnumberTelenorWireless}
#       Tap    ${CloseInternet}
#       To validate insufficient balance of Hi internet      @{ChangePassCode}[0]
#       Tap    ${CloseInternet}
#       To validate insufficient balance of MyanmarNet Prepaid      @{ChangePassCode}[0]
#       Tap    ${CloseInternet}
#       To validate insufficient balance of MyanmarNet Data      @{ChangePassCode}[0]
#       Tap    ${CloseInternet}
#       To validate insufficient balance of MyanmarNet A-Wa-Thone      @{ChangePassCode}[0]
#       Tap    ${CloseInternet}
#       To validate insufficient balance of Ooredoo fiber      @{ChangePassCode}[0]    CusID    CustomerName    12345    5000
#       Tap    ${CloseInternet}

#To verify that Gift Functionlaity for gifts of various service providers
#       open app
#       Login  ${Mobile}
#       To verify that iTunes service provider for gifts      ${Mobile}    USD5
#       To verify that google play service provider for gifts      ${Mobile}    USD10
#       To verify that viberout service provider for gifts      ${Mobile}    USD1    ${ViberOutNumber}
#       To verify that easypoint service provider by selecting amount for gifts       ${Mobile}    500
#       To verify that easypoint service provider by entering custom amount for gifts       ${Mobile}    1000
#       To verify that steamwallet service provider for gifts    ${Mobile}
#       To verify that Steamwallet SGD service provider for gifts       ${Mobile}
#       To verify that vakok service provider for gifts         ${Mobile}
#       To verify gifts by selecting mobile number from phonebook      USD1
#       To verify gifts without entering mobile number     USD1
#       logout
#       login    @{ChangePassCode}[0]
#       To Validate that insufficient balance of itunes      @{ChangePassCode}[0]    USD5
#       Tap    ${CloseGifts}
#       To Validate that insufficient balance of googleplay      @{ChangePassCode}[0]    USD10
#       Tap    ${CloseGifts}
#       To Validate that insufficient balance of viberout      @{ChangePassCode}[0]    USD1    ${ViberOutNumber}
#       Tap    ${CloseGifts}
#       To Validate that insufficient balance of easypoint select amount      @{ChangePassCode}[0]    500
#       Tap    ${CloseGifts}
#       To Validate that insufficient balance of easypoint custom amount      @{ChangePassCode}[0]    1000
#       Tap    ${CloseGifts}
#       To Validate that insufficient balance of steamwallet        @{ChangePassCode}[0]    50
#       Tap    ${CloseGifts}
#       To Validate that insufficient balance of steamwallet SGD       @{ChangePassCode}[0]    10
#       Tap    ${CloseGifts}
#       To Validate that insufficient balance of vakok        @{ChangePassCode}[0]
#       Tap    ${CloseGifts}

#To verify that Movie Functionality for various Service provider
#       open app
#       Login    ${Mobile}
#       To verify that Canal+ Package Renewal functionliaty       ${Mobile}    ${CardNumberCanal+}
#       To verify that Canal+ Package Upgrade functionliaty       ${Mobile}    ${CardNumberCanal+}
#       To verify that Viu functionliaty     ${Mobile}
#       To verify that Mahar Mobile functionliaty       ${Mobile}
#       To verify that La La Kyi functionliaty      ${Mobile}
#       Logout
#       Login    @{ChangePassCode}[0]
#       To verify Canal+ Package Renewal with insufficient balance     @{ChangePassCode}[0]    ${CardNumberCanal+}
#       Tap    ${CloseMovie}
#       To verify Canal+ Package Upgrade with insufficient balance      @{ChangePassCode}[0]    ${CardNumberCanal+}
#       Tap    ${CloseMovie}
#       To verify VIU with insufficient balance       @{ChangePassCode}[0]
#       Tap    ${CloseMovie}
#       To verify Mahar mobile with insufficient balance     @{ChangePassCode}[0]
#       Tap    ${CloseMovie}
#       To verify La La Kyi with insufficient balance       @{ChangePassCode}[0]
#       Tap    ${CloseMovie}

#To verify Goods and Services Functionlaity
#       open app
#       Login       ${Mobile}
#       To validate goods and service functionality by searching the merchant       ${Mobile}    1000
#       logout
#       Login      @{ChangePassCode}[0]
#       To validate goods and service functionality with user having insufficient user and no receiver     1000
##
#To verify the Request to pay functionality
#      open app
#      Login     0911447709
#      Send two pay request with customer login to merchant, low bal user and other customer
#      Login   098822558
#      Send two pay request with merchant login to customer, low bal user and accept the customer pay request
#      Login    098855228
#      Pay and decline the request received by the customer
#      Login    0911228888
#      Verify RTP with insufficient balance user
#      Verify RTP if no user number is entered
#
#To verify Forgot passcode functionality
#      open app
#      Login with the number and click on forgot passcode        @{ChangePassCode}[0]    @{ChangePassCode}[1]
#      Set the new passcode
#      Check the login by entering old passcode    @{ChangePassCode}[0]
#      Enter New Passcode
#      Reset the previous passcode again      @{ChangePassCode}[0]    @{ChangePassCode}[1]
#
#To verify login with unregister number
#      open app
#      Enter unregister number

#To verify chat, transaction history month and change langugage
#      open app
#      login         ${Mobile}
#      Check the top three transaction month
#      Change the app language from EN to MM
#      Verify the chat menu on home page

#To verify MESC and MCDC bills menu for invalid invoice number
#      open app
#      Login     ${Mobile}
#      Validate MESC and MCDC bills for invalid invoice number
#
#To assert the UI balance with GIP API response
#       open app
#       login    ${Mobile}
#       Get the wallet balance from UI
#       Get Access token for GIP API
#       Get the wallet balance from GIP api



