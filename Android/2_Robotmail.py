import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from email.mime.base import MIMEBase
from email import encoders
import shutil
from os import path
from shutil import make_archive
from datetime import datetime
import os
'''
allow-less-secure from gmail settings - of sender 
also try disabling the two step verification --> if error encountered
'''

'''
Here we decide te name of test result file
'''
now = datetime.now()
dt_string = now.strftime("_Date:%d_%h_%y_Time:%H_%M")

'''
This section deals with zipping the test result file 
'''
# output_filename = 'TestReports' + str(dt_string)
# shutil.make_archive(output_filename, 'zip', 'Regression Result')
#
# fpath = os.path.basename(output_filename)
'''
This section deals with sending the report on MAIL
'''
# #address of sender
# fromaddr = "wed22jan@gmail.com"
# # address of receiver
# toaddr = ""
# tolist = ["rohit.kulkarni@perennialsys.com", "trunal.thakre@perennialsys.com"]
#
# sender password
# pswd = ""
# # subject of mail
# sub = "Report"
# # Body in mail
# message = "These are test reports for ---"
# # file name
# file = output_filename


def send_report(fromaddr, pswd, toaddr, file, filepath, sub="test_reports", message=""):
    # instance of MIMEMultipart
    msg = MIMEMultipart()

    # storing the senders email address
    msg['From'] = fromaddr

    # storing the receivers email address
    msg['To'] = toaddr

    # storing the subject
    msg['Subject'] = sub

    # string to store the body of the mail
    body = message

    # attach the body with the msg instance
    msg.attach(MIMEText(body, 'plain'))

    # open the file to be sent
    filename = file
    attachment = open(filepath, "rb")

    # instance of MIMEBase and named as p
    p = MIMEBase('application', 'octet-stream')

    # To change the payload into encoded form
    p.set_payload((attachment).read())

    # encode into base64
    encoders.encode_base64(p)

    p.add_header('Content-Disposition', "attachment; filename= %s" % filename)

    # attach the instance 'p' to instance 'msg'
    msg.attach(p)

    # creates SMTP session
    s = smtplib.SMTP('smtp.gmail.com', 587)

    # start TLS for security
    s.starttls()

    # Authentication
    s.login(fromaddr, pswd)

    # Converts the Multipart msg into a string
    text = msg.as_string()

    # sending the mail
    s.sendmail(fromaddr, toaddr, text)

    # terminating the session
    s.quit()


# for a in tolist:
#     send_report(fromaddr, pswd, a, file, fpath, sub, message)
