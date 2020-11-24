*** Settings ***
Resource    Setting.robot
*** Test Cases ***
To verify Transfer Functionality by sending money to the MSP user

    Transfer.Login to the MSP Android application for Transfer
    Transfer.Open Transfer page and fill details
    Transfer.Enter Passcode for Transfer
    Transfer.Check Transfer Success Page Back to the Home
    Transfer.Validate Transfer Functionality if No receiver
To verify Add Money Functionlaity for Add Money in Wallet

    Add_Money.Login to the MSP android application for Add Money to Wallet
    Add_Money.Select Custom Amount option and enter Amount in custom text box
    Add_Money.Select MPU option for payments Custom Amount
    Add_Money.Select Amount Direct throught the button
    Add_Money.Select MPU option for payment throught the button
To verify Eload Functionality for the load Balance

    eLoad.Login to the MSP android application for Eload in Mobile
    eLoad.Eload Functionality by the Reedem rewards on elaod transaction
    eLoad.Check Success page of Eoad reedem validate
    eLoad.Eload Functionality by the Donate rewards on elaod transaction
    eLoad.Check Success page of the Elaod Donate validate
To verify Datapack Functionality of MSP app in Eload module
    [Tags]  Run_Again
    Datapck.Login to the MSP android application for Datapack in Mobile
    Datapck.Datapack Functionality by Checeking datapack on datapack transaction
    Datapck.Check Success page of datapack
To verify Bills Payments of the MCDC and Electicity

    Bills.Login to the MSP android application for pay bills of MCDC and electricity
    Bills.To validate Already paid bill of MCDC
    Bills.To validate Invalid Invoice number of MCDC payment
    Bills.To validate Length of the Invoice number of MCDC bills
    Bills.To validate an Invalid meter bill of MESC bills
    #Bills.To verify MCDC bill for pay bill of valid invoice
To Verify Internet Functionlaity for pay Ineternet Bills

    Internet.Login to the MSP android application for Internet Bill
    Run Keyword And Continue On Failure  Internet.To verify Ananda internet service provider
    Run Keyword And Continue On Failure  Internet.To verify Hi internet service provider
    Run Keyword And Continue On Failure  Internet.To verify MyanmarNet Prepaid service provider
    Run Keyword And Continue On Failure  Internet.To verify Ooredoo Fiber service provider
    Run Keyword And Continue On Failure  Internet.To verify Telenor Fiber service provider
    Run Keyword And Continue On Failure  Internet.To validate Wrong number Telenor Fiber
    Run Keyword And Continue On Failure  Internet.To validate insufficient balance of Ooredoo fiber
To verify that Gift Functionlaity for gifts of various service providers
    [Tags]  Run_Again
    Gifts_Customer.Login to the MSP android application for Gifts
    Gifts_Customer.To verify that iTunes service provider for customer gifts
    Gifts_Customer.To verify that Vakok Service provider for Customer gifts
    Gifts_Customer.To verfiry that viberOut Service provider for Customer gifts
    Gifts_Customer.To Validate that Wrong ViverOut Mobile Number in customer login
    Gifts_Customer.To Validate that Wrong Contact number through phone book of viberOut
    Gifts_Customer.Signout from Customer
    Gift_Merchant.To verify Login to the Merchant account
    Gift_Merchant.To verify that iTunes service provider for Merchant gifts
    Gift_Merchant.To verify that Vakok Service provider for Merchant gifts
    Gift_Merchant.To verfiry that viberOut Service provider for Merchant gifts
    Gift_Merchant.To Validate that Wrong ViverOut Mobile Number in merchant login
    Gift_Merchant.To validate that Humberger charge amount
To verify that Movie Functionality for various Service provider

    Movie.Login to the MSP android application for Movie
    Run Keyword And Continue On Failure  Movie.To verify that Canal+ Package Renewal functionliaty
    Run Keyword And Continue On Failure  Movie.To verify that Canal+ - Package Upgrade functionliaty
    Run Keyword And Continue On Failure  Movie.To verify that Invlaid card number Canal+ Package
    Run Keyword And Continue On Failure  Movie.To verify that VIU movie service provider
    Run Keyword And Continue On Failure  Movie.To verify that Mahar Mobile movie service provider
    Run Keyword And Continue On Failure  Movie.To verify that La La Kyi ePin movie service provider

To verify that QR scan functionlaity

    QR_Code.Login to the MSP android application for QR scan Functionlaity
    QR_Code.To verify Open Scaner for scan the QR customer to customer
    QR_Code.To verify Select QR from galley for scan
    QR_Code.To verify Enter Amount for Transfer
    QR_Code.To verify Check Success page
    QR_Code.To verify QR scan for Multiple time
    QR_Code.To verify Open Scaner for scan the QR customer to merchant
    QR_Code.To verify that multiple time customer to Merchant
    QR_Code.To validate Invalid QR code
    QR_Code.Verification for QR Pay
    QR_Code.Verification for QR Recive
    QR_Code.Verification for QR set amount
    QR_Code.To validate Exipre QR

To verify Change_lang_and_Support

    Change_lang_and_Support.Login to the for Change lang and Support Functionlaity
    Change_lang_and_Support.To verify that Change langauge option
    Change_lang_and_Support.To verify Langauge is change or not
    Change_lang_and_Support.To verify that Support chat bot option
    Change_lang_and_Support.To verify Chatting option is sending message or not

To verify change passcode Functionality of the MSP App
    [Tags]  Run_Again
    Change_Passcode.Login to MSP for change passcode Functionlaity
    Change_Passcode.To verify change passcode option
    Change_Passcode.To verify set New passcode
    Change_Passcode.To verify Change passcode is working or not by login
    Change_Passcode.TO verify Old passcode is working or not
    Change_Passcode.To verify changed passcode is working or not
    Change_Passcode.Set Previous Passcode for further use
To verify validations of MSP

    Validation.Login to MSP for Validation with Minimum Balance wallet
    Validation.To verify Wrong_Mobile Number for login
    Validation.To verify Wrong Passcode for login
    Validation.To verify Phone number from phonebook for transfer
    Validation.To verify insufficient Balance of Transfer
    Validation.To verify Phone number from phonebook for eload
    Validation.To verify Eload Insufficient Balance
    Validation.To verify Eload data package Insufficient Balance
    Validation.To verify wrong number of biller for Eload functionlaity
    Validation.To verify Gift Insufficient Balance of iTune
    Validation.To verify Gift Insufficient Balance of ViberOut by entering number
    Validation.To verify Gift Insufficient Balance of Vakkok
    Validation.To verify Gift Insufficient Balance of EasyPoint
    Validation.To verify Gift Insufficient Balance of GooglePlay
    Validation.To verify Gift Insufficient Balance of Steamwallet
    Validation.To verify Insufficient Balance Ananda internet service
    Validation.To verify Insufficient Balance for Telenor Fiber internet service
    Validation.To verify Telenor Fiber Number from Phonebook
    Validation.To verify Insufficient Balance Hi Internet
    Validation.To verify Insufficient Balance MyanmarNet Prepaid
    Validation.To verify Insufficient Balance MyanmarNet Ooredoo Fiber
    Validation.To verify Insufficient Balance Canal+ Package
    Validation.To verify Insufficient Balance VIU
    Validation.To verify Insufficient Balance Mahar Mobile
    Validation.To verify Insufficient Balance La La Kyi ePin
    Validation.To verify Phone number from phonebook for RTP
    Validation.To verify Wrong RTP Number
    Validation.To verify Goods and services Insufficient Balance
To verify registration Process

    Register.Login to MSP for Registration
    Register.Generate Number For Register
    Register.To verify Fetch OTP From SQL DB and Enter
    Register.To verify Blank Name
    Register.To verify Balnk NRC
    Register.To verify Blank Passport
    Register.To verify Enter User Details
    Register.To verify Verify User Details
    Register.To verify No passcode Case
To verify Forgot passcode Functionlaity for MSP

    Forgot_Pass.Login to MSP for Forgot passcode
    Forgot_Pass.To verify Forgot passcode option is working or not
    Forgot_Pass.To verify Fetch OTP For Forgot passcode
    Forgot_Pass.To verify Set Passcode for Forgot passcode
To verify Duplicate Users details NRC and Passport

    Duplicate_NRC_Passport.Login MSP for check duplicate
    Duplicate_NRC_Passport.To Verify Generate Number For Duplicate
    Duplicate_NRC_Passport.To verify Fetch OTP for dulicate process
    Duplicate_NRC_Passport.To verify Check Duplicate Passport
    Duplicate_NRC_Passport.To verify Check Duplicate NRC
To verify NRC Number in Myanmar Language

    NRC_Num_MM_Lang.To verify Login MSP for NRC check
    NRC_Num_MM_Lang.To verify Generate Number For NRC Number
    NRC_Num_MM_Lang.To verify Fetch OTP For NRC
    NRC_Num_MM_Lang.To verify MM lang NRC number and Duplicate in MM
    NRC_Num_MM_Lang.To verify Duplicate Passport in MM Lang
To verify that user registration by English langauage and forgot passcode by Myanmar langauge

    RegisterBy_EN_FPBy_MM.Login MSP for check Forgot Passcode in Myanmar Langauge
    RegisterBy_EN_FPBy_MM.To verify Generate Number For Register in English langauge
    RegisterBy_EN_FPBy_MM.To verify Fetch OTP
    RegisterBy_EN_FPBy_MM.To verify Registration processs
    RegisterBy_EN_FPBy_MM.To verify Check in MM Lang
    RegisterBy_EN_FPBy_MM.To verify Fetch OTP For EN_FB_MM_set_pass
To verify that user registration by Myanmar langauage and forgot passcode by English langauge

    RegisterBy_MM_FPBy_EN.Login MSP for check Forgot passcode in English langauge
    RegisterBy_MM_FPBy_EN.To verify Change langauage to Myanmar
    RegisterBy_MM_FPBy_EN.To verify Generate Number For Register in MM
    RegisterBy_MM_FPBy_EN.To verify Fetch OTP For MM_FP_EE
    RegisterBy_MM_FPBy_EN.To verify Registration processs of MM
    RegisterBy_MM_FPBy_EN.To verify Forgot passcode in english langauge
    RegisterBy_MM_FPBy_EN.To verify Fetch OTP For MM_FB_EE_set_pass
To Verify RTP functionlity of MSP
    [Tags]  Run_Again
    RTP.Login MSP for RTP functionlaity
    RTP.Request to pay from customer to Merchant wallet
    RTP.To verify Decline Functionlaity of Request to Pay
    RTP.To verify Accept Functionlaity of Request to pay
    RTP.Request to pay from Merchant to customer wallet
    RTP.Request to pay from Customer to Customer wallet
    RTP.To verify that Insufficient Balanace to Pay requested amount
To verify Goods and Services Functionlaity

    GoodnServices.Login to MSP for Check Goods and Service Functionality
    GoodnServices.TO verify Good and Services Search Bar
    GoodnServices.To verify enter details page of Merchant
    GoodnServices.To verify Success page of Goods and services
    GoodnServices.To validate No reciever for the Good and Service
To verify Humberger Menu for the validation Left Menu

    Humberger_Menu_validation.Login to MSP for left menu Verification
    Humberger_Menu_validation.To verify Left menu Transfer button
    Humberger_Menu_validation.To verify Left menu scan button
    Humberger_Menu_validation.To verify Left menu Pay button
    Humberger_Menu_validation.To verify Left menu Receive button
    Humberger_Menu_validation.To verify Left menu Add_Money button
    Humberger_Menu_validation.To verify Left menu ELOAD button
    Humberger_Menu_validation.To verify Left menu Request to transfer button
    Humberger_Menu_validation.To verify Left menu Bills button
    Humberger_Menu_validation.To verify Left menu gift button
    Humberger_Menu_validation.To verify Left menu Internet button
    Humberger_Menu_validation.To verify Left menu movie button
    Humberger_Menu_validation.To verify Left menu Goods and Services button
    Humberger_Menu_validation.To verify Total balance and Add money balance verification
    Humberger_Menu_validation.To verify Fetch balance from UI for cross check
    Humberger_Menu_validation.To verify Fetch Token for Balance get API
    Humberger_Menu_validation.To verify Assertion of GIP API balance and UI balance