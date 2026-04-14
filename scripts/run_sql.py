import pyodbc
import os

server = os.environ['FABRIC_SQL_SERVER']
database = os.environ['FABRIC_DATABASE']
token = os.environ['ACCESS_TOKEN']

conn_str = f"Driver={{ODBC Driver 17 for SQL Server}};Server={server};Database={database};Encrypt=yes;TrustServerCertificate=no;"

conn = pyodbc.connect(conn_str, attrs_before={
    1256: bytes(token, 'utf-8')
})

cursor = conn.cursor()

with open('./sql/script.sql', 'r') as f:
    sql_script = f.read()

for stmt in sql_script.split(';'):
    if stmt.strip():
        cursor.execute(stmt)

conn.commit()
cursor.close()
conn.close()

print("SQL executed successfully 🚀")
