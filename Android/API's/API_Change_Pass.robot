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
${burl_Register} =      https://fmm27xh7a6.execute-api.ap-southeast-1.amazonaws.com/UAT
${Token}
${Prefix}
${OTP}
${PrefixForOTP}
${VID}

*** Test Cases ***
Auth Token
    ${headers}=  create dictionary  Content-Type=application/json
    ${Data}=  create dictionary    uid=096417686
    create session  GetToken  https://us-central1-mandalay-smart-wallet.cloudfunctions.net
    ${response}=  post request  GetToken   /apis/getUserToken     headers=${headers}   data=${Data}
    ${Amount}=   Convert To String   ${response.text}
    ${rmvt}=      Remove String  ${Amount}  {"token":"
    ${PureToken}=      Remove String  ${rmvt}  "}
    log to console  ${PureToken}
    Set Global variable   ${Token}       ${PureToken}
OTP request
     ${headers}=  create dictionary  Content-Type=application/json     Authorization=Bearer ${Token}
     ${Data}=  create dictionary    companyId=008    deviceId=3C4FB659BF1F8CFD-584A-42A4-A8F9-D524A7C6C3A2     email=      mobileCountryCode=95     mobileNo=096417686    requestBy=1     verifyType=1
     create session  OTP_Request   ${burl_OTP_request}
    ${response}=  post request  OTP_Request   /v1/gip/api/v2/OTP/Request     headers=${headers}   data=${Data}
    log to console  ${response.text}
    ${OTP_Prefix}=      Remove String  ${response.text}  {"otpPrefix":"
    ${Raw_prefix}=  Fetch from left   ${OTP_Prefix}   "
    log to console  ${Raw_prefix}
    Set Global variable   ${PrefixForOTP}       ${Raw_prefix}
    ${Pure_prefix} =  Catenate  '${Raw_prefix}'
    Set Global variable   ${Prefix}       ${Pure_prefix}
Fetch OTP
   @{queryresult} =  return_row   select TOP 1 * from OTP where OTP_Prefix= ${Prefix} order by ID desc  ${dbname}  ${dbusername}  ${dbpassword}  ${dbhost}  ${dbport}  ${dbdriver}
   log to console   OTP_Prefix @{queryresult}[4]
   log to console   OTP_Value @{queryresult}[5]
   Set Global variable   ${OTP}       @{queryresult}[5]
   log to console    ${OTP}check
OTP
   ${headers}=  create dictionary  Content-Type=application/json     Authorization=Bearer ${Token}
   ${Data}=  create dictionary    companyId=008   email=      mobileCountryCode=95     mobileNo=096417686   otp=${OTP}   otpPrefix=${PrefixForOTP}   requestBy=1
    create session  OTPt   ${burl_OTP}
    ${response}=  post request  OTPt   /v1/gip/api/v2/OTP     headers=${headers}   data=${Data}
    log to console  ${response.text}
    ${OTP_Content}=      Remove String  ${response.text}  {"otpVerificationId":"
     LOG TO CONSOLE   ${OTP_Content}
    ${VeriID}=  Fetch from left   ${OTP_Content}   "
    log to console  ${VeriID}
    Set Global variable   ${VID}       ${VeriID}

Change passcode
   ${headers}=  create dictionary  Content-Type=application/json     Authorization=Bearer ${Token}
   ${Data}=  create dictionary    companyId=008     email=096417686-msw-user@2c2p.com      mobileCountryCode=95    mobileNo=096417686   newPasscode=111111    otpVerificationId=${VID}     requestBy=1
    create session  Registration   ${burl_Register}
    ${response}=  post request  Registration   /AppController/v1/gip/api/v1/setNewPasscode     headers=${headers}   data=${Data}
    log to console  ${response.text}
