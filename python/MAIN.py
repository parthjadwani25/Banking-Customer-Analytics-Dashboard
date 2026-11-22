import mysql.connector
import pandas as pd
connection = mysql.connector.connect(
    host="localhost",
    user="root",
    password="password",
    database="banking_case"
)

print("Connected to MySQL!")
print(connection.is_connected())


query="select * from customer"
df=pd.read_sql(query,connection)

print(20*"=HEAD()")
print(df.head())
 
print(20*"=SHAPE")
print(df.shape)

print(20*"=DTYPE")
print(df.dtypes)

print(20*"=DESCRIBE")
print(df.describe())

print(20*"=COLUMN_NAMES")
print(df.columns)

print(20*"=INFO")
print(df.info())


print(20*"=DESCRIBE=ALL")
print(df.describe(include="all"))
print(20*"=")

print(df.size)
print(20*"=")
print(df.ndim)
print(20*"=")
print(20*"=")
print(20*"=")