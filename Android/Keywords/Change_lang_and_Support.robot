*** Settings ***
Resource     ../Setting.robot
*** Variable ***
${Login_Number} =     9798304852
*** Keywords ***
Change_lang_and_Support.Login to the for Change lang and Support Functionlaity
  Invoke App   ${Login_Number}
Change_lang_and_Support.To verify that Change langauge option
    Tap  ${Humberger_Menu}
     Wait Until Element Is Visible    ${Hum_pay}   120s
    Scroll    ${Hum_Gifts}      ${Hum_Trans}
    Tap  ${SETTINGS}
    Wait Until Element Is Visible    ${LANGUAGES}  120s
    Scroll    ${LANGUAGES}     ${SOUNDS}
    Tap  ${CHAN_LANG}
    Wait Until Element Is Visible    ${MMLang}   120s
    Tap  ${MMLang}
    Tap  ${CLCnf}
Change_lang_and_Support.To verify Langauge is change or not
    Wait Until Element Is Visible   ${H_topup}    120s
    Tap    ${H_topup}
     Wait Until Element Is Visible     ${W_Bal}     120s
    ${Get_Balance} =   Get Text    ${W_Bal}
    Log to console   ${Get_Balance}
    Press Keycode                4
    Tap  ${Humberger_Menu}
    sleep  2s
    Tap  ${AddMoneyMM}
    sleep  2s
    Scroll     ${MMFrom}      ${MMTo}
    Wait Until Element Is Visible   ${MMChngLang}    120s
    Tap  ${MMChngLang}
    Wait Until Element Is Visible    ${EElang}   120s
    Tap  ${EElang}
    Tap  ${CLCnf}
Change_lang_and_Support.To verify that Support chat bot option
    Wait Until Element Is Visible    ${Visible_Home}  120s
    Tap   ${Support}
    Allow_Pop-up
    Allow_Pop-up
    Wait Until Element Is Visible    ${Chathead}   120s
Change_lang_and_Support.To verify Chatting option is sending message or not
    Input Text   ${Chathead}    Hi
    Wait Until Element Is Visible    ${Msgtime}   120s
    Tap   ${SendButn}
    ${Time}=  Get Text   ${Msgtime}
    Log To console  ${Time}
    Tap  ${CLback}
    Wait Until Element Is Visible    ${Visible_Home}  120s

