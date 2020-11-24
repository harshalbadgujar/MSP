import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from email.mime.base import MIMEBase
from email import encoders
import shutil
from datetime import datetime

'''
[Documentation]
allow-less-secure from gmail settings - of sender 
also try disabling the two step verification --> if error encountered
'''

'''
This zip_folder keyword will Zip your 'Regression Result' directory with given input name and
    append's Date and Time at the end
    @returns --> The filename that is to be passed to the Send_Report Keyword
'''
def zip_folder(outfilename=''):
    now = datetime.now()
    dt_string = now.strftime("_Date:%d_%h_%y_Time:%H_%M")
    output_filename = outfilename + str(dt_string)
    shutil.make_archive(output_filename, 'zip', 'Regression Result')
    return str(output_filename) + '.zip'

'''
This Keyword send the report to using given creds to given Mail Address
  @params --> fromaddr, pswd, toaddr, file, filepath, sub="Test_reports", message=""
  @return --> VOID
'''

def send_report(fromaddr, pswd, toaddr, file, filepath, sub="Test_reports", message=""):
    msg = MIMEMultipart()
    msg['From'] = fromaddr
    msg['To'] = toaddr
    msg['Subject'] = sub
    body = message
    msg.attach(MIMEText(body, 'plain'))
    filename = file
    attachment = open(filepath, "rb")
    p = MIMEBase('application', 'octet-stream')
    p.set_payload((attachment).read())
    encoders.encode_base64(p)
    p.add_header('Content-Disposition', "attachment; filename= %s" % filename)
    msg.attach(p)
    s = smtplib.SMTP('smtp.gmail.com', 587)
    s.starttls()
    s.login(fromaddr, pswd)
    text = msg.as_string()
    s.sendmail(fromaddr, toaddr, text)
    s.quit()
    
zip_folder()
