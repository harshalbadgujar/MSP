*** Settings ***
Library     RequestsLibrary
Library     JsonValidator
Library     AppiumLibrary
Resource    Resources/Login_To_MSP.robot
Library     String
*** Variables ***
${burl} =  https://fmm27xh7a6.execute-api.ap-southeast-1.amazonaws.com/UAT
${url} =  /AppController/v1/transactions
${Transfer_amount}=   30
${note}=  BY API AUTIMATION
${Senders_Num}=  09798304852
${Receivers_num}=   096417686
${Token}
*** Test Cases ***
Fetch Token
    ${headers}=  create dictionary  Content-Type=application/json
    ${Data}=  create dictionary    uid=${Senders_Num}
    create session  Token  https://us-central1-mandalay-smart-wallet.cloudfunctions.net
    ${response}=  post request  Token   /apis/getUserToken     headers=${headers}   data=${Data}
    Log to console    ${response.json()['token']}
    Set Global variable   ${Token}       ${response.json()['token']}
Create Transfer Entry By API
	${headers}=  create dictionary  Content-Type=application/json    Authorization=Bearer ${Token}
	${Data}=  create dictionary    note=${note}     amount=${Transfer_amount}      receiverMobileNo=${Receivers_num}
	create session  mysession  ${burl}
	${response}=  post request  mysession  ${url}    headers=${headers}   data=${Data}
	Log to console  ${response.content}
	Log to console   ${response}
    Should Be Equal As Strings    ${response.status_code}    200
    Should be Equal as Strings    ${response.json()['responseDesc']}    Success
    Should be Equal as Strings    ${response.json()['responseCode']}    000