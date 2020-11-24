*** Settings ***
Library     RequestsLibrary
Library     JsonValidator
Library     AppiumLibrary
Library     String
Library     Resources/DB_Config.py
*** Variables ***
${burl} =  https://fmm27xh7a6.execute-api.ap-southeast-1.amazonaws.com/UAT
${Token}
${RequestUid}
${RequestUid1}
${RequestUid2}
${RequestUid3}
${RequestUid4}
${RequestUid5}

*** Test Cases ***
Auth Token
    ${headers}=  create dictionary  Content-Type=application/json
    ${Data}=  create dictionary    uid=096417686
    create session  GetToken  https://us-central1-mandalay-smart-wallet.cloudfunctions.net
    ${response}=  post request  GetToken   /apis/getUserToken     headers=${headers}   data=${Data}
     Log to console    ${response.json()['token']}
    Set Global variable   ${Token}       ${response.json()['token']}
Eload_Enquiry_MPTeLoad
     ${headers}=  create dictionary  Content-Type=application/json     Authorization=Bearer ${Token}
     ${Det}=  create dictionary    Deno=1000     MobileNumber=09421022637
     ${Data}=  create dictionary     billerCode=MPTeLoad     detail= ${Det}
     create session  Request   ${burl}
     ${response}=  post request   Request   /AppController/v1/Partner/Enquiry       headers=${headers}    data=${Data}
     log to console   ${response.json()['requestUid']}
     Set Global variable   ${RequestUid}       ${response.json()['requestUid']}
Eload_Confirm_MPTeLoad
     ${headers}=  create dictionary  Content-Type=application/json     Authorization=Bearer ${Token}
     ${Det}=  create dictionary    Deno=1000     MobileNumber=09421022637
     ${Data}=  create dictionary     billerCode=MPTeLoad   enquiryRequestId=${RequestUid}   transactionAmount=1000.00    detail= ${Det}
     create session  Request   ${burl}
     ${response}=  post request   Request   /AppController/v1/Partner/Confirm       headers=${headers}    data=${Data}
     log to console   ${response.json()['responseDesc']}
     log to console  ${response}
     Should Be Equal As Strings    ${response.status_code}    200
     Should be Equal as Strings    ${response.json()['responseDesc']}    Success
     Should be Equal as Strings    ${response.json()['responseCode']}    000
Eload_Enquiry_TelenoreLoad
     ${headers}=  create dictionary  Content-Type=application/json     Authorization=Bearer ${Token}
     ${Det}=  create dictionary     Deno=1000      MobileNumber=09795404895
     ${Data}=  create dictionary     billerCode=TelenoreLoad     detail= ${Det}
     create session  Request   ${burl}
     ${response}=  post request   Request   /AppController/v1/Partner/Enquiry       headers=${headers}    data=${Data}
     log to console   ${response.json()['requestUid']}
     Set Global variable   ${RequestUid1}       ${response.json()['requestUid']}
Eload_Confirm_TelenoreLoad
     ${headers}=  create dictionary  Content-Type=application/json     Authorization=Bearer ${Token}
     ${Det}=  create dictionary    Deno=1000      MobileNumber=09795404895
     ${Data}=  create dictionary     billerCode=TelenoreLoad   enquiryRequestId=${RequestUid1}   transactionAmount=1000.00    detail= ${Det}
     create session  Request1   ${burl}
     ${response}=  post request   Request1   /AppController/v1/Partner/Confirm       headers=${headers}    data=${Data}
     log to console   ${response.json()['responseDesc']}
     log to console  ${response}
     Should Be Equal As Strings    ${response.status_code}    200
     Should be Equal as Strings    ${response.json()['responseDesc']}    Success
     Should be Equal as Strings    ${response.json()['responseCode']}    000