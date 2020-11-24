*** Settings ***
Library     RequestsLibrary
Library     JsonValidator
Library     AppiumLibrary
Library     String
Library     JSONLibrary
Library     Collections
Library    RequestsLibrary
*** Variables ***
${burl} =  https://fmm27xh7a6.execute-api.ap-southeast-1.amazonaws.com/UAT
${Token}
${RequestUid}
${RequestUid1}
${RequestUid2}
${RequestUid3}
*** Test Cases ***
Auth Token
    ${headers}=  create dictionary  Content-Type=application/json
    ${Data}=  create dictionary    uid=096417686
    create session  GetToken  https://us-central1-mandalay-smart-wallet.cloudfunctions.net
    ${response}=  post request  GetToken   /apis/getUserToken     headers=${headers}   data=${Data}
    Log to console    ${response.json()['token']}
    Set Global variable   ${Token}       ${response.json()['token']}
Enquiry_CanalPlus
     ${headers}=  create dictionary  Content-Type=application/json     Authorization=Bearer ${Token}
     ${Det}=  create dictionary    Type=PackageChange   Process=VerifyRenewalOffer    CardNumber=014502763789   IdBase=Myandev   SubscriberNumber=2352351   ContractNumber=1  Package=RACCT19|RACCT19  Duration=1  SessionID=a3abcb46828cff79b151fa50193684fedfbef44d53
     ${Data}=  create dictionary     billerCode=CanalPlus     detail= ${Det}
     create session  Request   ${burl}
     ${response}=  post request   Request   /AppController/v1/Partner/Enquiry       headers=${headers}    data=${Data}
      log to console   ${response.json()['requestUid']}
     Set Global variable   ${RequestUid}       ${response.json()['requestUid']}
Confirm_CanalPlus
     ${headers}=  create dictionary  Content-Type=application/json     Authorization=Bearer ${Token}
     ${Det}=  create dictionary    Type=PackageChange   Process=VerifyRenewalOffer    CardNumber=014502763789   IdBase=Myandev   SubscriberNumber=2352351   ContractNumber=1  Package=RACCT19|RACCT19  Duration=1  SessionID=a3abcb46828cff79b151fa50193684fedfbef44d53  Amount=4900.00000
     ${Data}=  create dictionary     billerCode=CanalPlus   enquiryRequestId=${RequestUid}   transactionAmount=4900    detail= ${Det}
     create session  Request   ${burl}
     ${response}=  post request   Request   /AppController/v1/Partner/Confirm       headers=${headers}    data=${Data}
     log to console   ${response.json()['responseDesc']}
     log to console  ${response}
     Should Be Equal As Strings    ${response.status_code}    200
     Should be Equal as Strings    ${response.json()['responseDesc']}    Success
     Should be Equal as Strings    ${response.json()['responseCode']}    000
Enquiry_Viu
     ${headers}=  create dictionary  Content-Type=application/json     Authorization=Bearer ${Token}
     ${Det}=  create dictionary    Deno=1500   MobileNumber=
     ${Data}=  create dictionary     billerCode=Viu    detail= ${Det}
     create session  Request   ${burl}
     ${response}=  post request   Request   /AppController/v1/Partner/Enquiry       headers=${headers}    data=${Data}
     log to console   ${response.json()['requestUid']}
     Set Global variable   ${RequestUid1}       ${response.json()['requestUid']}

Confirm_Viu
     ${headers}=  create dictionary  Content-Type=application/json     Authorization=Bearer ${Token}
     ${Det}=  create dictionary    Deno=1500   MobileNumber=09421133241
     ${Data}=  create dictionary     billerCode=Viu   enquiryRequestId=${RequestUid1}   transactionAmount=1500    detail= ${Det}
     create session  Request   ${burl}
     ${response}=  post request   Request   /AppController/v1/Partner/Confirm       headers=${headers}    data=${Data}
     log to console   ${response.json()['responseDesc']}
     log to console  ${response}
     Should Be Equal As Strings    ${response.status_code}    200
     Should be Equal as Strings    ${response.json()['responseDesc']}    Success
     Should be Equal as Strings    ${response.json()['responseCode']}    000
Enquiry_Mahar
     ${headers}=  create dictionary  Content-Type=application/json     Authorization=Bearer ${Token}
     ${Det}=  create dictionary    Deno=1999    MobileNumber=09421133241
     ${Data}=  create dictionary     billerCode=Mahar     detail= ${Det}
     create session  Request   ${burl}
     ${response}=  post request   Request   /AppController/v1/Partner/Enquiry       headers=${headers}    data=${Data}
     log to console    ${response.content}
     log to console   ${response.json()['responseDesc']}
     log to console   ${response.json()['requestUid']}
     Set Global variable   ${RequestUid2}       ${response.json()['requestUid']}

Confirm_Mahar
     ${headers}=  create dictionary  Content-Type=application/json     Authorization=Bearer ${Token}
     ${Det}=  create dictionary    Deno=1999      MobileNumber=09421133241
     ${Data}=  create dictionary     billerCode=Mahar   enquiryRequestId=${RequestUid2}      transactionAmount=1999    detail= ${Det}
     create session  Request   ${burl}
     ${response}=  post request   Request   /AppController/v1/Partner/Confirm       headers=${headers}    data=${Data}
     log to console   ${response.json()['responseDesc']}
     log to console  ${response}
     Should Be Equal As Strings    ${response.status_code}    200
     Should be Equal as Strings    ${response.json()['responseDesc']}    Success
     Should be Equal as Strings    ${response.json()['responseCode']}    000

Enquiry_Lalakyi
     ${headers}=  create dictionary  Content-Type=application/json     Authorization=Bearer ${Token}
     ${Det}=  create dictionary     Deno=500        MobileNumber=09421133241
     ${Data}=  create dictionary     billerCode=LaLaKyi     detail= ${Det}
     create session  Request   ${burl}
     ${response}=  post request   Request   /AppController/v1/Partner/Enquiry       headers=${headers}    data=${Data}
     log to console   ${response.json()['requestUid']}
     Set Global variable   ${RequestUid3}       ${response.json()['requestUid']}

Confirm_Lalakyi
     ${headers}=  create dictionary  Content-Type=application/json     Authorization=Bearer ${Token}
     ${Det}=  create dictionary    Deno=500        MobileNumber=09421133241
     ${Data}=  create dictionary     billerCode=LaLaKyi    enquiryRequestId=${RequestUid3}    transactionAmount=500     detail= ${Det}
     create session  Request   ${burl}
     ${response}=  post request   Request   /AppController/v1/Partner/Confirm       headers=${headers}    data=${Data}
     log to console   ${response.json()['responseDesc']}
     log to console  ${response}
     Should Be Equal As Strings    ${response.status_code}    200
     Should be Equal as Strings    ${response.json()['responseDesc']}    Success
     Should be Equal as Strings    ${response.json()['responseCode']}    000