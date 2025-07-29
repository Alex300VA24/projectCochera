import mysql.connector

class LoginModel:
    def __init__(self):
        self.config = {
            "host": "localhost",
            "user": "root",
            "password": "",
            "database": "cochera"
        }

    def autenticar(self, dni, password):
        try:
            conn = mysql.connector.connect(**self.config)
            cursor = conn.cursor()

            salida = ""
            cursor.callproc('Login', (dni, password, salida))

            for result in cursor.stored_results():
                salida = result.fetchone()[0]

            return {"exito": salida != "No se encontró coincidencia", "mensaje": salida}

        except mysql.connector.Error as err:
            return {"exito": False, "mensaje": f"Error de conexión: {err}"}

        finally:
            try:
                cursor.close()
                conn.close()
            except:
                pass
