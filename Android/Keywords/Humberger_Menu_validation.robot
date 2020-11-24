*** Settings ***
Resource     ../Setting.robot
*** Variable ***
${Login_Number} =  9798304852
${Requestfortoken}=  https://uat-oauth.2c2p.com/oauth
${Request} =   http://172.31.1.147/GIPBackend/api/v1
${Token}
${UIBal}
*** Keywords ***
Login to MSP for left menu Verification
  Invoke App   9798304852
Humberger_Menu_validation.To verify Left menu Transfer button
  Tap  ${Humberger_Menu}
  Wait Until Element Is Visible    ${Visible_Home}   120s
  Tap   ${Hum_Trans}
  Wait Until Element Is Visible   ${WalletTopup}    10s
  ${Transfer} =  get text   ${WalletTopup}
  log   ${Transfer}
  Should Be Equal As Strings   ${Transfer}   Mandalay Smart Pay
  Tap   ${Back_button}
  Wait Until Element Is Visible    ${Visible_Home}  30s
Humberger_Menu_validation.To verify Left menu scan button
  Tap  ${Humberger_Menu}
  Wait Until Element Is Visible    ${Visible_Home}   120s
  Tap   ${Hum_Scan}
  Allow_Pop-up
  Wait Until Element Is Visible   ${Toolbar}  10s
  ${Scan} =  get text   ${Toolbar}
  log   ${Scan}
  Should Be Equal As Strings   ${Scan}   SCAN & PAY
  Tap   ${Hum_Back}
  Wait Until Element Is Visible    ${Visible_Home}  30s
Humberger_Menu_validation.To verify Left menu Pay button
  Tap  ${Humberger_Menu}
  Wait Until Element Is Visible    ${Visible_Home}   120s
  Tap   ${Hum_pay}
  Wait Until Element Is Visible  ${Wallet_No}  10s
  ${Pay} =  get text   ${Wallet_No}
  log  ${Pay}
  Should Be Equal As Strings   ${Pay}   Wallet No: XXXXXXXXXXX161X
  Tap   ${HumbtnBack}
  Wait Until Element Is Visible    ${Visible_Home}  30s
Humberger_Menu_validation.To verify Left menu Receive button
  Tap  ${Humberger_Menu}
  Wait Until Element Is Visible    ${TransferButton}   120s
  Tap   ${Hum_rece}
  Wait Until Element Is Visible  ${ToolbarTitle}   10s
  ${Receive} =  get text   ${ToolbarTitle}
  log  ${Receive}
  Should Be Equal As Strings   ${Receive}   RECEIVE
  Tap   ${HumbtnBack}
  Wait Until Element Is Visible    ${Visible_Home}  30s
Humberger_Menu_validation.To verify Left menu Add_Money button
  Tap  ${Humberger_Menu}
  Wait Until Element Is Visible    ${Visible_Home}   120s
  Tap   ${Hum_AM}
  Wait Until Element Is Visible  ${Topuplimit}    10s
  ${Add Money} =  get text   ${Topuplimit}
  log  ${Add Money}
  Should Be Equal As Strings   ${Add Money}   Top up limit: MMK 1,000,000 / Transaction
  Press Keycode  4
  Wait Until Element Is Visible    ${Visible_Home}  30s
Humberger_Menu_validation.To verify Left menu ELOAD button
  Tap  ${Humberger_Menu}
  Wait Until Element Is Visible    ${Visible_Home}   120s
  Tap   ${Hum_eload}
  Wait Until Element Is Visible  ${Hum_EdtEld}     10s
  ${Eload} =  get text   ${Hum_EdtEld}
  log  ${Eload}
  Should Be Equal As Strings   ${Eload}   09798304852
  Press Keycode  4
  Wait Until Element Is Visible    ${Visible_Home}  30s
Humberger_Menu_validation.To verify Left menu Request to transfer button
  Tap  ${Humberger_Menu}
  Wait Until Element Is Visible    ${Visible_Home}   120s
  Tap   ${HUM_RTP}
  Wait Until Element Is Visible  ${HUM_iNDEX}     10s
  ${RTP} =  get text   ${HUM_iNDEX}
  log  ${RTP}
  Should Be Equal As Strings   ${RTP}   REQUEST TO PAY
  Press Keycode  4
  Wait Until Element Is Visible    ${Visible_Home}  30s
Humberger_Menu_validation.To verify Left menu Bills button
  Tap  ${Humberger_Menu}
  Wait Until Element Is Visible    ${Visible_Home}   120s
  Tap   ${HUM_BILLS}
  Wait Until Element Is Visible  ${H_BillerNm}     10s
  ${Bills} =  get text   ${H_BillerNm}
  log  ${Bills}
  Should Be Equal As Strings   ${Bills}   MCDC Bill
  Press Keycode  4
  Wait Until Element Is Visible    ${Visible_Home}  30s
Humberger_Menu_validation.To verify Left menu gift button
  Tap  ${Humberger_Menu}
  Wait Until Element Is Visible    ${Visible_Home}   120s
  Tap   ${Hum_Gifts}
  Wait Until Element Is Visible  ${HText_Date}     10s
  ${Gift} =  get text   ${HText_Date}
  log  ${Gift}
  Should Be Equal As Strings   ${Gift}   Game/Gifts Top-Up
  Press Keycode  4
  Wait Until Element Is Visible    ${Visible_Home}  30s
Humberger_Menu_validation.To verify Left menu Internet button
  Tap  ${Humberger_Menu}
  Wait Until Element Is Visible    ${Visible_Home}   120s
  Scroll    ${Hum_Gifts}      ${Hum_Trans}
  Tap   ${H_internet}
  Wait Until Element Is Visible  ${H_BillerNm}     10s
  ${Internet} =  get text   ${H_BillerNm}
  log  ${Internet}
  Should Be Equal As Strings   ${Internet}   Ananda
  Press Keycode  4
  Wait Until Element Is Visible    ${Visible_Home}  30s
Humberger_Menu_validation.To verify Left menu movie button
  Tap  ${Humberger_Menu}
  Wait Until Element Is Visible    ${Hum_Gifts}   120s
  Tap   ${H_Movie}
  Wait Until Element Is Visible  ${H_BillerNm}     10s
  ${Movie} =  get text   ${H_BillerNm}
  log  ${Movie}
  Should Be Equal As Strings   ${Movie}   Canal+
  Press Keycode  4
  Wait Until Element Is Visible    ${Visible_Home}  30s
Humberger_Menu_validation.To verify Left menu Goods and Services button
  Tap  ${Humberger_Menu}
  Wait Until Element Is Visible    ${Hum_Gifts}   120s
  Tap   ${h_Gnd}
  Wait Until Element Is Visible  ${txtTitleType}     10s
  ${Goods and Services} =  get text   ${txtTitleType}
  log   ${Goods and Services}
  Should Be Equal As Strings   ${Goods and Services}   GOODS AND SERVICES
  Press Keycode  4
  Wait Until Element Is Visible    ${Visible_Home}  30s

Humberger_Menu_validation.To verify Total balance and Add money balance verification
   ${TotalBal}=  Get Text   ${Avai_Bal}
   log to console    ${TotalBal}
   Tap    ${H_topup}
   Wait Until Element Is Visible     ${W_Bal}     120s
   ${Get_Balance} =   Get Text    ${W_Bal}
   Log to console   ${Get_Balance}
   Should Be Equal As Strings   ${TotalBal}    ${Get_Balance}
   Press Keycode                4
Humberger_Menu_validation.To verify Fetch balance from UI for cross check
   ${Available_Bal}=  Get Text  ${Avai_Bal}
   Log to console   ${Available_Bal}
   ${result} =   Fetch From Right	  ${Available_Bal}     K
   log to console   ${result}
   ${remove_space}=       Evaluate    '${result}'.replace(' ','')
   log to console   ${remove_space}
   ${remove_quama}=       Evaluate    '${remove_space}'.replace(',','')
   log to console    ${remove_quama}

   Set Global variable   ${UIBal}       ${remove_quama}
Humberger_Menu_validation.To verify Fetch Token for Balance get API
    ${headers}=  create dictionary  Content-Type=application/x-www-form-urlencoded   Authorization=Basic TVdHOnNZOG45UGxQaTQwWGpHRml5WFNSREo=   Accept=application/json
    ${Data}=  create dictionary     grant_type=client_credentials
    create session  GetToken   ${Requestfortoken}
    ${response}=  post request  GetToken   /token     headers=${headers}   data=${Data}
    log to console   ${response.json()['access_token']}
    Set Global variable   ${Token}       ${response.json()['access_token']}

Humberger_Menu_validation.To verify Assertion of GIP API balance and UI balance
    ${headers}=  create dictionary  Content-Type=application/json   Authorization=Bearer ${Token}
    ${Data}=  create dictionary    companyId=008    customerId=28902
    create session  GetBalance   ${Request}
    ${response}=  post request  GetBalance   /wallet     headers=${headers}   data=${Data}
    log to console    ${response}
    Log to console    ${response.json()['walletData']['availableBalance']}
    ${GIP_Bal} =   Fetch From Left	  ${response.json()['walletData']['availableBalance']}     .
    log to console   ${GIP_Bal}
    Should be Equal as Strings    ${GIP_Bal}      ${UIBal}


