*** Settings ***
Library     AppiumLibrary
Library     String
Library     Trial.py
*** Variables ***
${dbdriver} =  MySQL ODBC 5.3 Unicode Driver
${dbName} =      ESCROW
${dbUsername} =  qa_th_escrow
${dbPassword} =  Qa@2c2pth
${dbHost} =      mysql-uat-db.cluster-citbciuqq394.ap-southeast-1.rds.amazonaws.com
${dbPort} =      3306
*** Test Cases ***
Fetch Value
    ${queryresult} =  return_row  select * from Address where Id=5  ${dbname}  ${dbusername}  ${dbpassword}  ${dbhost}  ${dbport}  ${dbdriver}
    log to console   RECORD_COUNT = ${queryresult}[4]
#   ${check} =  convert to integer  ${queryresult}[0]
#   log to console  ${check}