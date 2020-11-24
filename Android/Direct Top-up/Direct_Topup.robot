*** Settings ***
Library     ExcelLibrary
Library     Collections
Library     hash.py
Library     RequestsLibrary
Library     JsonValidator
Library     AppiumLibrary
Library     String
Library     Collections
Library     XML
Library     String
Library     OperatingSystem
*** Variables ***
${path_excel}   5k_noerror.xlsx   #D:\\Users\\thejav\\Desktop\\Robot_framework.xls
${Token}
${HashKey}
${CustomerID}
${WalletID}
${Amount} =       11111.00
${ReferenceID} =  af97831f-b4e1-441e-95d0-2906e4c6ff3e
*** Test Cases ***
Fetch Excel data
    #${my_data_as_list}=    Create List
    Open Excel Document     filename=${path_excel}     doc_id=Sheet1
    :For    ${i}    IN RANGE     5000       5002

    \    ${CID}     Read Excel Cell     row_num=${i}     col_num=1
    \    Set Global variable   ${CustomerID}       ${CID}
    \    log to console  ${CustomerID}
    \    ${CIF}     Read Excel Cell     row_num=${i}     col_num=2
    \    Set Global variable   ${WalletID}       ${CIF}
    \    log to console  ${WalletID}
    \    Hash Key
    \    Auth Token
    \    TOPUP API

    #\   Append To List    ${my_data_as_list}      ${clo1}   ${clo2}

*** Keywords ***

Hash Key
    ${result} =   create_sha256_signature  45329F4518E34A9098C289BC9C264C3C     008${CustomerID}${WalletID}${Amount}104${ReferenceID}Company
    log to console  ${result}
    Set Global variable   ${HashKey}       ${result}


Auth Token
    ${headers}=  create dictionary  Content-Type=application/x-www-form-urlencoded    Authorization=Basic TVdHOnNZOG45UGxQaTQwWGpHRml5WFNSREo=    Accept=application/json
    ${Data}=  create dictionary    grant_type=client_credentials
    create session  GetToken    https://uat-oauth.2c2p.com/oauth
    ${response}=  post request  GetToken    /token     headers=${headers}   data=${Data}
    #log to console  ${response.content}
    Log to console    ${response.json()['access_token']}
    Set Global variable   ${Token}       ${response.json()['access_token']}

TOPUP API
     ${headers}=  create dictionary  Content-Type=application/json     Authorization=Bearer ${Token}
     ${Data}=  create dictionary     walletId=${WalletID}    referenceId=${ReferenceID}    amount=${Amount}  currencyCode=104  note=${null}  userDefine1=${null}    userDefine2=${null}   userDefine3=${null}   userDefine4=${null}   userDefine5=Company   hashValue=${HashKey}  customerId=${CustomerID}   companyId=008
     create session  Request   https://uat-gip.2c2p.com/GIPBackend/api/v1
     ${response}=  post request   Request   /wallets/transactions/topup       headers=${headers}    data=${Data}
     log to console   ${response.json()['resDescription']}
     Should be Equal as Strings    ${response.json()['resDescription']}    Success

