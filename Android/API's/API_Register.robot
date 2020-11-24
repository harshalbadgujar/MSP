*** Settings ***
Library     RequestsLibrary
Library     JsonValidator
Library     AppiumLibrary
Resource    Resources/Login_To_MSP.robot
Library     String
Library     Resources/DB_Config.py
*** Variables ***
${dbdriver} =    ODBC Driver 17 for SQL Server
${dbName} =      GIP_UAT
${dbUsername} =  qa_aloha
${dbPassword} =  qa_aloha@12
${dbHost} =      172.31.3.36
${dbPort} =      5432
${burl_OTP_request} =   https://fmm27xh7a6.execute-api.ap-southeast-1.amazonaws.com/UAT/AppController
${burl_OTP} =           https://fmm27xh7a6.execute-api.ap-southeast-1.amazonaws.com/UAT/AppController
${burl_Register} =      https://fmm27xh7a6.execute-api.ap-southeast-1.amazonaws.com/UAT/AppController
${burl_Set_Passcode} =  https://fmm27xh7a6.execute-api.ap-southeast-1.amazonaws.com/UAT/AppController
${url_Login} =          https://fmm27xh7a6.execute-api.ap-southeast-1.amazonaws.com/UAT/AppController
${Token}
${Prefix}
${OTP}
${New_Number}
${PrefixForOTP}
${VID}
*** Test Cases ***
Registration_Process
  :FOR  ${i}  IN RANGE  1   2
    \   Auth Token
    \   OTP request
    \   Fetch OTP
    \   OTP
    \   Register by API   ${i}
    \   Set Passcode
    \   Login
*** Keywords ***
Auth Token
    ${headers}=  create dictionary  Content-Type=application/json
    ${Data}=  create dictionary    uid=09405175245
    create session  GetToken  https://us-central1-mandalay-smart-wallet.cloudfunctions.net
    ${response}=  post request  GetToken   /apis/getUserToken     headers=${headers}   data=${Data}
    Log to console    ${response.json()['token']}
    Set Global variable   ${Token}       ${response.json()['token']}
OTP request
     ${Gen_Mo}=   Generate Random String  9  	[NUMBERS]
     Set Global variable   ${New_Number}       ${Gen_Mo}
     Log to console     09${New_Number}
     ${headers}=  create dictionary  Content-Type=application/json     Authorization=Bearer ${Token}
     ${Data}=  create dictionary    companyId=008    deviceId=3C4FB659BF1F8CFD-584A-42A4-A8F9-D524A7C6C3A2     email=      mobileCountryCode=95     mobileNo=09${New_Number}    requestBy=1     verifyType=1
     create session  OTP_Request   ${burl_OTP_request}
    ${response}=  post request  OTP_Request   /v1/gip/api/v2/OTP/Request     headers=${headers}   data=${Data}
    Set Global variable   ${PrefixForOTP}       ${response.json()['otpPrefix']}
    Set Global variable   ${Prefix}       '${response.json()['otpPrefix']}'
    log to console     ${Prefix}
Fetch OTP
   @{queryresult} =  return_row   select TOP 1 * from OTP where OTP_Prefix= ${Prefix} order by ID desc  ${dbname}  ${dbusername}  ${dbpassword}  ${dbhost}  ${dbport}  ${dbdriver}
   log to console   OTP_Prefix @{queryresult}[4]
   log to console   OTP_Value @{queryresult}[5]
   Set Global variable   ${OTP}       @{queryresult}[5]
   log to console    ${OTP}check
OTP
   Log to console     09${New_Number}
   ${headers}=  create dictionary  Content-Type=application/json     Authorization=Bearer ${Token}
   ${Data}=  create dictionary    companyId=008   email=      mobileCountryCode=95     mobileNo=09${New_Number}   otp=${OTP}   otpPrefix=${PrefixForOTP}   requestBy=1
   create session  OTPt   ${burl_OTP}
   ${response}=  post request  OTPt   /v1/gip/api/v2/OTP     headers=${headers}   data=${Data}
    Set Global variable   ${VID}       ${response.json()['otpVerificationId']}
Register by API
     [Arguments]           ${count}
      Register   ${count}
Register
   [Arguments]   ${count}
   ${Pass_Gen}=   Generate Random String  6  	[NUMBERS]
   ${headers}=  create dictionary  Content-Type=application/json     Authorization=Bearer ${Token}
   ${Data}=  create dictionary    companyId=008    dateOfBirth=    email=09${New_Number}-msw-user@2c2p.com    firstNameEng=UserForNoti${count}     firstNameLocal=UserForNoti${count}    idCardBackNumber=     idNumber=RR${Pass_Gen}    languageCode=EN     lastNameEng=     lastNameLocal=     mobileCountryCode=95    mobileNo=09${New_Number}     nationalityId=7    occupationId=      otpVerificationId=${VID}   registerChannelId=1   title=   typeOfId=3    userDefine1=   userDefine2=    workplaceName=
    create session  Registration   ${burl_Register}
    ${response}=  post request  Registration   /v1/customer/registration     headers=${headers}   data=${Data}
    log to console  ${response.text}
Set Passcode
     ${headers}=  create dictionary  Content-Type=application/json     Authorization=Bearer ${Token}
     ${Data}=  create dictionary    companyId=008    deviceId=3C4FB659BF1F8CFD-584A-42A4-A8F9-D524A7C6C3A2    email=    mobileCountryCode=95    mobileNo=09${New_Number}   passcode=111111   requestBy=1
     create session  SetPass   ${burl_Set_Passcode}
     ${response}=  put request  SetPass   /v1/gip/api/v2/passcode     headers=${headers}   data=${Data}
     log to console  ${response.content}
     log to console  ${response}
Login
     ${headers}=  create dictionary  Content-Type=application/json     Authorization=Bearer ${Token}
     ${Data}=  create dictionary    deviceId=9781B7A7-4286-4E5E-890C-6E67C613F5A0    deviceOS=android    deviceToken=100bafbb2fb0a1e910e4799a6ddb3a66b1cc6dc6bb6fb38201d34696e61fd63b  email=09${New_Number}-msw-user@2c2p.com     mobileCountryCode=95    mobileNo=09${New_Number}   passcode=111111
     create session  Login   ${url_Login}
     ${response}=  post request  Login     /v1/customer/login     headers=${headers}   data=${Data}
     log to console  ${response.text}
     Should Be Equal As Strings    ${response.status_code}    200
     Should be Equal as Strings    ${response.json()['resDescription']}    Success
     Should be Equal as Strings    ${response.json()['responseCode']}    000