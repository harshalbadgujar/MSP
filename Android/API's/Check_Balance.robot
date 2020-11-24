*** Settings ***
Library     RequestsLibrary
Library     JsonValidator
Library     AppiumLibrary
Library     String
*** Variables ***
${Requestfortoken}=  https://uat-oauth.2c2p.com/oauth
${Request} =   http://172.31.1.147/GIPBackend/api/v1
${Token}
*** Test Cases ***
Fetch Token
    ${headers}=  create dictionary  Content-Type=application/x-www-form-urlencoded   Authorization=Basic TVdHOnNZOG45UGxQaTQwWGpHRml5WFNSREo=   Accept=application/json
    ${Data}=  create dictionary     grant_type=client_credentials
    create session  GetToken   ${Requestfortoken}
    ${response}=  post request  GetToken   /token     headers=${headers}   data=${Data}
    log to console   ${response.json()['access_token']}
    Set Global variable   ${Token}       ${response.json()['access_token']}

GIP Balance API
    ${headers}=  create dictionary  Content-Type=application/json   Authorization=Bearer ${Token}
    ${Data}=  create dictionary    companyId=008    customerId=28902
    create session  GetBalance   ${Request}
    ${response}=  post request  GetBalance   /wallet     headers=${headers}   data=${Data}
    log to console    ${response}
    Log to console    ${response.json()['walletData']['availableBalance']}
    ${Decimal} =   Fetch From Left	  ${response.json()['walletData']['availableBalance']}     .
    log to console   ${Decimal}

