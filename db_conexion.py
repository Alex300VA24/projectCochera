import mysql.connector


def connect_to_db():
    # Ajusta estos valores según tu configuración de MySQL
    return mysql.connector.connect(
        host="localhost",
        user="root",
        password="",
        database="cochera"
    )
