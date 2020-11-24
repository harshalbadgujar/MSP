*** Settings ***
Resource     ../Setting.robot
*** Variable ***
${Login_Number} =  9798304852
${RTP_No} =        09405175231
${RTP_AMt} =       20
*** Keywords ***
GoodnServices.Login to MSP for Check Goods and Service Functionality
  Invoke App   9798304852
GoodnServices.TO verify Good and Services Search Bar
    Wait Until Element Is Visible    ${GND}   10s
    Tap   ${GND}
    sleep  5s
    Tap   ${Search}
    Input text  ${Search}    Merchant
    sleep  2s
    Click Element At Coordinates     986  1701
    Wait Until Keyword Succeeds    1 min    1 sec    Element Should Be Visible    ${SelectFR}
    Tap    ${SelectFR}
GoodnServices.To verify enter details page of Merchant
    Wait Until Element Is Visible    ${MSP}  50s
    Input Text    ${Amount}     23
    Input Text    ${Note}    Robot Test
    Tap    ${Next}
    Wait Until Element Is Visible    ${Wait_Conf}   10s
    Swipe	619	1193	415	695	2000
    Tap   ${Tap_confirm}
    ENTER PASSCODE
    If Fails To Login
    Allow_Pop-up
GoodnServices.To verify Success page of Goods and services
    Wait Until Element Is Visible    ${Wait_Success}
    Tap   ${Share}
    sleep  2s
    Press Keycode                 4
    Wait Until Element Is Visible    ${Back_home}  10s
    Tap   ${Back_home}
GoodnServices.To validate No reciever for the Good and Service
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
    Input Text    ${Amount}     23
    Input Text    ${Note}    Robot Test
    Tap    ${Tap_on_Edit_Mo}
    Clear text  ${Tap_on_Edit_Mo}
    Press Keycode   4
    Element Should Be Disabled    ${Next}
