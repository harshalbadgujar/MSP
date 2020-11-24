*** Settings ***
Resource     ../Setting.robot
*** Variable ***
${Login_Number} =     9798304852
${Exp_Am} =  140
${Unlimit_Am}     166
*** Keywords ***
#QR_Code_C_M.Invoke MSP for check QR code Merchant
#    Invoke App   ${Login_Number}
#To verify Open Scaner for scan the QR customer to merchant
#    Allow_Pop-up
#    Wait Until Element Is Visible    ${ScannPay}
#    Tap    ${Gallery}
#    Allow_Pop-up
#    Wait Until Element Is Visible    ${DownlaodF}  30s
#    Tap    ${DownlaodF}
#    Scroll   //android.view.ViewGroup[@content-desc="Photo taken on Apr 20, 2020 10:49:52 AM"]     //android.view.ViewGroup[@content-desc="Photo taken on Jun 3, 2020 1:00:28 PM"]
#    Tap    //android.view.ViewGroup[@content-desc="Photo taken on Mar 2, 2020 6:43:43 PM"]
#    Wait Until Element Is Visible    ${Tamount}   10s
#    Input Text     ${AmntTxtBx}  ${Exp_Am}
#    Tap    ${QRconf}
#    Wait Until Element Is Visible    ${Confirmaion}   10s
#    Swipe    600    923    415    695    3000
#    Tap    ${CongpagQR}
#    ENTER PASSCODE
#    If Fails To Login
#    Wait Until Element Is Visible    ${SucPagQR}  10s
#    Swipe  157    1365    292    630    8000
#    Tap    ${QRbackth}
#   Transaction Details    QR_Transfer_Merchant
#To verify that multiple time customer to Merchant
#    Wait Until Element Is Visible    ${Visible_Home}  10s
#    Tap    ${Scan}
#    Wait Until Element Is Visible    ${ScannPay}   10s
#    Tap    ${Gallery}
#    Wait Until Element Is Visible    ${DownlaodF}  30s
#    Tap    ${DownlaodF}
#    Scroll   //android.view.ViewGroup[@content-desc="Photo taken on Apr 20, 2020 10:49:52 AM"]     //android.view.ViewGroup[@content-desc="Photo taken on Jun 3, 2020 1:00:28 PM"]
#    Tap    //android.view.ViewGroup[@content-desc="Photo taken on Mar 2, 2020 6:43:43 PM"]
#    Wait Until Element Is Visible    ${Tamount}  10s
#    Input Text     ${AmntTxtBx}   ${Unlimit_Am}
#    Tap    ${QRconf}
#    Wait Until Element Is Visible    ${Confirmaion}  10s
#    Swipe    600    923    415    695    3000
#    Tap    ${CongpagQR}
#    ENTER PASSCODE
#    If Fails To Login
#    Wait Until Element Is Visible    ${SucPagQR}   10s
#    Swipe  157    1365    292    630    8000
#    Tap    ${QRbackth}
#    Wait Until Element Is Visible    ${Visible_Home}  40s
#    Transaction Details    QR_Transfer_Merchant for multile times