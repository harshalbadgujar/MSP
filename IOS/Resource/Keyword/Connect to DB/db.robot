*** Settings ***
Library    Collections
Library    DB_Config.py
Library    OperatingSystem
*** Variables ***
${dbdriver} =  ODBC Driver 17 for SQL Server
${dbName} =  GIP_UAT
${dbUsername} =  qa_aloha
${dbPassword} =  qa_aloha@12
${dbHost} =  172.31.3.36
${dbPort} =  5432
#${query} =  select TOP 1 * from OTP where OTP_Prefix= 'EWFB' order by ID desc

*** Keywords ***
Get OTP
   [Arguments]    ${OTPPrefix}
   @{queryresult} =  return_row  select TOP 1 * from OTP where OTP_Prefix= '${OTPPrefix}' order by ID desc  ${dbname}  ${dbusername}  ${dbpassword}  ${dbhost}  ${dbport}  ${dbdriver}
   log to console   OTP_Prefix @{queryresult}[4]
   log to console   OTP_Value @{queryresult}[5]
   log   OTP_Prefix @{queryresult}[4]
   log   OTP_Value @{queryresult}[5]
   [Return]    @{queryresult}[5]
   
Get InvoiceNo 
    ${invoiceNo}=    Query    SELECT Top 1 Invoice FROM QRCODE where invoice is not null order by CreateDatetime desc;
    Log    ${invoiceNo}[0][0] 
    [Return]    ${invoiceNo}[0][0]
    
Get wallet amount 
   [Arguments]    ${mobilenum}
   @{queryresult1} =  Return Row  select * from Customer where mobilenumber ='${mobilenum}' order by ID desc    ${dbname}    ${dbusername}    ${dbpassword}    ${dbhost}    ${dbport}    ${dbdriver}
   Log    @{queryresult1}[0]
   @{queryresult2} =  Return Row  select * from Wallet where CustomerID ='@{queryresult1}[0]' order by ID desc    ${dbname}    ${dbusername}    ${dbpassword}    ${dbhost}    ${dbport}    ${dbdriver}
   Log    @{queryresult2}[2]
   [Return]    @{queryresult2}[2]
   
Get First Name Customer
   [Arguments]    ${mobilenum}
   @{queryresult1} =  Return Row  select * FROM [GIP_UAT].[dbo].[Customer] where MobileNumber = '${mobilenum}' and CompanyUniqueID = '256' and UserStatus = '1' order by ID desc    ${dbname}    ${dbusername}    ${dbpassword}    ${dbhost}    ${dbport}    ${dbdriver}
   Log    @{queryresult1}[3]
   [Return]    @{queryresult1}[3]
