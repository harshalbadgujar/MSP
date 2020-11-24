*** Settings ***
Library    AppiumLibrary
Library    String
Library	   OperatingSystem
Resource    ../../Locator/HomePage.resource
Resource    ../../Locator/QRscan.resource


*** Keywords ***

To verify QR receive page
       wait until element is visible  ${Hamburgerbtn}   10s
       Tap    ${Hamburgerbtn}
       wait until element is visible  ${hamreceive}   5s
       tap  ${hamreceive}
       wait until element is visible   ${receivelabel}   5s
       ${getlabel}     get text  ${receivelabel}
       # check if receive screen is open
       ${check}     run keyword and return status  should be equal  ${getlabel}    ${acptlabel}
       run keyword if  ${check}      log to console  Receive screen is displayed
       # check user is merchant and close receive page
       ${check1}   run keyword and return status    wait until page does not contain element  ${receivecross}   5s
       run keyword if  ${check1}    scroll    ${receivelabel}     ${qrreceivebelow}
       # check user is customer and close recieve page
       ${check2}    run keyword and return status  wait until element is visible  ${receivecross}    5s
       run keyword if   ${check2}     Tap    ${receivecross}

To verify pay QR page
       #wait until element is visible       ${Hamburgerbtn}   10s
       #Tap    ${Hamburgerbtn}
       wait until element is visible    ${homepay}    5s
       # click on pay option from home page
       Tap   ${homepay}
       wait until element is visible  ${paylabel}    5s
       ${getpaylabel}    get text  ${paylabel}
       # check if pay screen is open
       ${check}     run keyword and return status  should be equal  ${getpaylabel}     ${actpaylabel}
       run keyword if  ${check}     log to console  Pay screen is displayed
       Tap   ${payclose}

To generate QR by setting amount
       wait until element is visible  ${Hamburgerbtn}   10s
       Tap    ${Hamburgerbtn}
       wait until element is visible  ${hamreceive}   5s
       # click on receive option
       tap  ${hamreceive}
       wait until element is visible  ${setamount}   5s
       # set the amount
       Tap    ${setamount}
       wait until element is visible  ${setamtfield}    5s
       input text  ${setamtfield}     10
       Tap    ${keyboarddone}
       wait until element is visible  ${payconfirmbtn}   3s
       # generate the set amount QR
       Tap    ${payconfirmbtn}
       # check if user is merchant and close the receive page
       ${check1}   run keyword and return status    wait until page does not contain element  ${receivecross}   5s
       run keyword if  ${check1}    scroll    ${receivelabel}     ${qrreceivebelow}
       # check if user is customer and close the receive page
       ${check2}    run keyword and return status  wait until element is visible  ${receivecross}    5s
       run keyword if   ${check2}     Tap    ${receivecross}



