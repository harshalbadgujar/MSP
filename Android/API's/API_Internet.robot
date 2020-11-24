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
*** Test Cases ***
Auth Token
    ${headers}=  create dictionary  Content-Type=application/json
    ${Data}=  create dictionary    uid=096417686
    create session  GetToken  https://us-central1-mandalay-smart-wallet.cloudfunctions.net
    ${response}=  post request  GetToken   /apis/getUserToken     headers=${headers}   data=${Data}
    Log to console    ${response.json()['token']}
    Set Global variable   ${Token}       ${response.json()['token']}
Internet_Enquiry_HiWiFi
     ${headers}=  create dictionary  Content-Type=application/json     Authorization=Bearer ${Token}
     ${Det}=  create dictionary    Deno=1000    MobileNumber=09421133241
     ${Data}=  create dictionary     billerCode=HiWiFi     detail= ${Det}
     create session  Request   ${burl}
     ${response}=  post request   Request   /AppController/v1/Partner/Enquiry       headers=${headers}    data=${Data}
     log to console   ${response.json()['requestUid']}
     Set Global variable   ${RequestUid}       ${response.json()['requestUid']}
Internet_Confirm_HiWiFi
     ${headers}=  create dictionary  Content-Type=application/json     Authorization=Bearer ${Token}
     ${Det}=  create dictionary    Deno=1000     MobileNumber=09777749700
     ${Data}=  create dictionary     billerCode=HiWiFi   enquiryRequestId=${RequestUid}   transactionAmount=1010.00    detail= ${Det}
     create session  Request   ${burl}
     ${response}=  post request   Request   /AppController/v1/Partner/Confirm       headers=${headers}    data=${Data}
     log to console   ${response.json()['responseDesc']}
     log to console  ${response}
     Should Be Equal As Strings    ${response.status_code}    200
     Should be Equal as Strings    ${response.json()['responseDesc']}    Success
     Should be Equal as Strings    ${response.json()['responseCode']}    000
Internet__Enquiry_HiWiFi_W/o_Mobile
     ${headers}=  create dictionary  Content-Type=application/json     Authorization=Bearer ${Token}
     ${Det}=  create dictionary    Deno=1000
     ${Data}=  create dictionary     billerCode=HiWiFi     detail= ${Det}
     create session  Request   ${burl}
     ${response}=  post request   Request   /AppController/v1/Partner/Enquiry       headers=${headers}    data=${Data}
     log to console   ${response.json()['requestUid']}
     Set Global variable   ${RequestUid1}       ${response.json()['requestUid']}

Internet_Confirm_HiWiFi_W/o_Mobile
     ${headers}=  create dictionary  Content-Type=application/json     Authorization=Bearer ${Token}
     ${Det}=  create dictionary    Deno=1000
     ${Data}=  create dictionary     billerCode=HiWiFi   enquiryRequestId=${RequestUid1}   fees=0    transactionAmount=1010.00    detail= ${Det}
     create session  Request   ${burl}
     ${response}=  post request   Request   /AppController/v1/Partner/Confirm       headers=${headers}    data=${Data}
     log to console   ${response.json()['responseDesc']}
     log to console  ${response}
     Should Be Equal As Strings    ${response.status_code}    200
     Should be Equal as Strings    ${response.json()['responseDesc']}    Success
     Should be Equal as Strings    ${response.json()['responseCode']}    000
Internet__Enquiry_MyanmarNetPrepaid
     ${headers}=  create dictionary  Content-Type=application/json     Authorization=Bearer ${Token}
     ${Det}=  create dictionary    Deno=1000    MobileNumber=09421133241
     ${Data}=  create dictionary     billerCode=MyanmarNetPrepaid     detail= ${Det}
     create session  Request   ${burl}
     ${response}=  post request   Request   /AppController/v1/Partner/Enquiry       headers=${headers}    data=${Data}
     log to console   ${response.json()['requestUid']}
     Set Global variable   ${RequestUid2}       ${response.json()['requestUid']}

Internet_Confirm_MyanmarNetPrepaid
     ${headers}=  create dictionary  Content-Type=application/json     Authorization=Bearer ${Token}
     ${Det}=  create dictionary    Deno=1000      MobileNumber=09421133241
     ${Data}=  create dictionary     billerCode=MyanmarNetPrepaid   enquiryRequestId=${RequestUid2}   fees=0    transactionAmount=1000.00    detail= ${Det}
     create session  Request   ${burl}
     ${response}=  post request   Request   /AppController/v1/Partner/Confirm       headers=${headers}    data=${Data}
     log to console   ${response.json()['responseDesc']}
     log to console  ${response}
     Should Be Equal As Strings    ${response.status_code}    200
     Should be Equal as Strings    ${response.json()['responseDesc']}    Success
     Should be Equal as Strings    ${response.json()['responseCode']}    000

Internet__Enquiry_TelenorFiber
     ${headers}=  create dictionary  Content-Type=application/json     Authorization=Bearer ${Token}
     ${Det}=  create dictionary     RegisteredMobileNo=09791001059
     ${Data}=  create dictionary     billerCode=TelenorFiber     detail= ${Det}
     create session  Request   ${burl}
     ${response}=  post request   Request   /AppController/v1/Partner/Enquiry       headers=${headers}    data=${Data}
     log to console   ${response.json()['requestUid']}
     Set Global variable   ${RequestUid3}       ${response.json()['requestUid']}

Internet_Confirm_TelenorFiber
     ${headers}=  create dictionary  Content-Type=application/json     Authorization=Bearer ${Token}
     ${Det}=  create dictionary    CustomerID=5002355     Amount=75000     Devices=868465034206555      product_id=10
     ${Data}=  create dictionary     billerCode=TelenorFiber   enquiryRequestId=${RequestUid3}    transactionAmount=75000     detail= ${Det}
     create session  Request   ${burl}
     ${response}=  post request   Request   /AppController/v1/Partner/Confirm       headers=${headers}    data=${Data}
     log to console   ${response.json()['responseDesc']}
     log to console  ${response}
     Should Be Equal As Strings    ${response.status_code}    200
     Should be Equal as Strings    ${response.json()['responseDesc']}    Success
     Should be Equal as Strings    ${response.json()['responseCode']}    000

Internet__Enquiry_TelenorWireless
     ${headers}=  create dictionary  Content-Type=application/json     Authorization=Bearer ${Token}
     ${Det}=  create dictionary     RegisteredMobileNo=09791001086
     ${Data}=  create dictionary     billerCode=TelenorWireless     detail= ${Det}
     create session  Request   ${burl}
     ${response}=  post request   Request   /AppController/v1/Partner/Enquiry       headers=${headers}    data=${Data}
     log to console   ${response.json()['requestUid']}
     Set Global variable   ${RequestUid4}       ${response.json()['requestUid']}

Internet_Confirm_TelenorWireless
     ${headers}=  create dictionary  Content-Type=application/json     Authorization=Bearer ${Token}
     ${Det}=  create dictionary    CustomerID=5002380     Amount=7000     Devices=868465034206550      product_id=8
     ${Data}=  create dictionary     billerCode=TelenorWireless   enquiryRequestId=${RequestUid4}    transactionAmount=7210     detail= ${Det}
     create session  Request   ${burl}
     ${response}=  post request   Request   /AppController/v1/Partner/Confirm       headers=${headers}    data=${Data}
     log to console   ${response.json()['responseDesc']}
     log to console  ${response}
     Should Be Equal As Strings    ${response.status_code}    200
     Should be Equal as Strings    ${response.json()['responseDesc']}    Success
     Should be Equal as Strings    ${response.json()['responseCode']}    000