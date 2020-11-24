*** Settings ***
Library    AppiumLibrary
Library    String
Library	   OperatingSystem
Library    RequestsLibrary
Resource    ../../Locator/HomePage.resource


*** Keywords ***

Check the top three transaction month
      # print the month of top 3 transaction
      scroll down  ${Check_Your_Transaction_Here}
      wait until element is visible  ${transactionmonth}    5s
      ${topmonth}    get text  ${transactionmonth}
      log to console  ${topmonth}

Verify the chat menu on home page
       scroll down  ${Check_Your_Transaction_Here}
       wait until element is visible    ${chatoption}    5s
       # click on chat option
       Tap    ${chatoption}
       wait until element is visible  ${chattextfield}    5s
       # input the message in text field on chat page
       input text  ${chattextfield}    Hi!!!
       Tap    ${Cdonekeypad}
       wait until element is visible  ${chatsend}    5s
       #send the message
       Tap    ${chatsend}
       # back to home page
       Tap   ${chatback}

Get the wallet balance from UI
       wait until element is visible  ${homebalance}   5s
       # get home page balance
       ${gethomebalance}    get text  ${homebalance}
       # remove unwanted strings like , and mmk
       ${remove}   remove string    ${gethomebalance}    ,
       ${removemmk}    remove string   ${remove}     MMK
       ${remove_space}=  Evaluate   '${removemmk}'.replace(' ','')
       ${Wallet_Bal} =   Fetch From Left    ${remove_space}      .
       log to console  ${Wallet_bal}
       set global variable      ${Walletbalance}      ${Wallet_bal}

Get Access token for GIP API
     # declare the header of the request
    ${headers}=  create dictionary  Content-Type=application/x-www-form-urlencoded   Authorization=Basic TVdHOnNZOG45UGxQaTQwWGpHRml5WFNSREo=   Accept=application/json
    # declare data of the request
    ${Data}=  create dictionary     grant_type=client_credentials
    # request url
    create session  GetToken   ${Requestfortoken}
    # hit the request
    ${response}=  post request  GetToken   /token     headers=${headers}   data=${Data}
    # print the response to console
    log to console   ${response.json()['access_token']}
    # set the token as global variable to use it in another method
    Set Global variable   ${Token}       ${response.json()['access_token']}

Get the wallet balance from GIP api
    ${headers}=  create dictionary  Content-Type=application/json   Authorization=Bearer ${Token}
    ${Data}=  create dictionary    companyId=008    customerId=30080
    create session  GetBalance   ${Request}
    ${response}=  post request  GetBalance   /wallet     headers=${headers}   data=${Data}
    log to console    ${response}
    Log to console    ${response.json()['walletData']['availableBalance']}
    # get the value before the decimal point
    ${GIP_Bal} =   Fetch From Left  ${response.json()['walletData']['availableBalance']}     .
    log to console   ${GIP_Bal}
    # compare the balance from home page and GIP API
    Should be Equal as Strings    ${GIP_Bal}      ${Walletbalance}
