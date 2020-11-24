*** Settings ***
Resource     ../Setting.robot
*** Variables ***
${dbdriver} =    ODBC Driver 17 for SQL Server
${dbName} =      GIP_UAT
${dbUsername} =  qa_aloha
${dbPassword} =  qa_aloha@12
${dbHost} =      172.31.3.36
${dbPort} =      5432
${query} =       select TOP 1 * from OTP order by ID desc
*** Keywords ***
Fetch OTP
    Wait Until Element Is Visible    id=com.ccpp.msp.uat:id/tvRef   30s
   ${Fetch_Prefix}=  GET TEXT    id=com.ccpp.msp.uat:id/tvRef
   log to console  ${Fetch_Prefix}
   ${Prefix} =  Catenate  '${Fetch_Prefix}'
   @{queryresult} =  return_row  select TOP 1 * from OTP where OTP_Prefix= ${Prefix} order by ID desc  ${dbname}  ${dbusername}  ${dbpassword}  ${dbhost}  ${dbport}  ${dbdriver}
   log to console   OTP_Prefix @{queryresult}[4]
   log to console   OTP_Value @{queryresult}[5]
   log   OTP_Prefix @{queryresult}[4]
   log   OTP_Value @{queryresult}[5]
   @{otp_value} =  Split String To Characters  @{queryresult}[5]

   Tap    id=com.ccpp.msp.uat:id/otpView
   sleep   1s
   @{zero} =  create list  409   1727
   @{one} =  create list  127  1246
   @{two} =  create list  413   1272
   @{three} =  create list  678   1260
   @{four} =  create list  132   1426
   @{five} =  create list  413   1426
   @{six} =  create list  673   1426
   @{seven} =  create list  139   1570
   @{eight} =  create list  406   1570
   @{nine} =  create list  673   1570
   ${mappings} =  create dictionary  0=@{zero}   1=@{one}   2=@{two}   3=@{three}  4=@{four}   5=@{five}  6=@{six}   7=@{seven}  8=@{eight}   9=@{nine}

   :FOR  ${i}  IN RANGE  0  6
   \    ${num}=  Set Variable  @{otp_value}[${i}]
   \    Click Element at Coordinates   @{mappings['${num}']}[0]  @{mappings['${num}']}[1]
   \    Sleep   1s
   \    log  6
