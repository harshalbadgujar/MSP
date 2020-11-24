***Variable***
${LocateEnterMobile}    id=mobile_textfield
${LocateCheckBoxAgree}    id=check_button
${ContinueButton}    id=continue_button
${LocateEnterFullName}    id=name_textfield
${PassportButton}    	//XCUIElementTypeButton[@name="passport_button"]
${NRCbutton}            //XCUIElementTypeButton[@name="nrc_button"]
${LocateEnterPassport}    xpath=//*[contains(@value, 'Enter passport no.')]
${ConfirmButton}    id=confirm_button
${OKbutton}    id=constructive_button
${LocateHambergeriCon}    id=burger_button
${LocateSetting}    id=SETTINGS
${locateEnterPasscodeFailed}    id=description_label
${keydone}               //XCUIElementTypeButton[@name="Done"]
${nameerror}             //XCUIElementTypeStaticText[@name="description_label"]
${actnameerror}          Please enter Name
${nameerrok}             //XCUIElementTypeButton[@name="constructive_button"]
${nrcerror}              //XCUIElementTypeStaticText[@name="description_label"]
${actnrcerror}           Please enter NRC information
${passerror}             //XCUIElementTypeStaticText[@name="description_label"]
${actpasserror}          Please enter Passport number
${setbackarrow}          //XCUIElementTypeButton[@name="Step 3/4"]
${setpasscodetext}       //XCUIElementTypeStaticText[@name="title_label"]
${username}              //XCUIElementTypeStaticText[@name="name_label"]
${actusername}           Robot Registration
${snumber}               //XCUIElementTypeStaticText[@name="mobile_no_label"]
${settingback}           //XCUIElementTypeButton[@name="Back"]
${homeusername}          //XCUIElementTypeButton[@name="user_name_label"]



