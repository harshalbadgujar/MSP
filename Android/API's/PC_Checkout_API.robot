*** Settings ***
Library  hash.py
Library  RequestsLibrary
Library  JsonValidator
Library  String
*** Variables ***
${Amount} =      12.00
${Note} =        API_PC_Checkout
${CustomerMo} =  096417686
${Merchant_Token}
${Customer_Login}
${HashKey}
*** Test Cases ***
Hash_Key_geneartion
    ${paycodeReq} =  Generate Random String  11  	[UPPER]
    Log to Console  ${paycodeReq}
    Set Global variable   ${payCode}       ${paycodeReq}
    ${result} =   create_sha256_signature  8ac762bce424430fa8c693c22e08aad2     ${Amount}${Note}${paycodeReq}
    log to console  ${result}
    Set Global variable   ${HashKey}       ${result}

Token for Merchant
    ${headers}=  create dictionary  Content-Type=application/x-www-form-urlencoded    Authorization=Basic M2l0YTVoNGZraTA4dWZpdWd1OXFsOXRhaWY6MWNjN3AydDR0NHZxNGRhN2ZrNzRmaG1xYzgxcmt1aWc5NGhmNGVqNzZhdW1razI0dHBqZg==    Accept=application/json
    create session  GetToken    https://msw.auth.ap-southeast-1.amazoncognito.com/oauth2
    ${responseA}=  post request  GetToken    /token?grant_type=client_credentials     headers=${headers}
    Log to console    ${responseA.json()['access_token']}
    Set Global variable   ${Merchant_Token}       ${responseA.json()['access_token']}

Geneate Merchant QR
    ${headers}=  create dictionary  clientId=3ita5h4fki08ufiugu9ql9taif   clientSecret=1cc7p2t4t4vq4da7fk74fhmqc81rkuig94hf4ej76aumkk24tpjf    Authorization=Bearer ${Merchant_Token}
    ${QR_Body}=  create dictionary    payCodeRequestId=${payCode}    amount=${Amount}    note=${Note}   checksum=${HashKey}
    create session  SetPass   https://hsggo2fbud.execute-api.ap-southeast-1.amazonaws.com/UAT/AppController
    ${responseQR}=  Post request  SetPass   /v2/qr     headers=${headers}   json=${QR_Body}
    Log to console    ${responseQR.json()['payCodeDetail']}
    Set Global variable   ${QRCODE}       ${responseQR.json()['payCodeDetail']}

Login to Customer Account
    ${headers}=  create dictionary  Content-Type=application/json
    ${Login_Number}=  create dictionary    uid=${CustomerMo}
    create session  Token  https://us-central1-mandalay-smart-wallet.cloudfunctions.net
    ${response}=  post request  Token   /apis/getUserToken     headers=${headers}   data=${Login_Number}
    Log to console    ${response.json()['token']}
    ${headers}=  create dictionary  Content-Type=application/json     Authorization=Bearer ${response.json()['token']}
    ${Login_Body}=  create dictionary    deviceId=9781B7A7-4286-4E5E-890C-6E67C613F5A0    deviceOS=android    deviceToken=100bafbb2fb0a1e910e4799a6ddb3a66b1cc6dc6bb6fb38201d34696e61fd63b  email=09${CustomerMo}-msw-user@2c2p.com     mobileCountryCode=95    mobileNo=${CustomerMo}   passcode=111111
    create session  Login    https://fmm27xh7a6.execute-api.ap-southeast-1.amazonaws.com/UAT/AppController
    ${resp}=  post request  Login     /v1/customer/login     headers=${headers}   data=${Login_Body}
    Log to console  ${resp.content}
    Set Global variable   ${Customer_Login}       ${resp.json()['token']}
    log to console  ${Customer_Login}
QR_Code_Transaction
    ${headers}=  create dictionary  clientId=3ita5h4fki08ufiugu9ql9taif   clientSecret=1cc7p2t4t4vq4da7fk74fhmqc81rkuig94hf4ej76aumkk24tpjf    Authorization=Bearer ${Customer_Login}
    ${TransactionQR}=  create dictionary    qrCode=${QRCODE}
    create session  Trans   https://fmm27xh7a6.execute-api.ap-southeast-1.amazonaws.com/UAT
    ${responseTR}=  Post request  Trans   /AppController/v1/emvqr     headers=${headers}   json=${TransactionQR}
    log to console  ${responseTR.text}
    Should be Equal as Strings    ${responseTR.json()['responseDesc']}    Success
    Should be Equal as Strings    ${responseTR.json()['amount']}         ${Amount}