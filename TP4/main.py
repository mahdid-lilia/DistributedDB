import mysql.connector
import datetime
mydb= mysql.connector.connect(
    host="localhost",
    user="root",
    password="",
    database="weather"
)

mycursor = mydb.cursor()

# ****************************************************

# mycursor.execute("""
#                  CREATE TABLE weather_data (
#                      id int not NULL AUTO_INCREMENT,
#                      date DATE,
#                      temperature DECIMAL,
#                      humidity DECIMAL,
#                      valid_from DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
#                      valid_to DATETIME(6) NOT NULL DEFAULT '9999-12-31 23:59:59.999999',
#                      INDEX idx_valid (valid_from, valid_to),
#                      PRIMARY KEY(id)
#                      )""")
# ****************************************************
#  SQL= """INSERT INTO weather_data (date, temperature, humidity, valid_from, valid_to) VALUES ('2023-03-01', 12.5, 60.2, '2023-03-01 00:00:00.000000', '2023-03-01 23:59:59.999999')"""

# ****************************************************
# SQL = """INSERT INTO weather_data (date, temperature, humidity, valid_from,valid_to) VALUES ('2023-03-01', 14.3, 60.2, '2023-03-01
# 12:00:00.000000', '2023-03-01 23:59:59.999999')
# """
# ****************************************************

# today = datetime.date.today()
# today = today.strftime("%Y-%m-%d")

# SQL = f"""INSERT INTO weather_data (date, temperature, humidity, valid_from,valid_to) VALUES ('{today}', 14.3, 60.2, '2023-03-01
# 12:00:00.000000', '2023-03-01 23:59:59.999999')
# """
# ****************************************************
# query="select * from weather_data"
    
# mycursor.execute(query)
    
# rows=mycursor.fetchall()
    
# # print(rows)
# for row in rows:
#     for col in row:
#         print(col,end=' ')
#     print()
# ****************************************************

# mycursor.execute("""
#                  CREATE TABLE weather_snapshot(
#                      id int not NULL AUTO_INCREMENT,
#                      date DATE,
#                      temperature DECIMAL,
#                      humidity DECIMAL,
#                      timestamp DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
#                      valid_from DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
#                      valid_to DATETIME(6) NOT NULL DEFAULT '9999-12-31 23:59:59.999999',
#                      INDEX idx_valid (valid_from, valid_to),
#                      PRIMARY KEY(id)
#                      )""")

# ****************************************************

today = datetime.date.today()
today = today.strftime("%Y-%m-%d")
SQL= f""" INSERT INTO weather_snapshot (date, temperature, humidity) SELECT date, temperature, humidity FROM weather_data where date ='{today}' """
mycursor.execute(SQL)
mydb.commit()
mydb.close()

