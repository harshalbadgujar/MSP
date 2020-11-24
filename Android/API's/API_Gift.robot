*** Settings ***
Library     RequestsLibrary
Library     JsonValidator
Library     AppiumLibrary
Library     String
Library     Collections
Library     XML
Library     String
Library   OperatingSystem
*** Variables ***
${burl} =  https://fmm27xh7a6.execute-api.ap-southeast-1.amazonaws.com/UAT
${Token}
${RequestUid}
${RequestUid1}
*** Test Cases ***
Auth Token
    ${headers}=  create dictionary  Content-Type=application/json
    ${Data}=  create dictionary    uid=096417686
    create session  GetToken  https://us-central1-mandalay-smart-wallet.cloudfunctions.net
    ${response}=  post request  GetToken   /apis/getUserToken     headers=${headers}   data=${Data}
    #log to console  ${response.content}
    Log to console    ${response.json()['token']}
    Set Global variable   ${Token}       ${response.json()['token']}

Gift_Enquiry
     ${headers}=  create dictionary  Content-Type=application/json     Authorization=Bearer ${Token}
     ${Det}=  create dictionary    Deno=10
     ${Data}=  create dictionary     billerCode=SWSGD     detail= ${Det}
     create session  Request   ${burl}
     ${response}=  post request   Request   /AppController/v1/Partner/Enquiry       headers=${headers}    data=${Data}
     log to console   ${response.json()['requestUid']}
     Set Global variable   ${RequestUid}       ${response.json()['requestUid']}
Gift_Confirm
     ${headers}=  create dictionary  Content-Type=application/json     Authorization=Bearer ${Token}
     ${Det}=  create dictionary    Deno=10
     ${Data}=  create dictionary     billerCode=SWSGD   enquiryRequestId=${RequestUid}   transactionAmount=11476.02    detail= ${Det}
     create session  Request   ${burl}
     ${response}=  post request   Request   /AppController/v1/Partner/Confirm       headers=${headers}    data=${Data}
     log to console   ${response.json()['responseDesc']}
     log to console  ${response}
     Should Be Equal As Strings    ${response.status_code}    200
     Should be Equal as Strings    ${response.json()['responseDesc']}    Success
     Should be Equal as Strings    ${response.json()['responseCode']}    000
