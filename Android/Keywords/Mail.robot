*** Settings ***
Resource     ../Setting.robot
#Library   1_Mail_Robot.py
*** Test Cases ***
Create Directory
   Create Zip From Files In Directory    Results   Regression.zip
Sent Report

    send_report
    ...  harshal.bad@2c2pexternal.com
    ...  Harshal@123
    ...  prachaya@2c2p.com
    ...  Regression.zip
    ...  Regression.zip
    ...  Regression Report by automatic og build no 638
    ...  please find attchmnet