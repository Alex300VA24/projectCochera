# models/consulta_model.py
from db_conexion import connect_to_db

def obtener_datos(consulta_sql):
    conexion = connect_to_db()
    cursor = conexion.cursor()
    try:
        cursor.execute(consulta_sql)
        return cursor.fetchall()
    except Exception as e:
        print(f"Error al obtener datos: {e}")
        return []
    finally:
        conexion.close()
