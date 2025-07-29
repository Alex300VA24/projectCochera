from views.menu_view import MenuGui
from controllers.gestion_controller import GestionController

class MenuController:
    def __init__(self, page):
        self.page = page

        self.opciones = [
            ("images/cliente.png", "CLIENTE", self.abrir_cliente),
            ("images/vehiculo.png", "VEHICULO", self.abrir_vehiculo),
            ("images/espacios.png", "ESPACIOS", self.abrir_espacios),
            ("images/reservas.png", "RESERVAS", self.abrir_reservas),
            ("images/empleado.png", "EMPLEADO", self.abrir_empleado),
            ("images/pagos.png", "PAGOS Y TARIFAS", self.abrir_pago),
            ("images/historial.png", "HISTORIAL VEHICULO", self.abrir_historial),
            ("images/reembolso.png", "REFUNDS & RETURNS", self.abrir_reembolsos),
        ]

    def get_opciones(self):
        return self.opciones

    def handle_option(self, index):
        _, _, callback = self.opciones[index]
        callback()

    def show_snackbar(self, mensaje):
        from flet import SnackBar, Text
        self.page.snack_bar = SnackBar(Text(mensaje))
        self.page.snack_bar.open = True
        self.page.update()

    # Métodos por cada opción (puedes reemplazar los print por llamadas reales)
    def abrir_cliente(self):
        diccionario_datos = {
            'titulo':"CLIENTES",
            'nombre_busqueda':"Buscar Cliente",
            'nombre_boton':"Nuevo Cliente",
            'consulta_sql':"""SELECT * FROM CLIENTE""",
                            'columnas':["DNI", "Nombres", "Apellido Paterno", "Apellido Materno",
                                    "Telefono", "Dirección", "ID Clase Cliente"],
                            'columnas_db':["DNICliente", "Nombres", "ApePaterno", "ApeMaterno",
                                    "Telefono", "Dirección", "ClaseClienteID"]
        }
        GestionController(self.page, self.vista_dinamica_container, diccionario_datos)

    def abrir_vehiculo(self):
        diccionario_datos = {
            'titulo':"VEHICULOS",
            'nombre_busqueda':"Buscar Vehiculo",
            'nombre_boton':"Registrar Vehiculo",
            'consulta_sql':"""
            SELECT * FROM VEHICULO
            """,
        'columnas':["Placa", "DNI", "ID Tipo de Vehiculo", "Tarjeta de Propiedad"],
        'columnas_db':["Placa", "DNICliente", "TipoVehiculoID", "TarjetaPropiedad"]
        }
        GestionController(self.page, self.vista_dinamica_container, diccionario_datos)

    def abrir_espacios(self):
        diccionario_datos = {
            'titulo':"ESPACIOS DE ESTACIONAMIENTO",
            'nombre_busqueda':"Buscar Espacio de Estacionamiento",
            'nombre_boton':"Registrar Espacio de Estacionamiento",
            'consulta_sql':"""
            SELECT * FROM ESPACIOESTACIONAMIENTO
            """,
        'columnas':["ID", "ID Tipo de Espacio","Estado"],
        'columnas_db':["EspacioID", "TipoEspacioID","Estado"]   
        }
        GestionController(self.page, self.vista_dinamica_container, diccionario_datos)

    def abrir_reservas(self):
        diccionario_datos = {
            'titulo':"RESERVAS",
            'nombre_busqueda':"Buscar Reservas",
            'nombre_boton':"Registrar Reservas",
            'consulta_sql':"""
            SELECT * FROM RESERVA
            """,
        'columnas':["ID", "Fecha Inicio","Fecha Fin",
                  "DNI", "Placa", "ID Espacio"],
        'columnas_db':["ReservaID", "FechaInicio","FechaFin",
                  "DNICliente", "Placa", "EspacioId"]
        }
        GestionController(self.page, self.vista_dinamica_container, diccionario_datos)

    def abrir_empleado(self):
        diccionario_datos = {
            'titulo':"EMPLEADOS",
            'nombre_busqueda':"Buscar Empleados",
            'nombre_boton':"Registrar Empleados",
            'consulta_sql':"""
            SELECT * FROM Empleado
            """,
        'columnas':["DNI", "Nombres", "Apellido Paterno", "Apellido Materno",
                  "Telefono", "Direccion", "ID Puesto"],
        'columnas_db':["DNIEmpleado", "Nombres", "ApePaterno", "ApeMaterno",
                  "Telefono", "Direccion", "PuestoId"]
        }
        GestionController(self.page, self.vista_dinamica_container, diccionario_datos)

    def abrir_pago(self):
        diccionario_datos = {
            'titulo':"PAGOS",
            'nombre_busqueda':"Buscar Pagos",
            'nombre_boton':"Registrar Pago",
            'consulta_sql':"""
            SELECT * FROM PAGO
            """,
        'columnas':["ID", "Fecha Pago","ID Metodo de Pago","ID reserva","ID Tarifa","Monto"],
        'columnas_db':["PagoID", "FechaPago","MetodoPagoId","reservaId","TarifaId","Monto"]
        }
        GestionController(self.page, self.vista_dinamica_container, diccionario_datos)

    def abrir_historial(self):
        diccionario_datos = {
            'titulo':"HISTORIAL VEHICULO",
            'nombre_busqueda':"Buscar Historiales",
            'nombre_boton':"REGISTRAR HISTORIAL",
            'consulta_sql':"""
            SELECT * FROM HISTORIALVEHICULO
            """,
        'columnas':["ID", 
                  "Fecha Salida", "Fecha Ingreso", "Placa"],
        'columnas_db':["HistorialID", 
                  "FechaSalida", "FechaIngreso", "Placa"]
        }
        GestionController(self.page, self.vista_dinamica_container, diccionario_datos)

    def abrir_reembolsos(self):
        diccionario_datos = {
            'titulo':"REEMBOLSO",
            'nombre_busqueda':"Buscar Reembolso",
            'nombre_boton':"Registrar Reembolso",
            'consulta_sql':"""
            SELECT * FROM REEMBOLSO
            """,
        'columnas':["ID", "Fecha Reembolso","Monto Reembolso","ID Pago"],
        'columnas_db':["ReembolsoID", "FechaReembolso","MontoReembolso","PagoId"]
        }
        GestionController(self.page, self.vista_dinamica_container, diccionario_datos)
    
    def show_menu(self, page):
        page.clean()
        MenuGui(page, self)
    
    def set_contenedor_vista(self, contenedor):
        self.vista_dinamica_container = contenedor




# Esta función reemplaza el antiguo show_menu procedural
def show_menu(page):
    page.clean()
    controller = MenuController(page)
    MenuGui(page, controller)
