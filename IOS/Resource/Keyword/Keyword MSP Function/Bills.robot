*** Settings ***
Library    AppiumLibrary
Library    String
Library	   OperatingSystem
Resource    ../../Locator/HomePage.resource
Resource    ../../Locator/Bills.resource


*** Keywords ***

Validate MESC and MCDC bills for invalid invoice number
          #invalid MCDC invoice number
          wait until element is visible    ${homebills}     10s
          Tap    ${homebills}
          wait until element is visible  ${MCDCbill}   5s
          Tap     ${MCDCbill}
          wait until element is visible  ${MCDCinvoicefield}   5s
          # enter invalid invoice number
          input text    ${MCDCinvoicefield}     123456789987654321
          tap  ${keyboarddone}
          wait until element is visible  ${billsconfirm}   5s
          Tap    ${billsconfirm}
          wait until element is visible  ${billserrormsg}     40s
          ${getbillserror}    get text    ${billserrormsg}
          # verifying the error message
          ${check}     run keyword and return status    should be equal  ${getbillserror}     ${actbillserror}
          run keyword if  ${check}     log to console  Incorrect invoice number
          Tap     ${billspopupok}

          # MCDC already paid invoice
          wait until element is visible  ${MCDCinvoicefield}   5s
          # clear prevoius text and enter paid invoice number
          clear text  ${MCDCinvoicefield}
          input text    ${MCDCinvoicefield}     082019040001020687
          tap  ${keyboarddone}
          wait until element is visible  ${billsconfirm}   5s
          Tap    ${billsconfirm}
          wait until element is visible  ${Abillserrormsg}      40s
          ${getbillserror}    get text    ${Abillserrormsg}
          # verifying error message
          ${check1}     run keyword and return status    should be equal  ${getbillserror}     ${actAbillserror}
          run keyword if  ${check1}     log to console  Already paid invoice number
          Tap     ${billspopupok}

          # Invoice number length lenght must be 18 digits
          wait until element is visible    ${MCDCinvoicefield}   5s
          clear text    ${MCDCinvoicefield}
          input text    ${MCDCinvoicefield}     123456789
          tap  ${keyboarddone}
          # verifying error message
          ${check2}    run keyword and return status  element should be disabled  ${billsconfirm}   5s
          run keyword if  ${check2}    log to console  Invoice number should be 18 digits
          Tap    ${billsbackbtn}
          sleep   3s

          #invalid MESC bill invoice number
          wait until element is visible  ${MESCbill}   5s
          Tap    ${MESCbill}
          wait until element is visible  ${mandalaydist}    5s
          # select the district
          tap    ${mandalaydist}
          wait until element is visible  ${paythicity}   5s
          # select the city
          tap  ${paythicity}
          wait until element is visible  ${MESCinvoicefield}   5s
          # enter invoice number
          input text  ${MESCinvoicefield}     0123456789
          tap  ${keyboarddone}
          wait until element is visible    ${billsconfirm}    5s
          Tap    ${billsconfirm}
          wait until element is visible     ${MESCerrormsg}    40s
          ${getMESCerrormsg}      get text  ${MESCerrormsg}
          # verify error message
          ${check3}     run keyword and return status  should be equal   ${getMESCerrormsg}        ${actMESCerror}
          run keyword if  ${check3}     log to console  invalid MESC invoice number
          Tap    ${billspopupok}
          wait until element is visible  ${MESCcrossbtn}    5s
          Tap   ${MESCcrossbtn}
          sleep  5s
          Tap    ${tapother}
         # scroll up       ${scrollmesc}



