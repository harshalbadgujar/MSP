*** Settings ***
Resource     ../Setting.robot
*** Variable ***
${Login_Number} =     9798304852
${Expected_Am} =       12
${Unlimit_Amount} =    162
*** Keywords ***
QR_Code.Login to the MSP android application for QR scan Functionlaity
     Invoke App   ${Login_Number}
QR_Code.To verify Open Scaner for scan the QR customer to customer
    Tap    ${Scan}
    Allow_Pop-up
    Wait Until Element Is Visible    ${ScannPay}   30s
QR_Code.To verify Select QR from galley for scan
    Tap    ${Gallery}
    Allow_Pop-up
    Wait Until Element Is Visible    ${DownlaodF}  30s
    Tap    ${DownlaodF}
    Tap    //android.view.ViewGroup[@content-desc="Photo taken on Mar 3, 2020 9:59:53 AM"]
    Wait Until Element Is Visible    ${Tamount}  30s
QR_Code.To verify Enter Amount for Transfer
    Input Text     ${AmntTxtBx}   ${Expected_Am}
    Tap    ${QRconf}
    Wait Until Element Is Visible    ${Confirmaion}  30s
    Swipe    600    923    415    695    3000
    Tap    ${CongpagQR}
    ENTER PASSCODE
    If Fails To Login
QR_Code.To verify Check Success page
    Wait Until Element Is Visible    ${SucPagQR}  20s
    Swipe  157    1365    292    630    8000
    Tap    ${QRbackth}
#    Transaction Details   QR_Transfer_Customer limited
QR_Code.To verify QR scan for Multiple time
    Wait Until Element Is Visible    ${Visible_Home}
    Tap    ${Scan}
    Wait Until Element Is Visible    ${ScannPay}
    Tap    ${Gallery}
    Wait Until Element Is Visible    ${DownlaodF}  30s
    Tap    ${DownlaodF}
    Tap    //android.view.ViewGroup[@content-desc="Photo taken on Mar 3, 2020 9:59:53 AM"]
    Wait Until Element Is Visible    ${Tamount}  10
    Input Text     ${AmntTxtBx}   ${Unlimit_Amount}
    Tap    ${QRconf}
    Wait Until Element Is Visible    ${Confirmaion}
    Swipe    600    923    415    695    3000
    Tap    ${CongpagQR}
    ENTER PASSCODE
    If Fails To Login
    Wait Until Element Is Visible    ${SucPagQR}    20s
    Swipe  157    1365    292    630    8000
    Tap    ${QRbackth}
#    Transaction Details    QR_Transfer_Customer unlimit
To verify Open Scaner for scan the QR customer to merchant
    Wait Until Element Is Visible    ${Visible_Home}
    Tap    ${Scan}
    Wait Until Element Is Visible    ${ScannPay}
    Tap    ${Gallery}
    Allow_Pop-up
    Wait Until Element Is Visible    ${DownlaodF}  30s
    Tap    ${DownlaodF}
    Scroll   //android.view.ViewGroup[@content-desc="Photo taken on Apr 20, 2020 10:49:52 AM"]     //android.view.ViewGroup[@content-desc="Photo taken on Jun 3, 2020 1:00:28 PM"]
    Tap    //android.view.ViewGroup[@content-desc="Photo taken on Mar 2, 2020 6:43:43 PM"]
    Wait Until Element Is Visible    ${Tamount}   10s
    Input Text     ${AmntTxtBx}  ${Exp_Am}
    Tap    ${QRconf}
    Wait Until Element Is Visible    ${Confirmaion}   10s
    Swipe    600    923    415    695    3000
    Tap    ${CongpagQR}
    ENTER PASSCODE
    If Fails To Login
    Wait Until Element Is Visible    ${SucPagQR}  10s
    Swipe  157    1365    292    630    8000
    Tap    ${QRbackth}
#   Transaction Details    QR_Transfer_Merchant
To verify that multiple time customer to Merchant
    Wait Until Element Is Visible    ${Visible_Home}  10s
    Tap    ${Scan}
    Wait Until Element Is Visible    ${ScannPay}   10s
    Tap    ${Gallery}
    Wait Until Element Is Visible    ${DownlaodF}  30s
    Tap    ${DownlaodF}
    Scroll   //android.view.ViewGroup[@content-desc="Photo taken on Apr 20, 2020 10:49:52 AM"]     //android.view.ViewGroup[@content-desc="Photo taken on Jun 3, 2020 1:00:28 PM"]
    Tap    //android.view.ViewGroup[@content-desc="Photo taken on Mar 2, 2020 6:43:43 PM"]
    Wait Until Element Is Visible    ${Tamount}  10s
    Input Text     ${AmntTxtBx}   ${Unlimit_Am}
    Tap    ${QRconf}
    Wait Until Element Is Visible    ${Confirmaion}  10s
    Swipe    600    923    415    695    3000
    Tap    ${CongpagQR}
    ENTER PASSCODE
    If Fails To Login
    Wait Until Element Is Visible    ${SucPagQR}   10s
    Swipe  157    1365    292    630    8000
    Tap    ${QRbackth}
    Wait Until Element Is Visible    ${Visible_Home}  40s
#    Transaction Details    QR_Transfer_Merchant for multile times
QR_Code.To validate Invalid QR code
    Wait Until Element Is Visible    ${Visible_Home}
    Tap    ${Scan}
    Allow_Pop-up
    Wait Until Element Is Visible    ${ScannPay}
    Tap    ${Gallery}
    Allow_Pop-up
    Wait Until Element Is Visible    ${MSPF}  30s
    Tap    ${MSPF}
    Tap    //android.view.ViewGroup[@content-desc="Photo taken on Apr 17, 2020 2:26:27 PM"]
    Wait Until Element Is Visible    id=com.ccpp.msp.uat:id/tvTitle     30s
    ${QR_Popup} =   Get Text    ${Pop-upQR}
    ${Pop-up_MSG} =   Get Text    ${pop-upQrmsg}
    Log to console   Invalid QR=${QR_Popup}
    Log to console   Invalid QR=${Pop-up_MSG}
    Tap  id=com.ccpp.msp.uat:id/btnOk
QR_Code.Verification for QR Pay
    Wait Until Element Is Visible    ${PayQRimg}   20s
    Tap    ${PayQRimg}
    ${bar_code}=  Get text   ${barCode}
    Log to console  ${bar_code}
QR_Code.Verification for QR Recive
    Wait Until Element Is Visible    ${Receive}   20s
    Tap    ${Receive}
    ${bar_code}=  Get text   ${QRTtile}
    Should be Equal as Strings    ${bar_code}     QR RECEIVE
QR_Code.Verification for QR set amount
    Wait Until Element Is Visible    ${Setamt}   20s
    Tap    ${Setamt}
    sleep  2s
    Input Text     ${SetAMtTExtbox}       23
    Tap    ${GenQR}
QR_Code.To validate Exipre QR
    Wait Until Element Is Visible    ${Visible_Home}
    Tap    ${Scan}
    Allow_Pop-up
    Wait Until Element Is Visible    ${ScannPay}
    Tap    ${Gallery}
    Allow_Pop-up
    Wait Until Element Is Visible    ${DownlaodF}  30s
    Tap    ${DownlaodF}
    Tap    //android.view.ViewGroup[@content-desc="Photo taken on Jun 25, 2020 12:05:36 PM"]
    Wait Until Element Is Visible    ${Pop-upQR}     30s
    ${QRpopuptitle} =   Get Text    ${Pop-upQR}
    ${QRpopupmsg} =   Get Text    ${pop-upQrmsg}
    Log to console   ${QRpopuptitle}
    Log to console   ${QRpopupmsg}
    Tap  ${OkQR}

