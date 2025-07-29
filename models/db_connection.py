from db_connection import connect_to_db

class LoginModel:
    def autenticar(self, dni, password):
        try:
            conn = connect_to_db()
            cursor = conn.cursor()

            salida = ""
            cursor.callproc('Login', (dni, password, salida))

            for result in cursor.stored_results():
                salida = result.fetchone()[0]

            return {
                "exito": salida != "No se encontró coincidencia",
                "mensaje": salida
            }

        except Exception as err:
            return {
                "exito": False,
                "mensaje": f"Error de conexión: {err}"
            }

        finally:
            try:
                cursor.close()
                conn.close()
            except:
                pass
