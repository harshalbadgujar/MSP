*** Settings ***
Resource     ../Setting.robot
*** Variable ***
${Login_Number} =     9798304852
*** Keywords ***
Movie.Login to the MSP android application for Movie
  Invoke App   ${Login_Number}
Movie.To verify that Canal+ Package Renewal functionliaty
    Wait Until Element Is Visible     ${WaitMBtn}    10s
    Tap     ${WaitMBtn}
    Wait Until Element Is Visible    ${Micon}   40s
    Tap  ${canalicon}    30
    Input Text  ${CanalTextB}    014502763789
    Tap   ${CanalNext}
    On confirmation screen    7,900   CanalPlus
    Tap  ${CanalConf}
    ENTER PASSCODE
    If Fails To Login
    On Sucesss screen   CanalPlus
    sleep  2s
Movie.To verify that Canal+ - Package Upgrade functionliaty
    Tap    ${WaitMBtn}
    Wait Until Element Is Visible    ${Micon}  40s
    Tap  ${canal+icon}    30
    Tap  ${Pkgupgrade}
    Input Text  ${Cardnum}    014502763789
    Tap   ${CanalNext}
    Wait Until Element Is Visible    ${CnlNxticon}  10
    Tap   ${CnlNxticon}
    On confirmation screen    4,900   CanalPlus
    Tap  ${CanalConf}
    ENTER PASSCODE
    If Fails To Login
    On Sucesss screen   CanalPlus


Movie.To verify that Invlaid card number Canal+ Package
    Tap    ${WaitMBtn}
    Wait Until Element Is Visible    ${Micon}  40s
    Tap  ${canal+icon}    30
    Tap  ${Pkgupgrade}
    Input Text  ${Cardnum}    01450276378
    Tap   ${CanalNext}
    Wait Until Element Is Visible    ${Okbtnid}  10
    Tap  ${Okbtnid}
    Wait Until Element Is Visible    ${canal+icon}  10s
    Press Keycode                 4
Movie.To verify that VIU movie service provider
    Tap    ${WaitMBtn}
    Wait Until Element Is Visible    ${VIUIcon}  40s
    Tap  ${VIUIcon}    30s
    Wait Until Element Is Visible    ${WAmout}   30s
      @{amount} =  create list     1,500   5,000   12,000   40,000
        :FOR  ${i}  IN  @{amount}
        \   Tap  android=UiSelector().text("${i}")    30
        \   ${Outofstock}=  Run Keyword And Return Status    Wait Until Element Is Visible    ${OKICON}   5s
        \   Run Keyword If    ${Outofstock}     Tap  ${Okbtnid}
        \   ${cnfrm}=  Run Keyword And Return Status    Wait Until Element Is Visible    ${CanalConf}   5s
        \   Run Keyword If    ${cnfrm}     PossibleRebate
        \   Exit For Loop IF    ${cnfrm} == True
    Run Keyword If    ${cnfrm} == False     Swipe    497  1011   65  1555  4000
    Pass Execution If	${cnfrm} == False     all amounts out of stock
    Run Keyword If    ${cnfrm} == False     log to console     all amounts out of stock
    On confirmation screen    ${i}   Viu
    Tap  ${CanalConf}
    ENTER PASSCODE
    If Fails To Login
    On Sucesss screen   Viu


Movie.To verify that Mahar Mobile movie service provider
    ${Moviebar}=  Run Keyword And Return Status    Wait Until Element Is Visible    ${VIUIcon}   4s
    Run Keyword If    ${Moviebar}        Swipe    490  1063  158  1590  4000
    Tap    ${WaitMBtn}
    Wait Until Element Is Visible    ${MaharIcon}    30s
    Tap  ${MaharIcon}
    Wait Until Element Is Visible    ${Wmahar}    30s
      @{amount} =  create list     1,999
        :FOR  ${i}  IN  @{amount}
        \   Tap  android=UiSelector().text("${i}")    30
        \   ${Outofstock}=  Run Keyword And Return Status    Wait Until Element Is Visible    ${Outofstock}   5s
        \   Run Keyword If    ${Outofstock}     Tap  ${Okbtnid}
        \   ${cnfrm}=  Run Keyword And Return Status    Wait Until Element Is Visible    ${CanalConf}   5s
        \   Run Keyword If    ${cnfrm}     PossibleRebate
        \   Exit For Loop IF    ${cnfrm} == True
    Run Keyword If    ${cnfrm} == False     Swipe    497  1011   65  1555  4000
    Run Keyword If    ${cnfrm} == False     log to console     all amounts out of stock
    Pass Execution If	${cnfrm} == False     all amounts out of stock
    On confirmation screen    ${i}   Mahar
    Tap  ${CanalConf}
    ENTER PASSCODE
    If Fails To Login
    On Sucesss screen   Mahar


Movie.To verify that La La Kyi ePin movie service provider
    ${Moviebar}=  Run Keyword And Return Status    Wait Until Element Is Visible    ${Micon}   4s
    Run Keyword If    ${Moviebar}        Swipe    490  1221  302  1675  4000
    Tap    ${WaitMBtn}
    Wait Until Element Is Visible    ${Lalakyi}  30s
    Tap  ${Lalakyi}
    Wait Until Element Is Visible    ${Wlalakyi}   30s
      @{amount} =  create list     500   1,000
        :FOR  ${i}  IN  @{amount}
        \   Tap  android=UiSelector().text("${i}")
        \   ${Outofstock}=  Run Keyword And Return Status    Wait Until Element Is Visible    ${Outofstock}   5s
        \   Run Keyword If    ${Outofstock}     Tap  ${Okbtnid}
        \   ${cnfrm}=  Run Keyword And Return Status    Wait Until Element Is Visible    ${CanalConf}   5s
        \   Run Keyword If    ${cnfrm}     PossibleRebate
        \   Exit For Loop IF    ${cnfrm} == True

        Run Keyword If    ${cnfrm} == False     log to console     all amounts out of stock
        Run Keyword If    ${cnfrm} == False     Swipe    497  1011   65  1555  4000
        Pass Execution If	${cnfrm} == False     all amounts out of stock
    On confirmation screen    ${i}   LaLaKyi
    Tap  ${CanalConf}
    ENTER PASSCODE
    If Fails To Login
    On Sucesss screen   LaLaKyi
    Press Keycode                 4
