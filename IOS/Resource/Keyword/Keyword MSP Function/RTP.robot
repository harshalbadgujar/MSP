*** Settings ***
Library    AppiumLibrary
Library    String
Library	   OperatingSystem
Resource    ../../Locator/HomePage.resource
Resource    ../../Locator/RTP.resource
Resource    ../Global Keyword.robot

*** Keywords ***

Send two pay request with customer login to merchant, low bal user and other customer
         # send pay request to customer, merchant and insufficent bal user two times one for pay and other for decline
         @{Acceptc} =  create list  098855228   100    For accept
         @{Acceptm} =  create list  098822558   100    For accept
         @{Declinec} =  create list  098855228   100    For decline
         @{Declinem} =  create list  098822558   100    For decline
         @{Insufficient} =  create list  0911228888    100   For insufficient

         :For  ${i}  ${j}  ${k}   IN     @{Acceptc}   @{Acceptm}    @{Declinec}    @{Declinem}    @{Insufficient}
       \   wait until element is visible  ${Hamburgerbtn}     10s
           #click on hamburger menu
       \   Tap    ${Hamburgerbtn}
       \   wait until element is visible  ${hamrtp}     5s
           #click on rtp option
       \   Tap   ${hamrtp}
       \   wait until element is visible  ${rtpphonenofield}   5s
            #enter mobile number
       \   input text    ${rtpphonenofield}     ${i}
       \   Tap   ${donekeypad}
            #enter amount
       \   input text   ${rtpamtfield}    ${j}
       \   Tap   ${donekeypad}
       \   sleep  3
       \   wait until element is visible    ${rtpdatefield}       20s
       \   Tap    ${rtpdatefield}
       \   wait until element is visible  ${date28}   5s
            #select date
       \   Tap    ${date28}
       \   Tap    ${dateconfirmbtn}
       \   wait until element is visible  ${rtpnotefield}   3s
            #enter note
       \   input text   ${rtpnotefield}     ${k}
       \   Tap    ${donekeypad}
       \   sleep   2s
            #click on confirm button
       \   Tap   ${rtpconfirmbtn}
       \   ${check}    run keyword and return status  wait until element is visible  ${rtppermission}   5s
       \   run keyword if  ${check}      tap   ${rtppermiokbtn}
       \   wait until element is visible  ${successok}   10s
            #click on ok button on success page
       \   Tap     ${successok}
           logout

Send two pay request with merchant login to customer, low bal user and accept the customer pay request
          # send pay request to customer and insufficient bal user and pay & decline the request send by customer
         @{Acceptc} =  create list  098855228   100    For accept
         @{Declinec} =  create list  098855228   100    For decline

         :For  ${i}  ${j}  ${k}   IN    @{Acceptc}     @{Declinec}
       \   wait until element is visible  ${Hamburgerbtn}     10s
           #click on hamburger menu
       \   Tap    ${Hamburgerbtn}
       \   wait until element is visible  ${hamrtp}     5s
       \   Tap   ${hamrtp}
       \   wait until element is visible  ${rtpphonenofield}   5s
       \   input text    ${rtpphonenofield}     ${i}
       \   Tap   ${donekeypad}
       \   input text   ${rtpamtfield}    ${j}
       \   Tap   ${donekeypad}
       \   sleep  3
       \   wait until element is visible    ${rtpdatefield}       20s
       \   Tap    ${rtpdatefield}
       \   wait until element is visible  ${date28}   5s
       \   Tap    ${date28}
       \   Tap    ${dateconfirmbtn}
       \   wait until element is visible  ${rtpnotefield}   3s
       \   input text   ${rtpnotefield}     ${k}
       \   Tap    ${donekeypad}
       \   sleep   2s
       \   Tap   ${rtpconfirmbtn}
       \   ${check}    run keyword and return status  wait until element is visible  ${rtppermission}   5s
       \   run keyword if  ${check}      tap   ${rtppermiokbtn}
       \   wait until element is visible  ${successok}   10s
       \   Tap     ${successok}

       #phone number from phone book
          wait until element is visible  ${Hamburgerbtn}     10s
           #click on hamburger menu
          Tap    ${Hamburgerbtn}
          wait until element is visible  ${hamrtp}     5s
          Tap   ${hamrtp}
          wait until element is visible  ${rtpphonebook}   5s
          # get mobile number from phonebook
          tap    ${rtpphonebook}
          # check for permission popup
          ${popup}   run keyword and return status  wait until element is visible  ${rtpaccesspopup}   5s
          run keyword if  ${popup}     tap    ${rtppopupok}
          wait until element is visible  ${insufino}   5s
          tap  ${insufino}
          #Tap   ${donekeypad}
          wait until element is visible  ${rtpamtfield}   5s
          input text   ${rtpamtfield}    10
          Tap   ${donekeypad}
          sleep  3
          wait until element is visible    ${rtpdatefield}       20s
          Tap    ${rtpdatefield}
          wait until element is visible  ${date28}   5s
          Tap    ${date28}
          Tap    ${dateconfirmbtn}
          wait until element is visible  ${rtpnotefield}   3s
          input text   ${rtpnotefield}     RTP
          Tap    ${donekeypad}
          sleep   2s
          Tap   ${rtpconfirmbtn}
          # checking for permission popup to save photos
          ${check}    run keyword and return status  wait until element is visible  ${rtppermission}   5s
          run keyword if  ${check}      tap   ${rtppermiokbtn}
          wait until element is visible  ${successok}   10s
          Tap     ${successok}

         #pay the request
         wait until element is visible   ${Notibtn}   10s
         # click on the notification menu
         Tap   ${Notibtn}
         wait until element is visible    ${firstcell}   5s
         # select first notification
         Tap   ${firstcell}
         wait until element is visible  ${paybtn}   5s
         # click on pay button
         Tap   ${paybtn}
         wait until element is visible  ${rtpscrolltop}    4s
         scroll  ${rtpscrollbottom}    ${rtpscrolltop}
         wait until element is visible   ${rtppayconfirmbtn}     3s
         # click on confirm button
         Tap    ${rtppayconfirmbtn}
         # entering passcode
         wait until element is visible    //XCUIElementTypeStaticText[@name="title_label"]    20s
         Tap   //XCUIElementTypeKey[@name="1"]
         Tap   //XCUIElementTypeKey[@name="1"]
         Tap   //XCUIElementTypeKey[@name="1"]
         Tap   //XCUIElementTypeKey[@name="1"]
         Tap   //XCUIElementTypeKey[@name="1"]
         Tap   //XCUIElementTypeKey[@name="1"]
         Allow Permission
         wait until element is visible  ${sucetop}     5s
         scroll  ${sucebottom}     ${sucetop}
         wait until element is visible  ${rtpbackhome}   3s
         Tap    ${rtpbackhome}
         #decline the request
         wait until element is visible   ${Notibtn}   10s
         Tap   ${Notibtn}
         wait until element is visible    ${firstcell}   5s
         Tap   ${firstcell}
         wait until element is visible   ${declinebtn}   5s
         # select decline option
         Tap   ${declinebtn}
         wait until element is visible  //XCUIElementTypeButton[@name="Decline"]     5s
         Tap    //XCUIElementTypeButton[@name="Decline"]
         wait until element is visible  ${notibackarrow}    4s
         Tap   ${notibackarrow}
         Logout

Pay and decline the request received by the customer

          #pay the request
       :FOR  ${i}  IN RANGE  1   3
       \   wait until element is visible   ${Notibtn}   10s
       \   Tap   ${Notibtn}
       \   wait until element is visible    ${firstcell}   5s
       \   Tap   ${firstcell}
       \   wait until element is visible  ${paybtn}   5s
       \   Tap   ${paybtn}
       \   wait until element is visible  ${rtpscrolltop}    4s
       \   scroll  ${rtpscrollbottom}    ${rtpscrolltop}
       \   wait until element is visible   ${rtppayconfirmbtn}     3s
       \   Tap    ${rtppayconfirmbtn}
       \   wait until element is visible    //XCUIElementTypeStaticText[@name="title_label"]    20s
       \   Tap   //XCUIElementTypeKey[@name="1"]
       \   Tap   //XCUIElementTypeKey[@name="1"]
       \   Tap   //XCUIElementTypeKey[@name="1"]
       \   Tap   //XCUIElementTypeKey[@name="1"]
       \   Tap   //XCUIElementTypeKey[@name="1"]
       \   Tap   //XCUIElementTypeKey[@name="1"]
       \   Allow Permission
       \   wait until element is visible  ${sucetop}     5s
       \   scroll  ${sucebottom}     ${sucetop}
       \   wait until element is visible  ${rtpbackhome}   3s
       \   Tap    ${rtpbackhome}

       #decline the request
      :FOR  ${j}  IN RANGE  1   3
      \   wait until element is visible   ${Notibtn}   10s
      \   Tap   ${Notibtn}
      \   wait until element is visible    ${firstcell}   5s
      \   Tap   ${firstcell}
      \   wait until element is visible   ${declinebtn}   5s
      \   Tap   ${declinebtn}
      \   wait until element is visible  //XCUIElementTypeButton[@name="Decline"]     5s
      \   Tap    //XCUIElementTypeButton[@name="Decline"]
      \   wait until element is visible  ${notibackarrow}    4s
      \   Tap   ${notibackarrow}
      logout

Verify RTP with insufficient balance user
         #check insufficent balance validation for RTP
         wait until element is visible   ${Notibtn}   10s
         Tap   ${Notibtn}
         wait until element is visible    ${firstcell}   5s
         Tap   ${firstcell}
         wait until element is visible  ${paybtn}   5s
         Tap   ${paybtn}
         wait until element is visible  ${rtpscrolltop}    4s
         scroll  ${rtpscrollbottom}    ${rtpscrolltop}
         wait until element is visible   ${rtppayconfirmbtn}     3s
         Tap    ${rtppayconfirmbtn}
         # get the error message
         ${geterrormsg}   get text  ${rtperror}
         # validate the error message
         ${check}   run keyword and return status  should be equal  ${geterrormsg}     ${actuallerror}
         run keyword if  ${check}     log to console  insufficient balance
         run keyword if  ${check}      log     insufficient balance
         tap  ${rtppopupok}

Verify RTP if no user number is entered
           wait until element is visible  ${Hamburgerbtn}     10s
           #click on hamburger menu
          Tap    ${Hamburgerbtn}
          wait until element is visible  ${hamrtp}     5s
          Tap   ${hamrtp}
          wait until element is visible  ${rtpamtfield}   5s
          input text   ${rtpamtfield}    10
          Tap   ${donekeypad}
          sleep  3
          wait until element is visible    ${rtpdatefield}       20s
          Tap    ${rtpdatefield}
          wait until element is visible  ${date28}   5s
          Tap    ${date28}
          Tap    ${dateconfirmbtn}
          wait until element is visible  ${rtpnotefield}   3s
          input text   ${rtpnotefield}     RTP
          Tap    ${donekeypad}
          sleep   2s
          # check next button is enabled
          ${check}    run keyword and return status  element should be disabled   ${rtpconfirmbtn}    5s
          run keyword if  ${check}   log to console    Next button is disabled
          scroll      ${rtptoplabel}     ${rtpnotefield}


