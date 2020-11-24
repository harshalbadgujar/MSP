*** Settings ***
Resource     ../Setting.robot
*** Variable ***
${Login_Number} =  9798304852
${RTP_No} =        09405175231
${RTP_AMt} =    20
*** Keywords ***
RTP.Login MSP for RTP functionlaity
  Invoke App   9798304852
RTP.Request to pay from customer to Merchant wallet
      @{ACCEPT} =   create list     09405175231  30  FOR ACCEPT
      @{DECLINE} =  create list     09405175231  31  FOR DECLINE
      @{Insuff} =   create list    091254904  8000  FOR INSUFFICIENT

        :FOR  ${i}  ${j}  ${k}  IN  @{ACCEPT}  @{DECLINE}  @{Insuff}
        \   Tap    ${RTPIcon}
        \   Wait Until Element Is Visible    ${WRTPpag}  40s
        \   Input Text    ${Mobile_Number}    ${i}
        \   Tap    ${Mobile_Number}
        \   Press Keycode                 4
        \   Input Text    ${RTPAmt}   ${j}
        \   Tap    ${Dateselct}
        \   Wait Until Element Is Visible    ${Calender}  40s
        \   Tap    ${date28}
        \   Tap    ${RTPok}
        \   Input Text    ${Note}     ${k}
        \   sleep  2s
        \   Tap    ${Next}
        \   Allow_Pop-up
        \   Wait Until Element Is Visible    ${RTpOKicn}  40s
        \   Tap    ${RTpOKicn}     10s
        \   Wait Until Element Is Visible    ${TransferButton}  30s
    Tap  ${Humberger_Menu}
    Wait Until Element Is Visible    ${Hum_pay}  120s
    Scroll    ${Hum_Gifts}     ${Hum_Trans}
    Tap  ${RTPSO}
    Wait Until Element Is Visible    ${RTpRgst}  30s
    Tap    ${RTPSI}
    Wait Until Element Is Visible    ${EYMN}      30s
    Input Text    ${RTPEMN}    09405175231
    Tap    ${RTPCONF}
    ENTER PASSCODE
    If Fails To Login
    Wait Until Element Is Visible    ${TransferButton}  30s
    Tap    ${Noti}
    Wait Until Element Is Visible    ${Notiicon}  40s
RTP.To verify Decline Functionlaity of Request to Pay
    Tap    xpath=//android.widget.TextView[@text='Tejal Pawar just sent you a request to pay']
    Wait Until Element Is Visible    ${Dclnicn}  40s
    Tap   ${Dclnicn}
    Wait Until Element Is Visible    ${DECLINERTP}  40s
    Tap   ${DECLINERTP}
    sleep  3s
    Tap     ${Back_button}
    Wait Until Element Is Visible    ${TransferButton}  30s
    Tap    ${Noti}
RTP.To verify Accept Functionlaity of Request to pay
    Wait Until Element Is Visible   xpath=//android.widget.TextView[@text='Tejal Pawar just sent you a request to pay']   30s
    Tap    xpath=//android.widget.TextView[@text='Tejal Pawar just sent you a request to pay']
    Wait Until Element Is Visible    ${Dclnicn}      40s
    Swipe   122  1575  975  1565
    Wait Until Element Is Visible    ${Wait_Conf}
    Swipe	619	1193	415	695	2000
    Tap   ${Next}
    ENTER PASSCODE
    If Fails To Login
    Wait Until Keyword Succeeds    1 min    1 sec    Element Should Be Visible    ${RTPsucc}
    Swipe  118  1700  487  342  4000
    Wait Until Element Is Visible    ${Back_home}    30s
    Tap   ${RTPshare}
    sleep  2s
    Press Keycode                 4
    Wait Until Element Is Visible    ${Back_home}    30s
    Tap   ${Back_home}
    Wait Until Element Is Visible    ${TransferButton}   30s
RTP.Request to pay from Merchant to customer wallet
      @{ACCEPT} =  create list     09798304852  30  FOR ACCEPT
      @{DECLINE} =  create list     09798304852  31  FOR DECLINE
      @{Insuff} =  create list    091254904  8000  FOR INSUFFICIENT

        :FOR  ${i}  ${j}  ${k}  IN  @{ACCEPT}  @{DECLINE}  @{Insuff}
        \   Tap    ${RTPIcon}
        \   Wait Until Element Is Visible    ${WRTPpag}  40s
        \   Input Text    ${Mobile_Number}    ${i}
        \   Tap    ${Mobile_Number}
        \   Press Keycode                 4
        \   Input Text    ${RTPAmt}   ${j}
        \   Tap    ${Dateselct}
        \   Wait Until Element Is Visible    ${Calender}  40s
        \   Tap    ${date28}
        \   Tap    ${RTPok}
        \   Input Text    ${Note}     ${k}
        \   sleep  2s
        \   Tap    ${Next}
        \   Allow_Pop-up
        \   Wait Until Element Is Visible    ${RTpOKicn}  40s
        \   Tap    ${RTpOKicn}     10s
        \   Wait Until Element Is Visible    ${TransferButton}  30s
    Tap  ${Humberger_Menu}
    Wait Until Element Is Visible    ${RTPcharge}  120s
    Scroll    ${Hum_Gifts}     ${Hum_Trans}
    Tap  ${RTPSO}
    Wait Until Element Is Visible    ${RTpRgst}  30s
    Tap    ${RTPSI}
    Wait Until Element Is Visible    ${EYMN}      30s
    Input Text    ${RTPEMN}     09798304852
    Tap    ${RTPCONF}
    ENTER PASSCODE
    If Fails To Login
    Wait Until Element Is Visible    ${TransferButton}  30s
    Tap    ${Noti}
    Wait Until Element Is Visible    ${Notiicon}  40s
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text='abc just sent you a request to pay']  40s
    Tap    xpath=//android.widget.TextView[@text='abc just sent you a request to pay']
    Wait Until Element Is Visible    ${Dclnicn}  40s
    Tap   ${Dclnicn}
    Wait Until Element Is Visible    ${DECLINERTP}  40s
    Tap   ${DECLINERTP}
    sleep  3s
    Tap     ${Back_button}
    Wait Until Element Is Visible    ${TransferButton}  30s
    Tap    ${Noti}
    Wait Until Element Is Visible   xpath=//android.widget.TextView[@text='abc just sent you a request to pay']   30s
    Tap    xpath=//android.widget.TextView[@text='abc just sent you a request to pay']
    Wait Until Element Is Visible    ${Dclnicn}  40s
    Swipe   122  1575  975  1565
    Wait Until Element Is Visible    ${Wait_Conf}
    Swipe	619	1193	415	695	2000
    Tap   ${Next}
    ENTER PASSCODE
    If Fails To Login
    Wait Until Keyword Succeeds    1 min    1 sec    Element Should Be Visible    ${RTPsucc}
    Swipe  118  1700  487  342  4000
    Wait Until Element Is Visible    ${Back_home}    30s
    Tap   ${RTPshare}
    sleep  2s
    Press Keycode                 4
    Wait Until Element Is Visible    ${Back_home}    30s
    Tap   ${Back_home}
    Wait Until Element Is Visible    ${TransferButton}   30s
RTP.Request to pay from Customer to Customer wallet
      @{ACCEPT} =  create list     096417686  33  FOR ACCEPT
      @{DECLINE} =  create list     096417686  34  FOR DECLINE

        :FOR  ${i}  ${j}  ${k}  IN  @{ACCEPT}  @{DECLINE}
        \   Tap    ${RTPIcon}
        \   Wait Until Element Is Visible    ${WRTPpag}  40s
        \   Input Text    ${Mobile_Number}    ${i}
        \   Tap    ${Mobile_Number}
        \   Press Keycode                 4
        \   Input Text    ${RTPAmt}   ${j}
        \   Tap    ${Dateselct}
        \   Wait Until Element Is Visible    ${Calender}  40s
        \   Tap    ${date28}
        \   Tap    ${RTPok}
        \   Input Text    ${Note}     ${k}
        \   sleep  2s
        \   Tap    ${Next}
        \   Allow_Pop-up
        \   Wait Until Element Is Visible    ${RTpOKicn}  40s
        \   Tap    ${RTpOKicn}     10s
        \   Wait Until Element Is Visible    ${TransferButton}  30s
    Tap  ${Humberger_Menu}
    Wait Until Element Is Visible    ${Hum_pay}  120s
    Scroll    ${Hum_Gifts}     ${Hum_Trans}
    Tap  ${RTPSO}
    Wait Until Element Is Visible    ${RTpRgst}  30s
    Tap    ${RTPSI}
    Wait Until Element Is Visible    ${EYMN}      30s
    Input Text    ${RTPEMN}    096417686
    Tap    ${RTPCONF}
    ENTER PASSCODE
    If Fails To Login
    Wait Until Element Is Visible    ${TransferButton}  30s
    Tap    ${Noti}
    Wait Until Element Is Visible    ${Notiicon}  40s
    sleep  4s
    Tap    xpath=//android.widget.TextView[@text='Tejal Pawar just sent you a request to pay']
    Wait Until Element Is Visible    ${Dclnicn}  40s
    Tap   ${Dclnicn}
    Wait Until Element Is Visible    ${DECLINERTP}  40s
    Tap   ${DECLINERTP}
    sleep  3s
    Tap     ${Back_button}
    Wait Until Element Is Visible    ${TransferButton}  30s
    Tap    ${Noti}
    Wait Until Element Is Visible    ${Back_button}    30s
    Wait Until Element Is Visible   xpath=//android.widget.TextView[@text='Tejal Pawar just sent you a request to pay']    30s
    Tap    xpath=//android.widget.TextView[@text='Tejal Pawar just sent you a request to pay']
    Wait Until Element Is Visible    ${Dclnicn}  40s
    Swipe   122  1575  975  1565
    Wait Until Element Is Visible    ${Wait_Conf}
    Swipe	619	1193	415	695	2000
    Tap   ${Next}
    ENTER PASSCODE
    If Fails To Login
    Wait Until Keyword Succeeds    1 min    1 sec    Element Should Be Visible    ${RTPsucc}
    Swipe  118  1700  487  342  4000
    Wait Until Element Is Visible    ${Back_home}    30s
    Tap   ${RTPshare}
    sleep  2s
    Press Keycode                 4
    Wait Until Element Is Visible    ${Back_home}    30s
    Tap   ${Back_home}
    Wait Until Element Is Visible    ${TransferButton}   30s
RTP.To verify that Insufficient Balanace to Pay requested amount
    Wait Until Element Is Visible    ${TransferButton}   30s
    Tap  ${Humberger_Menu}
    Wait Until Element Is Visible    ${Hum_pay}  120s
    Scroll    ${Hum_Gifts}     ${Hum_Trans}
    Tap  ${RTPSO}
    Wait Until Element Is Visible    ${RTpRgst}  30s
    Tap    ${RTPSI}
    Wait Until Element Is Visible    ${EYMN}      30s
    Input Text    ${RTPEMN}    091254904
    Tap    ${RTPCONF}
    ENTER PASSCODE
    If Fails To Login
    Wait Until Element Is Visible    ${TransferButton}  30s
    Tap    ${Noti}
    Wait Until Element Is Visible    ${Notiicon}  40s
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text='Tejal Pawar just sent you a request to pay']   40s
    Tap    xpath=//android.widget.TextView[@text='Tejal Pawar just sent you a request to pay']
    Wait Until Element Is Visible    ${Dclnicn}  40s
    Swipe   122  1575  975  1565
    Wait Until Element Is Visible    ${Wait_Conf}
    Swipe	619	1193	415	695	2000
    Tap   ${Next}
    Wait Until Element Is Visible    ${Pop-upQR}     30s
    ${RTP_INSUFF} =   Get Text    ${Pop-upQR}
    ${Insufficient_RTP_MSG} =   Get Text    ${pop-upQrmsg}
    Log to console   ${RTP_INSUFF}
    Log to console   ${Insufficient_RTP_MSG}
    Tap  ${RTPok}
    Wait Until Element Is Visible     ${Back_button}    30s
    Tap  ${Back_button}
    Wait Until Element Is Visible    ${Notiicon}  40s
    Tap  ${Back_button}
    Wait Until Element Is Visible    ${TransferButton}  30s
    Tap  ${Humberger_Menu}
    Wait Until Element Is Visible    ${Hum_Gifts}  120s
    Scroll    ${Hum_Gifts}     ${Hum_Trans}
    Tap  ${RTPSO}
    Wait Until Element Is Visible    ${RTpRgst}  30s
    Tap    ${RTPSI}
    Wait Until Element Is Visible    ${EYMN}      30s
    Input Text    ${RTPEMN}    9798304852
    Tap    ${RTPCONF}
    ENTER PASSCODE
    If Fails To Login
