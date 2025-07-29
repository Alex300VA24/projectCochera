from models.consulta_model import obtener_datos
from views.gestion_view import GestionView

class GestionController:
    def __init__(self, page, contenedor_destino, datos_config):
        self.page = page
        self.contenedor = contenedor_destino
        self.datos_config = datos_config
        self.datos_originales = []
        self.mostrar_vista()
    
    def filtrar_datos(self, filtro):
        # filtro puede ser None o vacío
        filtro = filtro or ""
        resultado = []
        for fila in self.datos_originales:
            texto = " ".join(str(dato) for dato in fila)
            if filtro.lower() in texto.lower():
                resultado.append(fila)
        # Cada vez que se filtra, reconstruimos la vista con nuevos datos
        self.mostrar_vista(filtro=filtro)
        return resultado

    def mostrar_vista(self, filtro=""):
        if not self.datos_originales:
            self.datos_originales = obtener_datos(self.datos_config["consulta_sql"])

        datos_a_mostrar = [
            fila for fila in self.datos_originales
            if filtro.lower() in " ".join(str(d) for d in fila).lower()
        ] if filtro else self.datos_originales

        self.contenedor.content = GestionView(
            titulo=self.datos_config["titulo"],
            nombre_busqueda=self.datos_config["nombre_busqueda"],
            nombre_boton=self.datos_config["nombre_boton"],
            columnas=self.datos_config["columnas"],
            datos_tabla=datos_a_mostrar,
            on_buscar=self.filtrar_datos,
        )
        
        self.contenedor.update()
