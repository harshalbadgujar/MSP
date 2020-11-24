import pypyodbc
##pip install  pypyodbc

def return_row(query, dbname, dbusername, dbpassword, dbhost, dbport=5432, dbdriver='MySQL ODBC 5.3 Unicode Driver'):
    connection_string = 'Driver={' + dbdriver + '};' + 'Server=' + str(dbhost) + ';Database=' + str(dbname) + ';Uid=' + str(dbusername) + ';Pwd=' + str(dbpassword) + ';'
    connection = pypyodbc.connect(connection_string)
    cur = connection.cursor()
    cur.execute(str(query))
    data = cur.fetchone()
    #data = cur.fetchall()
    connection.close()
    return data

