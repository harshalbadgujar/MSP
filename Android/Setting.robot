*** Settings ***
Library     AppiumLibrary
Library	    Screenshot
Library     RequestsLibrary
Library     String
Library     OperatingSystem
Library    ArchiveLibrary
Library     Resources/DB_Config.py
Library	    Screenshot	  Results
Resource    Resources/Login_To_MSP.robot
Resource    Resources/Show_All_Transaction.robot
Resource    Resources/ENTER_PASSCODE.robot
Resource    Resources/HandleRebate.robot
Resource    Resources/Confirm_Success.robot
Resource    Resources/Fetch_OTP.robot
Resource    Locators/Add_Money.resource
Resource    Locators/Transfer.resource
Resource    Locators/Datapack.resource
Resource    Locators/Internet.resource
Resource    Locators/Bills.resource
Resource    Locators/Gifts.resource
Resource    Locators/Movie.resource
Resource    Locators/QRScan.resource
Resource    Locators/Humberger.resource
Resource    Locators/GoodsandServices.resource
Resource    Locators/RTP.resource
Resource    Locators/Validations.resource
Resource    Locators/Change_lang_and _Support.resource
Resource    Locators/Change_Passcode.resource
Resource    Locators/Registration.resource
Resource    Locators/Forgot_Passcode.resource
Resource    Locators/DuplicateNRC.resource
Resource    Locators/NRCnumMMLang.resource
Resource    Locators/RegisterBy_EN_FbByMM_and VV.resource
Resource    Keywords/Add_Money.robot
Resource    Keywords/Transfer.robot
Resource    Keywords/eLoad.robot
Resource    Keywords/Datapack.robot
Resource    Keywords/Internet.robot
Resource    Keywords/Bills.robot
Resource    Keywords/Gifts_Customer.robot
Resource    Keywords/Gift_Merchant.robot
Resource    Keywords/Movie.robot
Resource    Keywords/QR_Code.robot
Resource    Keywords/QR_Code_C_M.robot
Resource    Keywords/Change_Passcode.robot
Resource    Keywords/Forgot_Pass.robot
Resource    Keywords/Register.robot
Resource    Keywords/Duplicate_NRC_Passport.robot
Resource    Keywords/NRC_Num_MM_Lang.robot
Resource    Keywords/RegisterBy_EN_FPBy_MM.robot
Resource    Keywords/RegisterBy_MM_FPBy_EN.robot
Resource    Keywords/Validations.robot
Resource    Keywords/Change_lang_and_Support.robot
Resource    Keywords/RTP.robot
Resource    Keywords/GoodnServices.robot
Resource    Keywords/Humberger_Menu_validation.robot

