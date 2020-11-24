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
Eload_Datapacke_Enquiry_Telenor
     ${headers}=  create dictionary  Content-Type=application/json     Authorization=Bearer ${Token}
     ${Det}=  create dictionary    Deno=799     MobileNumber=09777749700
     ${Data}=  create dictionary     billerCode=TelenorDataPack     detail= ${Det}
     create session  Request   ${burl}
     ${response}=  post request   Request   /AppController/v1/Partner/Enquiry       headers=${headers}    data=${Data}
     log to console   ${response.json()['requestUid']}
     Set Global variable   ${RequestUid}       ${response.json()['requestUid']}
Eload_datapack_Confirm_Telenor
     ${headers}=  create dictionary  Content-Type=application/json     Authorization=Bearer ${Token}
     ${Det}=  create dictionary    Deno=799     MobileNumber=09777749700
     ${Data}=  create dictionary     billerCode=TelenorDataPack   enquiryRequestId=${RequestUid}   transactionAmount=799    detail= ${Det}
     create session  Request   ${burl}
     ${response}=  post request   Request   /AppController/v1/Partner/Confirm       headers=${headers}    data=${Data}
     log to console   ${response.json()['responseDesc']}
     log to console  ${response}
     Should Be Equal As Strings    ${response.status_code}    200
     Should be Equal as Strings    ${response.json()['responseDesc']}    Success
     Should be Equal as Strings    ${response.json()['responseCode']}    000
Eload_Datapacke_Enquiry_MPTDataPack
     ${headers}=  create dictionary  Content-Type=application/json     Authorization=Bearer ${Token}
     ${Det}=  create dictionary    packageCode=Night_Bolt-ons_1G
     ${Data}=  create dictionary     billerCode=MPTDataPack     detail= ${Det}
     create session  Request   ${burl}
     ${response}=  post request   Request   /AppController/v1/Partner/Enquiry       headers=${headers}    data=${Data}
     log to console   ${response.json()['requestUid']}
     Set Global variable   ${RequestUid1}       ${response.json()['requestUid']}
Eload_datapack_Confirm_MPTDataPack
     ${headers}=  create dictionary  Content-Type=application/json     Authorization=Bearer ${Token}
     ${Det}=  create dictionary    endUserId=09442627391      packageCode=Night_Bolt-ons_1G      Price=899.0
     ${Data}=  create dictionary     billerCode=MPTDataPack   enquiryRequestId=${RequestUid1}   transactionAmount=899.00    detail= ${Det}
     create session  Request1   ${burl}
     ${response}=  post request   Request1   /AppController/v1/Partner/Confirm       headers=${headers}    data=${Data}
     log to console   ${response.json()['responseDesc']}
     log to console  ${response}
     Should Be Equal As Strings    ${response.status_code}    200
     Should be Equal as Strings    ${response.json()['responseDesc']}    Success
     Should be Equal as Strings    ${response.json()['responseCode']}    000
Eload_datapack_enquiry_Ooredo
      ${headers}=  create dictionary  Content-Type=application/json     Authorization=Bearer ${Token}
     ${Det}=  create dictionary    Deno=999      MobileNumber=09964233241
     ${Data}=  create dictionary     billerCode=OoredooDataPack     detail= ${Det}
     create session  Request   ${burl}
     ${response}=  post request   Request   /AppController/v1/Partner/Enquiry       headers=${headers}    data=${Data}
     log to console   ${response.json()['requestUid']}
     Set Global variable   ${RequestUid2}       ${response.json()['requestUid']}
Eload_datapack_Confirm_Ooredo
     ${headers}=  create dictionary  Content-Type=application/json     Authorization=Bearer ${Token}
     ${Det}=  create dictionary    MSISDN=09972649400        OfferId=95100105
     ${Data}=  create dictionary     billerCode=OoredooDataPack   enquiryRequestId=${RequestUid2}   transactionAmount=999.0    detail= ${Det}
     create session  Request1   ${burl}
     ${response}=  post request   Request1   /AppController/v1/Partner/Confirm       headers=${headers}    data=${Data}
     log to console   ${response.json()['responseDesc']}
     log to console  ${response}
     Should Be Equal As Strings    ${response.status_code}    200
     Should be Equal as Strings    ${response.json()['responseDesc']}    Success
     Should be Equal as Strings    ${response.json()['responseCode']}    000
Eload_datapack_enquiry_Mytel
     ${headers}=  create dictionary     Content-Type=application/json     Authorization=Bearer ${Token}
     ${Det}=      create dictionary     Package=1000 MB      Deno=1050    MobileNumber=09691009765
     ${Data}=     create dictionary     billerCode=MyTelDataPack     detail= ${Det}
     create session  Request   ${burl}
     ${response}=  post request   Request   /AppController/v1/Partner/Enquiry       headers=${headers}    data=${Data}
     log to console   ${response.text}
     log to console   ${response.json()['requestUid']}
     Set Global variable   ${RequestUid3}       ${response.json()['requestUid']}
Eload_datapack_Confirm_Mytel
     ${headers}=  create dictionary  Content-Type=application/json     Authorization=Bearer ${Token}
     ${Det}=  create dictionary    Package=1000 MB        Deno=1050   MobileNumber=09694504895
     ${Data}=  create dictionary     billerCode=MyTelDataPack   enquiryRequestId=${RequestUid3}   transactionAmount=1071.00    detail= ${Det}
     create session  Request1   ${burl}
     ${response}=  post request   Request1   /AppController/v1/Partner/Confirm       headers=${headers}    data=${Data}
     log to console   ${response.json()['responseDesc']}
     log to console  ${response}
     Should Be Equal As Strings    ${response.status_code}    200
     Should be Equal as Strings    ${response.json()['responseDesc']}    Success
     Should be Equal as Strings    ${response.json()['responseCode']}    000
Eload_datapack_Enquiry_Deno_MPTeLoad
     ${headers}=  create dictionary     Content-Type=application/json     Authorization=Bearer ${Token}
     ${Det}=      create dictionary     Deno=1000      MobileNumber=09421022637
     ${Data}=     create dictionary     billerCode=MPTeLoad     detail= ${Det}
     create session  Request   ${burl}
     ${response}=  post request   Request   /AppController/v1/Partner/Enquiry       headers=${headers}    data=${Data}
     log to console   ${response.json()['requestUid']}
     Set Global variable   ${RequestUid4}       ${response.json()['requestUid']}
Eload_datapack_Confirm_Deno_MPTeLoad
     ${headers}=  create dictionary  Content-Type=application/json     Authorization=Bearer ${Token}
     ${Det}=  create dictionary      Deno=1000   MobileNumber=09421022637
     ${Data}=  create dictionary     billerCode=MPTeLoad   enquiryRequestId=${RequestUid4}   transactionAmount=1000.00    detail= ${Det}
     create session  Request1   ${burl}
     ${response}=  post request   Request1   /AppController/v1/Partner/Confirm       headers=${headers}    data=${Data}
     log to console   ${response.json()['responseDesc']}
     log to console  ${response}
     Should Be Equal As Strings    ${response.status_code}    200
     Should be Equal as Strings    ${response.json()['responseDesc']}    Success
     Should be Equal as Strings    ${response.json()['responseCode']}    000
Eload_datapack_Enquiry_Deno_Telenor
     ${headers}=  create dictionary     Content-Type=application/json     Authorization=Bearer ${Token}
     ${Det}=      create dictionary     Deno=1000      MobileNumber=09795404895
     ${Data}=     create dictionary     billerCode=TelenoreLoad     detail= ${Det}
     create session  Request   ${burl}
     ${response}=  post request   Request   /AppController/v1/Partner/Enquiry       headers=${headers}    data=${Data}
     log to console   ${response.json()['requestUid']}
     Set Global variable   ${RequestUid5}       ${response.json()['requestUid']}
Eload_datapack_Confirm_Deno_Telenor
     ${headers}=  create dictionary  Content-Type=application/json     Authorization=Bearer ${Token}
     ${Det}=  create dictionary      Deno=1000   MobileNumber=09795404895
     ${Data}=  create dictionary     billerCode=TelenoreLoad   enquiryRequestId=${RequestUid5}   transactionAmount=1000.00    detail= ${Det}
     create session  Request1   ${burl}
     ${response}=  post request   Request1   /AppController/v1/Partner/Confirm       headers=${headers}    data=${Data}
     log to console   ${response.json()['responseDesc']}
     log to console  ${response}
     Should Be Equal As Strings    ${response.status_code}    200
     Should be Equal as Strings    ${response.json()['responseDesc']}    Success
     Should be Equal as Strings    ${response.json()['responseCode']}    000