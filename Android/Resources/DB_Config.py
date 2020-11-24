import pypyodbc
##pip install  pypyodbc


'''

## this is just for reference
connection_string ='Driver={ODBC Driver 17 for SQL Server};Server=172.31.3.36;Database=GIP_UAT;Uid=qa_aloha;Pwd=qa_aloha@12;'
connection = pypyodbc.connect(connection_string)
SQL = 'SELECT * FROM OTP'
cur = connection.cursor()
cur.execute(SQL)
row = cur.fetchone()
print(row[5])
cur.close()
connection.close()
'''


def return_row(query, dbname, dbusername, dbpassword, dbhost, dbport=5432, dbdriver='MySQL ODBC 5.3 Unicode Driver'):
    connection_string = 'Driver={' + dbdriver + '};' + 'Server=' + str(dbhost) + ';Database=' + str(dbname) + ';Uid=' + str(dbusername) + ';Pwd=' + str(dbpassword) + ';'
    connection = pypyodbc.connect(connection_string)
    cur = connection.cursor()
    cur.execute(str(query))
    data = cur.fetchone()
    connection.close()
    return data


'''
#TODO
def connect_to_database(dbname, dbusername, dbpassword, dbhost, dbport=5432, dbdriver='{ODBC Driver 17 for SQL Server}'):
    connection_string = 'Driver=' + str(dbdriver) + ';' + 'Server=' + str(dbhost) + ';Database=' + str(dbname) + ';Uid=' + str(dbusername) + ';Pwd=' + str(dbpassword) + ';'
    print(connection_string)
    connection = pypyodbc.connect(connection_string)
    
    
def close_connection(connection):
    connection.close()


def run(connection, query):
    cursor = connection.cursor()
    cursor.execute(query)
    return cursor.fetchall()

data = return_row(query, dbname, dbusername, dbpassword, dbhost, dbport)
print(data)
'''